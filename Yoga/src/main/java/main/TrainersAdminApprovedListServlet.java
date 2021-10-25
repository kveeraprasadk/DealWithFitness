package main;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TrainersAdminApprovedListServlet
 */
@WebServlet(name = "/TrainersAdminApprovedListServlet", urlPatterns = "/AdminTrainersList")
public class TrainersAdminApprovedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		TrainerRequestDao trd = new TrainerRequestDao();
		List<TrainerDetailsVO> TrainersList;
		try {
			TrainersList = trd.TrainersList();
			request.setAttribute("TrainersList", TrainersList);			

			RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminTrainersData.jsp");
			dispatcher.forward(request, response);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
