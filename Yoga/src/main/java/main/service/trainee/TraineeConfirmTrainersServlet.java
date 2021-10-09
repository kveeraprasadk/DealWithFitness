package main.service.trainee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.common.DBConnection;

/**
 * Servlet implementation class TraineeConfirmTrainersServlet
 */
@WebServlet(name = "/TraineeConfirmTrainersServlet", urlPatterns = "/TraineecofirmTrainer")
public class TraineeConfirmTrainersServlet extends HttpServlet {
	private static final Logger log = LogManager.getLogger("TraineeConfirmTrainersServlet");
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String traineeEmailId = (String) request.getParameter("traineeEmailId");
		String traineremailid = (String) request.getParameter("traineremailid");
		String trainerschedule = (String) request.getParameter("seriesId");

		if (traineeEmailId != null && traineremailid != null && trainerschedule != null) {
			try (Connection con = DBConnection.createConnection()) {
				try (PreparedStatement ps = con.prepareStatement(
						"replace into traineeBookings set trainerId = ?, traineeId = ?, seriesId = ?")) {
					ps.setString(1, traineremailid);
					ps.setString(2, traineeEmailId);
					ps.setString(3, trainerschedule);
					int count = ps.executeUpdate();
					log.info("Trainee booking successful: trainee: {}, tainer: {}, schedule: {}, count: {}",
							traineeEmailId, traineremailid, trainerschedule, count);
					response.sendRedirect("traineelandingpage.jsp");
				}
			} catch (SQLException exp) {
				log.info("Exception", exp);
			}
		} else {
			response.setStatus(400);
			response.getWriter().write("Invalid booking, trainer id, trainee id and series id is mandatory to pass");
		}
	}

}
