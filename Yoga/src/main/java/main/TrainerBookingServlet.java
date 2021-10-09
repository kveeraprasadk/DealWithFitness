package main;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.common.Json;
import main.model.SeriesSchedulesVO;
import main.service.trainer.BookingService;

@WebServlet(name = "/TrainerBookingServlet", urlPatterns = "/TrainerBookings")
public class TrainerBookingServlet extends HttpServlet {
	private static Logger log = LogManager.getLogger("BookingServlet");

	private static final long serialVersionUID = 1L;
	private static final BookingService bookingService = new BookingService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("trainerId") != null) {
			Optional<Collection<SeriesSchedulesVO>> series = bookingService
					.getSeries(request.getParameter("trainerId"));
			if (series.isPresent()) {
				response.setContentType("application/json");
				response.getWriter().write(Json.stringify(series.get()));
			} else {
				response.setStatus(404); // not found trainer id
				response.getWriter().write("Trainer id not found");
			}
		} else {
			response.setStatus(400); // bad request status code when trainer id is not passed
			response.getWriter().write("Trainer id is mandatory to pass as request parameter");
		}
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
		try {
			if (request.getParameter("trainerId") != null && request.getParameter("seriesId") != null) {
				bookingService.delete(request.getParameter("trainerId"), request.getParameter("seriesId"),
						request.getParameter("scheduleId"));
			} else {
				response.setStatus(400); // bad request status code when trainer id is not passed
				response.getWriter().write("Trainer id and Series Id are mandatory to pass as request parameters");
			}
		} catch (Exception exp) {
			log.error("Exception", exp);
			response.setStatus(500);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean editMode = request.getParameter("edit") != null;
		try {
			if (editMode) {
				String trainerId = request.getParameter("trainerId");
				String seriesId = request.getParameter("seriesId");
				String title = request.getParameter("title");
				String location = request.getParameter("location");
				Float fee = Float.parseFloat(request.getParameter("fee") != null ? request.getParameter("fee") : null);
				String classLevel = request.getParameter("classLevel");

				if (trainerId != null && seriesId != null && (title != null || location != null) && fee != null) {
					log.info("Received update series: {} request for trainer: {}", seriesId, trainerId);
					bookingService.updateSeries(trainerId, seriesId, title, location, fee, classLevel);
				} else {
					response.setStatus(400); // bad request if trainer and series id not provided
					response.getWriter().write(
							"Mandatory to pass trainer id, series id and either/both title and location, fee and classLevel for update request to process");
				}
			} else {
				String payload = request.getParameter("schedules");
				if (payload != null) {
					SeriesSchedulesVO series = Json.parse(payload, SeriesSchedulesVO.class);
					log.info("Received new series: {}, payload of size: {} for tainer: {}", series.getId(),
							payload.length(), series.getTraineremail());

					bookingService.newSeries(series);
					log.info("new series: {} saved successfully for trainer: {}", series.getId(),
							series.getTraineremail());
					response.setStatus(201);
				}
			}
		} catch (Exception exp) {
			log.error("Exception", exp);
			response.setStatus(500);
		}
	}
}