package main.service.trainer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;

import main.common.AppUtils;
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
	private static final String TIMING_CONDITION = " CONVERT(DATE_FORMAT(CONVERT_TZ(FROM_UNIXTIME(ss.startTime/1000), '+00:00', '#o'), '%H%i'),  UNSIGNED INTEGER) >= #s and "
			+ "    CONVERT(DATE_FORMAT(CONVERT_TZ(FROM_UNIXTIME(ss.startTime/1000), '+00:00', '#o'), '%H%i'),  UNSIGNED INTEGER) <= #e ";
	private static final String SQL = " select tr.traineremail, tr.trainername, tr.experience, tr.qualification, tr.expertise, ss.id as seriesId, ss.startTime, ss.endTime, ss.endByDate, ss.selectedDayNames, "
			+ "	ss.fee, ss.classlevel, ss.title, ss.location, ss.expertise as ssExpertise, ss.demoClass, tb.traineeId  from (select * from trainerregister where adminapprove = true) tr "
			+ " left join schedulesSeries ss on tr.traineremail =  ss.traineremail left join traineeBookings tb on "
			+ "		ss.traineremail = tb.trainerId and ss.id = tb.seriesId %s order by ISNULL(fee), fee %s";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String filterByExpertise = request.getParameter("filterByExpertise");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String tzOffset = request.getParameter("tzOffset");
		String sortOrder = request.getParameter("sort");

		if (sortOrder == null) {
			response.setStatus(400);
			response.getWriter().write("sort is mandantory to pass.");
			return;
		} else if (startTime != null && endTime == null || endTime != null && startTime == null) {
			response.setStatus(400);
			response.getWriter().write("startTime, endTime and tzOffset are required if any one of them passed.");
			return;
		}

		StringBuilder whereClause = new StringBuilder();
		if (filterByExpertise != null || startTime != null) {
			whereClause.append(" where ");
			if (filterByExpertise != null) {
				whereClause.append(String.format(" ss.expertise = '%s' ", filterByExpertise));
			}
			if (startTime != null) {
				if (filterByExpertise != null) {
					whereClause.append(" and ");
				}

				whereClause.append(getTimingsSqlWhereClass(startTime, endTime, tzOffset));
			}
		}

		// If filter is passed then change the sql to add where clause
		String sql = new String(String.format(SQL, whereClause.toString(), sortOrder));
		try (Connection connection = DBConnection.createConnection()) {
			try (Statement statement = connection.createStatement()) {

				try (ResultSet rs = statement.executeQuery(sql)) {
					// Maintaining this map to keep only unique series for a trainer as the
					// TrainerDetailsVO schedule series field
					// are in list to get the unique series maintaining a map is fine for now
					Map<String, SeriesSchedulesVO> schedulesSeriesByTrainer = new LinkedHashMap<>();
					while (rs.next()) {
						// If trainer configures the calendar schedule series then series information
						// will be available. also add the trainee subscribed for a schedule series
						if (rs.getString("seriesId") != null) {
							// very first time add schedule series and trainer for that schedule series
							// Consecutive times its only attendees change so add it.
							SeriesSchedulesVO scheduleSeries = schedulesSeriesByTrainer.computeIfAbsent(rs.getString("seriesId"), seriesNotFound -> {
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
									// If series level overriden is there for expertise
									seriesVo.setExpertise(rs.getString("ssExpertise"));
									seriesVo.setDemoClass(rs.getBoolean("demoClass"));

									seriesVo.setClassLevel(rs.getString("classlevel"));
									List<String> dayNames = Json.convert(rs.getString("selectedDayNames"), new TypeReference<List<String>>() {
									});
									seriesVo.setSelectedDayNames(dayNames);

									TrainerDetailsVO trainerDetails = new TrainerDetailsVO();
									trainerDetails.setName(rs.getString("trainername"));
									trainerDetails.setEmail(rs.getString("traineremail"));
									trainerDetails.setExperience(rs.getString("experience"));
									trainerDetails.setQualification(rs.getString("qualification"));
									trainerDetails.setExpertise(rs.getString("expertise"));

									seriesVo.setTrainer(trainerDetails);
									return seriesVo;
								} catch (SQLException e) {
									throw new IllegalArgumentException(e);
								}
							});
							if (rs.getString("traineeId") != null) {
								scheduleSeries.getAttendees().add(rs.getString("traineeId"));
							}
						} else {
							SeriesSchedulesVO seriesVo = new SeriesSchedulesVO();
							TrainerDetailsVO trainerDetails = new TrainerDetailsVO();
							trainerDetails.setName(rs.getString("trainername"));
							trainerDetails.setEmail(rs.getString("traineremail"));
							trainerDetails.setExperience(rs.getString("experience"));
							trainerDetails.setQualification(rs.getString("qualification"));
							trainerDetails.setExpertise(rs.getString("expertise"));
							seriesVo.setTrainer(trainerDetails);
							// Just create dummy id so that we can add to map, this id has no significant.
							schedulesSeriesByTrainer.put(UUID.randomUUID().toString(), seriesVo);
						}
					}

					response.setContentType("application/json");
					response.getWriter().write(Json.stringify(schedulesSeriesByTrainer.values()));
				}
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw new IllegalArgumentException(e);
		}
	}

	private String getTimingsSqlWhereClass(String startTime, String endTime, String tzOffset) {
		try {
			String sTimeHourMinute = AppUtils.getTimeWithCallerTz(startTime, tzOffset);
			String eTimeHourMinute = AppUtils.getTimeWithCallerTz(endTime, tzOffset);
			// We are not using String.format because of %i is present in the sql which
			// causing problems to String.format()
			return TIMING_CONDITION.replace("#s", sTimeHourMinute).replace("#e", eTimeHourMinute).replace("#o", tzOffset);
		} catch (ParseException e) {
			throw new IllegalArgumentException(e);
		}
	}
}
