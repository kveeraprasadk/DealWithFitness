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
 * Servlet implementation class TraineeAdminApprovedListServlet
 */
@WebServlet(name = "/TraineeAdminApprovedListServlet", urlPatterns = "/AdminTraineesList")
public class TraineeAdminApprovedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		TrainerRequestDao trd = new TrainerRequestDao();
		List<TrainerDetailsVO> TraineesList;
		try {
			TraineesList = trd.TraineesList();
			request.setAttribute("TraineesList", TraineesList);		

			RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminTraineesData.jsp");
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

