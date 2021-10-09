package main.service.trainer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;

import main.common.DBConnection;
import main.common.Json;
import main.model.SeriesSchedulesVO;
import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TrainersListServlet
 */
@WebServlet(name = "/TrainersListServlet", urlPatterns = "/Trainers")
public class TrainersListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SQL = " select tr.traineremail, tr.trainername, tr.experience, tr.qualification, tr.expertise, ss.id as seriesId, ss.startTime, ss.endTime, ss.endByDate, ss.selectedDayNames, "
			+ "	ss.fee, ss.classlevel, ss.title, ss.location, tb.traineeId  from trainerregister tr left join schedulesSeries ss on tr.traineremail =  ss.traineremail left join traineeBookings tb on "
			+ "		ss.traineremail = tb.trainerId and ss.id = tb.seriesId %s	order by seriesId desc";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		boolean isJsonResponse = request.getParameter("jsonResponse") != null
				&& request.getParameter("jsonResponse").equals("true") ? true : false;
		String filterByExpertise = request.getParameter("filterByExpertise");

		// If filter is passed then change the sql to add where clause
		String sql = new String(SQL);
		sql = filterByExpertise != null ? String.format(sql, " where expertise = ?") : String.format(sql, " ");
		PrintWriter out = response.getWriter();

		try (Connection connection = DBConnection.createConnection()) {
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
				// if filter is set then use it
				if (filterByExpertise != null) {
					statement.setObject(1, request.getParameter("filterByExpertise"));
				}
				try (ResultSet rs = statement.executeQuery()) {
					Map<String, TrainerDetailsVO> trainers = new LinkedHashMap<>();
					// Maintaining this map to keep only unique series for a trainer as the
					// TrainerDetailsVO schedule series field
					// are in list to get the unique series maintaining a map is fine for now
					Map<String, SeriesSchedulesVO> trainerSeries = new LinkedHashMap<>();
					while (rs.next()) {
						String traineremail = rs.getString("traineremail");
						TrainerDetailsVO trainer = trainers.computeIfAbsent(traineremail, traineremailNotFound -> {
							TrainerDetailsVO trainerDetails = new TrainerDetailsVO();
							try {
								trainerDetails.setName(rs.getString("trainername"));
								trainerDetails.setEmail(rs.getString("traineremail"));
								trainerDetails.setExperience(rs.getString("experience"));
								trainerDetails.setQualification(rs.getString("qualification"));
								trainerDetails.setExpertise(rs.getString("expertise"));
								return trainerDetails;
							} catch (SQLException e) {
								throw new IllegalArgumentException(e);
							}
						});

						// If trainer configures the calendar schedule series then series information
						// will be available. also add the trainee subscribed for a schedule series
						if (rs.getString("seriesId") != null) {
							SeriesSchedulesVO scheduleSeries = trainerSeries.computeIfAbsent(rs.getString("seriesId"),
									seriesNotFound -> {
										SeriesSchedulesVO seriesVo = new SeriesSchedulesVO();
										try {
											seriesVo.setId(rs.getString("seriesId"));
											seriesVo.setTitle(rs.getString("title"));
											seriesVo.setLocation(rs.getString("location"));
											seriesVo.setTraineremail(rs.getString("traineremail"));
											seriesVo.setStartTime(rs.getLong("startTime"));
											seriesVo.setEndTime(rs.getLong("endTime"));
											seriesVo.setEndByDate(rs.getLong("endByDate"));
											seriesVo.setFee(rs.getFloat("fee"));
											seriesVo.setClassLevel(rs.getString("classlevel"));
											List<String> dayNames = Json.convert(rs.getString("selectedDayNames"),
													new TypeReference<List<String>>() {
													});
											seriesVo.setSelectedDayNames(dayNames);
											// Very first time store in trainer in other cases for this series only
											// attending trainees are added
											trainer.getSeries().add(seriesVo);
											return seriesVo;
										} catch (SQLException e) {
											throw new IllegalArgumentException(e);
										}
									});
							if (rs.getString("traineeId") != null) {
								scheduleSeries.getAttendees().add(rs.getString("traineeId"));
							}
						}

						/*
						 * Blob blob = rs.getBlob("photo");
						 * 
						 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
						 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
						 * int bytesRead = -1;
						 * 
						 * while ((bytesRead = inputStream.read(buffer)) != -1) {
						 * outputStream.write(buffer, 0, bytesRead); }
						 * 
						 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
						 * Base64.getEncoder().encodeToString(imageBytes);
						 * 
						 * details.setBase64Image(base64Image);
						 * 
						 * 
						 * inputStream.close(); outputStream.close();
						 */
						// Adding the Student Object to List
						// fos.close();
					}
					// String userJsonString = this.gson.toJson(TrainersList);
					// String str1="success";
					// out.write(userJsonString);
					if (isJsonResponse) {
						response.setContentType("application/json");
						response.getWriter().write(Json.stringify(trainers.values()));
					} else {
						out.write("success");
						request.setAttribute("AllTrainersList", new ArrayList<>(trainers.values()));
						request.getRequestDispatcher("/class.jsp").forward(request, response);
					}
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new IllegalArgumentException(e);
		}
	}

}
