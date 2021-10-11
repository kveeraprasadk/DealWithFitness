package main.service.trainer;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.core.type.TypeReference;

import main.common.DBConnection;
import main.common.Json;
import main.model.SeriesSchedulesVO;
import main.model.SeriesSchedulesVO.Schedule;

public class BookingService {
	private static Logger log = LogManager.getLogger("BookingService");
	private static final List<String> SERIES_COLUMNS_LIST = Arrays.asList("traineremail", "id", "title", "location",
			"startTime", "endTime", "endByDate", "selectedDayNames", "fee", "classLevel");
	private static final List<String> SCHEDULE_COLUMNS_LIST = Arrays.asList("trainerId", "id", "seriesId", "title",
			"location", "start", "end");
	private static final String SERIES_COLUMNS = SERIES_COLUMNS_LIST.stream().collect(Collectors.joining(","));
	private static final String SCHEDULE_COLUMNS = SCHEDULE_COLUMNS_LIST.stream().collect(Collectors.joining(","));
	private static final String SCHEDULE_SQL = "select ss.*, tb.*, tr.traineename from schedulesSeries ss left join traineeBookings tb "
			+ "on ss.traineremail =  tb.trainerId and ss.id = tb.seriesId left join traineeregister tr on tb.traineeId = tr.username "
			+ "where ss.traineremail = '%s'";
	private final Map holidays;

