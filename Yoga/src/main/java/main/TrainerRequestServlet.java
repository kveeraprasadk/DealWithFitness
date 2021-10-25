package main;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.TraineeStory;
import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TrainerRequestServlet
 */
@WebServlet(name = "/TrainerRequestServlet", urlPatterns = "/AdminPageView")
public class TrainerRequestServlet extends HttpServlet {
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
		List<TrainerDetailsVO> TrainerRequests;
		// List<TrainerDetailsVO> TrainersList;
	//	List<TrainerDetailsVO> TraineesList;
		List<TraineeStory> TraineeStoryRequests;
		try {
			TrainerRequests = trd.TrainersRequests();
			request.setAttribute("TrainerRequests", TrainerRequests);

	//		TrainersList = trd.TrainersList();
	//		request.setAttribute("TrainersList", TrainersList);

	//		TraineesList = trd.TraineesList();
	//		request.setAttribute("TraineesList", TraineesList);

			TraineeStoryRequests = trd.TraineeStoryRequest();
			request.setAttribute("TraineeStoryRequest", TraineeStoryRequests);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/AdminPage.jsp");
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
