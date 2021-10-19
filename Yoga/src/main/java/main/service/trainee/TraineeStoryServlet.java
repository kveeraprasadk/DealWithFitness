package main.service.trainee;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");

		String traineeId = request.getParameter("traineeId");
		String photosOfStoryId = request.getParameter("photosOfStoryId");

		if (traineeId != null) {
			try (Connection con = DBConnection.createConnection()) {
				try (Statement query = con.createStatement()) {
					// if story id is passed mean only photos are required
					if (photosOfStoryId == null) {
						String sql = String.format("select ts.traineeId, tr.trainername, ts.storyId, ts.story, ts.adminapprove, ts.creationTime,"
								+ " !isNull(ts.photo1) as isPhoto1, !isNull(ts.photo2) isPhoto2"
								+ " from traineeStories ts, trainerregister tr where ts.trainerId = tr.traineremail and ts.traineeId='%s' order by creationTime desc limit 0,10",
								traineeId);
						try (ResultSet rs = query.executeQuery(sql)) {
							List<TraineeStory> data = new ArrayList<TraineeStory>();
							while (rs.next()) {
								TraineeStory story = new TraineeStory();
								story.setTraineeId(rs.getString("traineeId"));
								story.setTrainerName(rs.getString("trainername"));
								story.setStoryId(rs.getString("storyId"));
								story.setStory(rs.getString("story"));
								story.setAdminapprove(rs.getBoolean("adminapprove"));
								story.setCreationTime(rs.getLong("creationTime"));
								story.setHasPhotos(rs.getBoolean("isPhoto1") || rs.getBoolean("isPhoto2"));
								data.add(story);
							}
							response.getWriter().write(Json.stringify(data));
						}
					} else {
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
					}
				}
			} catch (Exception e) {
				response.setStatus(500);
				log.error("Exception", e);
			}
		}
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

		String update = "insert into traineeStories (traineeId, trainerId, storyId, story, adminapprove, photo1, photo2, creationTime) values(?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = DBConnection.createConnection()) {
			try (PreparedStatement statement = con.prepareStatement(update)) {
				statement.setString(1, traineeId);
				statement.setString(2, trainerId);
				statement.setString(3, storyId);
				statement.setString(4, story);
				statement.setBoolean(5, false);

				if (firstPhoto != null && firstPhoto.getSize() > 0) {
					statement.setBlob(6, firstPhoto.getInputStream());
				} else {
					statement.setBinaryStream(6, null);
				}
				if (secondPhoto != null && secondPhoto.getSize() > 0) {
					statement.setBlob(7, secondPhoto.getInputStream());
				} else {
					statement.setBinaryStream(7, null);
				}
				statement.setLong(8, System.currentTimeMillis());
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