	public BookingService() {
		try {
			holidays = Json.parse(
					new String(Files.readAllBytes(Paths.get(this.getClass().getResource("/holidays.json").toURI()))),
					Map.class);
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
	}

	public Map getHolidays() {
		return holidays;
	}

	public Optional<Collection<SeriesSchedulesVO>> getSeries(String trainerId) {
		try (Connection con = DBConnection.createConnection()) {
			try (Statement statement = con.createStatement()) {
				try (ResultSet seriesRs = statement.executeQuery(String.format(SCHEDULE_SQL, trainerId))) {
					Map<String, SeriesSchedulesVO> trainerSeriesMap = new HashMap<>();
					while (seriesRs.next()) {
						Map<String, Object> seriesFields = new HashMap<>();
						for (String column : SERIES_COLUMNS_LIST) {
							if (column.equals("selectedDayNames")) {
								List<String> dayNames = Json.convert(seriesRs.getString(column),
										new TypeReference<List<String>>() {
										});
								seriesFields.put(column, dayNames);
							} else {
								seriesFields.put(column, seriesRs.getObject(column));
							}
						}
						String seriesId = seriesRs.getString("id");
						String trainee = seriesRs.getString("traineename");
						SeriesSchedulesVO series = trainerSeriesMap.computeIfAbsent(seriesId, seriesIdNotFound -> {
							return Json.convert(seriesFields, SeriesSchedulesVO.class);
						});
						// If trainee booked for this schedule series then add trainee name as attendee
						if (trainee != null) {
							series.getAttendees().add(trainee);
						}
					}

					// now fetch the schedules
					try (ResultSet schedulesRs = statement.executeQuery(String
							.format("select %s from schedules where trainerId = '%s'", SCHEDULE_COLUMNS, trainerId))) {
						while (schedulesRs.next()) {
							Map<String, Object> scheduleDetails = new HashMap<>();
							for (String column : SCHEDULE_COLUMNS_LIST) {
								scheduleDetails.put(column, schedulesRs.getObject(column));
							}
							// Assign the schedule to which series it belongs to
							Schedule schedule = Json.convert(scheduleDetails, Schedule.class);
							// If the schedule series is present in the series map then add this schedule to
							// that series
							if (trainerSeriesMap.containsKey(schedule.getSeriesId())) {
								SeriesSchedulesVO series = trainerSeriesMap.get(schedule.getSeriesId());
								List<Schedule> schedulesList = series.getSchedules();
								// Very first time schedule of the series would be empty hence set it
								if (schedulesList == null) {
									schedulesList = new ArrayList<>();
									series.setSchedules(schedulesList);
								}
								schedulesList.add(schedule);
							}
						}
					}
					return Optional.of(trainerSeriesMap.values());
				}
			}
		} catch (SQLException exp) {
			throw new IllegalArgumentException(exp);
		}
	}

	public void delete(String trainerId, String seriesId, String scheduleId) {
		try (Connection con = DBConnection.createConnection()) {
			con.setAutoCommit(false);
			try {
				if (scheduleId != null && scheduleId.trim().length() > 0) {
					deleteSeriesSchedule(con, trainerId, scheduleId);
				} else {
					deleteSeries(con, trainerId, seriesId, true);
				}
				con.commit();
			} catch (SQLException se) {
				con.rollback();
				throw new IllegalArgumentException(
						String.format("Failed while deleting series: %s, %s", seriesId, trainerId), se);
			} finally {
				con.setAutoCommit(true);
			}
		} catch (SQLException exp) {
			throw new IllegalArgumentException(
					String.format("Failed while deleting series: %s, %s", seriesId, trainerId), exp);
		}
	}

	private void deleteSeriesSchedule(Connection con, String trainerId, String scheduleId) throws SQLException {
		// Delete the schedules of the series
		try (PreparedStatement secheulePs = con
				.prepareStatement("delete from schedules where trainerId = ? and id = ?")) {
			secheulePs.setObject(1, trainerId);
			secheulePs.setObject(2, scheduleId);
			int schedulesCount = secheulePs.executeUpdate();
			log.info("trainer: {}, schedule id: {} has been deleted successfully,  schedules update count: {}",
					trainerId, scheduleId, schedulesCount);
		}
	}

	private void deleteSeries(Connection con, String trainerId, String seriesId, boolean dropFromBooking)
			throws SQLException {
		try (PreparedStatement ps = con
				.prepareStatement("delete from schedulesSeries where traineremail = ? and id = ?")) {
			ps.setObject(1, trainerId);
			ps.setObject(2, seriesId);
			int purgeCount = ps.executeUpdate();

			// Delete the schedules of the series
			try (PreparedStatement secheulePs = con
					.prepareStatement("delete from schedules where trainerId = ? and seriesId = ?")) {
				secheulePs.setObject(1, trainerId);
				secheulePs.setObject(2, seriesId);
				purgeCount += secheulePs.executeUpdate();

				if (dropFromBooking) {
					try (PreparedStatement bookingPs = con
							.prepareStatement("delete from traineeBookings where trainerId = ? and seriesId = ?")) {
						bookingPs.setObject(1, trainerId);
						bookingPs.setObject(2, seriesId);
						purgeCount += bookingPs.executeUpdate();
					}
				}
				log.info(
						"trainer: {}, seried id: {} has been deleted successfully, db series update count: {}, schedules update total count: {}",
						trainerId, seriesId, purgeCount, purgeCount);
			}
		}
	}

	public void updateSeries(String trainerId, String seriesId, String title, String location, float fee,
			String classLevel) throws SQLException {
		try (Connection con = DBConnection.createConnection()) {
			con.setAutoCommit(false);
			try (PreparedStatement ps = con.prepareStatement(
					"update schedulesSeries set title = ?, location = ?, fee = ?, classLevel = ? where traineremail = ? and id = ?")) {
				ps.setObject(1, title);
				ps.setObject(2, location);
				ps.setFloat(3, fee);
				ps.setString(4, classLevel);
				ps.setObject(5, trainerId);
				ps.setObject(6, seriesId);

				int seriesCount = ps.executeUpdate();

				// update the schedules of the series
				try (PreparedStatement secheulePs = con.prepareStatement(
						"update schedules set title = ?, location = ?  where trainerId = ? and seriesId = ?")) {
					secheulePs.setObject(1, title);
					secheulePs.setObject(2, location);
					secheulePs.setObject(3, trainerId);
					secheulePs.setObject(4, seriesId);
					int schedulesCount = secheulePs.executeUpdate();
					con.commit();
					log.info(
							"trainer: {}, seried id: {} has been updated successfully, db series update count: {}, schedules update count: {}",
							trainerId, seriesId, seriesCount, schedulesCount);
				} catch (SQLException e) {
					con.rollback();
					throw new IllegalArgumentException(e);
				}
			} finally {
				con.setAutoCommit(true);
			}
		}
	}

	public void newSeries(SeriesSchedulesVO series) {
		List<? extends Object> params = Arrays.asList(series.getTraineremail(), series.getId(), series.getTitle(),
				series.getLocation(), series.getStartTime(), series.getEndTime(), series.getEndByDate(),
				Json.stringify(series.getSelectedDayNames()), series.getFee(), series.getClassLevel());

		try (Connection con = DBConnection.createConnection()) {
			// We are going to use batch insert
			con.setAutoCommit(false);
			// If the new series is created due to the changes to old series then transition
			// id will be there
			// to be deleted from the db, hence remove the old one, if everything is
			// successful commit the transaction
			if (series.getSeriesTransitionFromId() != null) {
				// here false indicates the trainee bookings related to this series should be
				// retained
				// We are generating new series and its schedules only due to update happened at
				// UI side.
				deleteSeries(con, series.getTraineremail(), series.getSeriesTransitionFromId(), false);
			}

			try (PreparedStatement seriesPs = con.prepareStatement(String.format(
					"insert into schedulesSeries (%s) values(?, ?, ?, ? , ?, ?, ?, ?, ?, ?)", SERIES_COLUMNS))) {
				for (int index = 0; index < params.size(); index++) {
					seriesPs.setObject(index + 1, params.get(index));
				}
				// send update to database
				seriesPs.executeUpdate();
				// Once the series details are inserted then insert its schedule
				try (PreparedStatement schedulePs = con.prepareStatement(
						String.format("insert into schedules (%s) values(?, ?, ?, ? , ?, ?, ?)", SCHEDULE_COLUMNS))) {
					// Series will have more than one schedule if its recurring schedule hence
					// insert record per schedule
					for (Schedule schedule : series.getSchedules()) {
						List<? extends Object> schedulesParams = Arrays.asList(series.getTraineremail(),
								schedule.getId(), series.getId(), schedule.getTitle(), schedule.getLocation(),
								schedule.getStart(), schedule.getEnd());
						for (int index = 0; index < schedulesParams.size(); index++) {
							schedulePs.setObject(index + 1, schedulesParams.get(index));
						}
						schedulePs.addBatch();
					}
					int total = Arrays.stream(schedulePs.executeBatch()).sum();

					// Finally commit transaction
					con.commit();
					log.info("For trainer: {}, series: {} schedules saved successfully with size: {}",
							series.getTraineremail(), series.getId(), total);
				} catch (SQLException e) {
					con.rollback();
					throw new IllegalArgumentException(String.format("Failed while inserting series: %s, %s",
							series.getId(), series.getTraineremail()), e);
				}
			} finally {
				con.setAutoCommit(true);
			}
		} catch (SQLException exp) {
			throw new IllegalArgumentException(
					String.format("Failed while inserting series: %s, %s", series.getId(), series.getTraineremail()),
					exp);
		}
	}
}