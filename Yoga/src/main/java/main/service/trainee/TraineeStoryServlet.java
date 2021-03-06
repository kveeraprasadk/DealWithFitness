package main.service.trainee;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.common.AppUtils;
import main.common.DBConnection;
import main.common.Json;
import main.model.TraineeStory;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100)
public class TraineeStoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LogManager.getLogger("TraineeStoryServlet");

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// trainer id and traineeId are mutually exclusive
		String trainerId = request.getParameter("trainerId");
		String traineeId = request.getParameter("traineeId");
		String photosOfStoryId = request.getParameter("photosOfStoryId");
		String onlyApproved = request.getParameter("onlyApproved");
		String includeUniqueTrainers = request.getParameter("includeUniqueTrainers");

		// Validate the parameters
		if (trainerId != null && traineeId != null) {
			response.setStatus(400);
			response.getWriter().write("trainerId and traineeId are mutually exclusive");
			return;
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");

		log.info("Stories Request Details: traineeId: {}, trainer: {}, photoStoryId: {}, onlyApproved: {}, includeUniqueTrainers: {}", traineeId, trainerId, photosOfStoryId, onlyApproved, includeUniqueTrainers);
		try (Connection con = DBConnection.createConnection()) {
			try (Statement query = con.createStatement()) {
				// Send unique trainer found in trainee stories table
				if (traineeId != null && photosOfStoryId != null) {
					// Request is to get photos of a story
					String sql = String.format("select photo1, photo2 from traineeStories where traineeId = '%s' and storyId = '%s'", traineeId, photosOfStoryId);
					try (ResultSet rs = query.executeQuery(sql)) {
						if (rs.next()) {
							Map<String, String> photosMap = new HashMap<>();
							Blob blob = rs.getBlob(1);
							if (blob != null) {
								String photo = AppUtils.asBlobEncoded(blob);
								photosMap.put("photo1", "data:image/*;base64," + photo);
							}
							blob = rs.getBlob(2);
							if (blob != null) {
								String photo = AppUtils.asBlobEncoded(blob);
								photosMap.put("photo2", "data:image/*;base64," + photo);
							}
							response.getWriter().write(Json.stringify(photosMap));
						}
					}
				} else if (traineeId != null || trainerId != null || onlyApproved != null) {
					// Request is to get stories of a trainee or stories of a trainer
					String sql = getSQL(trainerId, traineeId, onlyApproved);
					try (ResultSet rs = query.executeQuery(sql)) {
						Map<String, Object> responseMap = new HashMap<String, Object>();
						List<TraineeStory> data = new ArrayList<TraineeStory>();
						while (rs.next()) {
							data.add(asStory(rs));
						}
						if (includeUniqueTrainers != null) {
							Map<String, String> trainersDetails = getUniqueTrainers(query);
							responseMap.put("trainers", trainersDetails);
						}
						responseMap.put("stories", data);
						response.getWriter().write(Json.stringify(responseMap));
					}

				} else {
					response.setStatus(400);
					response.getWriter().write("Trainee Id is mandatory to get photos");
				}
			}
		} catch (Exception e) {
			response.setStatus(500);
			log.error("Exception", e);
		}
	}

	private Map<String, String> getUniqueTrainers(Statement query) throws SQLException {
		String sql = "select distinct ts.trainerId, tr.trainername from traineeStories ts, trainerregister tr where ts.trainerId = tr.traineremail and ts.adminapprove = true";
		Map<String, String> data = new HashMap<String, String>();
		try (ResultSet rs = query.executeQuery(sql)) {
			while (rs.next()) {
				data.put(rs.getString("trainerId"), rs.getString("trainername"));
			}
		}
		return data;
	}

	private String getSQL(String trainerId, String traineeId, String onlyApproved) {
		// Note: trainer where clause and trainee where clause are mutually exclusive
		String trainerWhereClause = trainerId == null ? "" : String.format(" and ts.trainerId = '%s' ", trainerId);
		String traineeWhereClause = traineeId == null ? "" : String.format(" and ts.traineeId = '%s' ", traineeId);
		String onlyApprovedClause = onlyApproved == null ? "" : String.format(" and ts.adminapprove = true ", traineeId);
		return String.format("select ts.traineeId, ti.traineename, tr.trainername, ts.storyId, ts.story, ts.adminapprove, ts.creationTime, !isNull(ts.photo1) as isPhoto1,"
				+ " !isNull(ts.photo2) isPhoto2 from traineeStories ts, trainerregister tr, traineeregister ti where ts.trainerId = tr.traineremail"
				+ " and ts.traineeId = ti.username  %s %s %s order by creationTime desc limit 0,50", trainerWhereClause, traineeWhereClause, onlyApprovedClause);
	}

	private TraineeStory asStory(ResultSet rs) throws SQLException {
		TraineeStory story = new TraineeStory();
		story.setTraineeId(rs.getString("traineeId"));
		story.setTraineeName(rs.getString("traineename"));
		story.setTrainerName(rs.getString("trainername"));
		story.setStoryId(rs.getString("storyId"));
		story.setStory(rs.getString("story"));
		story.setAdminapprove(rs.getBoolean("adminapprove"));
		story.setCreationTime(rs.getLong("creationTime"));
		story.setHasPhotos(rs.getBoolean("isPhoto1") || rs.getBoolean("isPhoto2"));
		return story;
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String storyId = request.getParameter("storyId");
		if (storyId != null) {
			log.info("About to delete story: {}", storyId);
			try (Connection con = DBConnection.createConnection()) {
				try (PreparedStatement query = con.prepareStatement("delete from traineeStories where storyId = ?")) {
					query.setString(1, storyId);
					int result = query.executeUpdate();
					log.info("Story deleted: {}", result);
				}
			} catch (Exception e) {
				response.setStatus(500);
				log.error("Exception", e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trainerId = request.getParameter("trainerId");
		String traineeId = request.getParameter("traineeId");
		String story = request.getParameter("story");
		Part firstPhoto = request.getPart("firstPhoto");
		Part secondPhoto = request.getPart("secondPhoto");
		String storyId = UUID.randomUUID().toString();

		log.info("Trainee: {} story submitted for trainer: {} and assigned story id is: {}", traineeId, trainerId, storyId);

		String update = "insert into traineeStories (traineeId, trainerId, storyId, story, adminapprove, photo1, filename1, photo2, filename2, creationTime) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = DBConnection.createConnection()) {
			try (PreparedStatement statement = con.prepareStatement(update)) {
				statement.setString(1, traineeId);
				statement.setString(2, trainerId);
				statement.setString(3, storyId);
				statement.setString(4, story);
				statement.setBoolean(5, false);

				if (firstPhoto != null && firstPhoto.getSize() > 0) {
					statement.setBlob(6, firstPhoto.getInputStream());

					String fileName1 = AppUtils.getFileNameFromFormPart(firstPhoto);
					statement.setString(7, fileName1);
				} else {
					statement.setBinaryStream(6, null);
					statement.setString(7, "");
				}
				if (secondPhoto != null && secondPhoto.getSize() > 0) {
					statement.setBlob(8, secondPhoto.getInputStream());

					String fileName2 = AppUtils.getFileNameFromFormPart(secondPhoto);
					statement.setString(9, fileName2);
				} else {
					statement.setBinaryStream(8, null);
					statement.setString(9, "");
				}
				statement.setLong(10, System.currentTimeMillis());
				int count = statement.executeUpdate();
				log.info("Story of trainee: {} on trainer: {} stored with update count: {}", trainerId, traineeId, count);
			}
			response.sendRedirect("viewtestimonials.jsp");
		} catch (Exception ex) {
			log.error("Exception while inserting trainee story", ex);
			response.setStatus(500);
		}
	}
}