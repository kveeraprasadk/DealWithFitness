package main.service.trainee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.core.type.TypeReference;

import main.common.DBConnection;
import main.common.Json;
import main.model.SeriesSchedulesVO;
import main.model.TrainerDetailsVO;

@WebServlet(name = "/TraineeBookingsServlet", urlPatterns = "/traineeBookings")
public class TraineeBookingsServlet extends HttpServlet {
	private static final Logger log = LogManager.getLogger("TraineeBookingsServlet");
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String traineeEmailId = request.getParameter("traineeId");
		// If caller wants only list of trainers for a given trainee's the return only
		// trainers but not trainer bookings
		boolean filterUniqueTrainers = request.getParameter("uniqueTrainers") != null ? true : false;
		if (traineeEmailId != null) {
			try (Connection con = DBConnection.createConnection()) {
				response.setContentType("application/json");
				if (filterUniqueTrainers) {
					try (PreparedStatement qps = con.prepareStatement(
							"select trainername, traineremail from trainerregister where traineremail in (select distinct trainerId from traineeBookings where traineeId = ?)")) {
						List<Map<String, String>> trainers = new ArrayList<Map<String, String>>();
						qps.setString(1, traineeEmailId);
						try (ResultSet rs = qps.executeQuery()) {
							while (rs.next()) {
								Map<String,String> details = new HashMap<String, String>();
								details.put("name", rs.getString("trainername"));
								details.put("email", rs.getString("traineremail"));
								trainers.add(details);
							}
						}
						response.getWriter().write(Json.stringify(trainers));
					}
				} else {
					response.getWriter().write(Json.stringify(getTrainersBookings(traineeEmailId, con)));
				}

			} catch (SQLException e) {
				log.error("Exception", e);
				response.setStatus(500);
				response.getWriter().write("Unable to process request");
			}
		} else {
			response.setStatus(400);
			response.getWriter().write("Trainee id is mandatory");
		}
	}

	private Collection<TrainerDetailsVO> getTrainersBookings(String traineeEmailId, Connection con) throws SQLException {
		try (PreparedStatement qps = con.prepareStatement(
				"select ss.*, tr.trainername from traineeBookings tb, schedulesSeries ss, trainerregister tr  where tb.trainerId = ss.traineremail and tb.trainerId = tr.traineremail and tb.seriesId = ss.Id and traineeId = ?")) {
			qps.setString(1, traineeEmailId);
			Map<String, TrainerDetailsVO> trainers = new HashMap<>();

			try (ResultSet rs = qps.executeQuery()) {
				while (rs.next()) {
					String trainerId = rs.getString("traineremail");
					String trainerName = rs.getString("trainername");
					TrainerDetailsVO trainerDetails = trainers.computeIfAbsent(trainerId, trainerIdNotFound -> {
						TrainerDetailsVO trainer = new TrainerDetailsVO();
						trainer.setName(trainerName);
						trainer.setEmail(trainerId);
						return trainer;
					});

					SeriesSchedulesVO series = new SeriesSchedulesVO();
					series.setId(rs.getString("id"));

					series.setTraineremail(trainerName);
					series.setTitle(rs.getString("title"));
					series.setLocation(rs.getString("location"));
					series.setStartTime(rs.getLong("startTime"));
					series.setEndTime(rs.getLong("endTime"));
					series.setFee(rs.getFloat("fee"));
					series.setClassLevel(rs.getString("classLevel"));
					series.setEndByDate(rs.getLong("endByDate"));
					series.setTrainerPreference(rs.getString("trainerPreference") != null ? rs.getString("trainerPreference") : "All");
					series.setExpertise(rs.getString("expertise"));
					series.setDemoClass(rs.getBoolean("demoClass"));
					List<String> selectedDayNames = rs.getString("selectedDayNames") != null ? Json.convert(rs.getString("selectedDayNames"), new TypeReference<List<String>>() {
					}) : null;
					series.setSelectedDayNames(selectedDayNames);
					trainerDetails.getSeries().add(series);
				}
				return trainers.values();
			}
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String traineeEmailId = request.getParameter("traineeId");
		String seriesId = request.getParameter("seriesId");
		if (traineeEmailId != null && seriesId != null) {
			try (Connection con = DBConnection.createConnection()) {
				try (PreparedStatement qps = con.prepareStatement("delete from traineeBookings where traineeId = ? and seriesId = ?")) {
					qps.setString(1, traineeEmailId);
					qps.setString(2, seriesId);
					int count = qps.executeUpdate();
					log.info("Trainee: {} booking: {}, count: {}, has been deleted", traineeEmailId, seriesId, count);
				}
			} catch (SQLException e) {
				log.error("Exception", e);
				response.setStatus(500);
				response.getWriter().write("Unable to process request");
			}
		} else {
			response.setStatus(400);
			response.getWriter().write("Trainee id and series id is mandatory to pass");
		}
	}
}
