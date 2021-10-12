package main.service.trainee;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.AppConstants;
import main.common.DBConnection;
import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TraineeProfileViewServlet
 */
@WebServlet(name = "/TraineeProfileViewServlet", urlPatterns = "/TraineeProfile")
public class TraineeProfileViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		List<TrainerDetailsVO> traineesList = new ArrayList<TrainerDetailsVO>();
		HttpSession session = request.getSession();

		String traineeemail = (String) session.getAttribute(AppConstants.SESSION_IDENTIFICATION_KEY);

		System.out.println("traineeemail1::" + traineeemail);

		Connection connection = null;
		PreparedStatement statement = null;
		try {

			connection = DBConnection.createConnection();
			String sql = "select * from traineeregister where username=?";

			statement = connection.prepareStatement(sql);
			statement.setString(1, traineeemail);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				// Defining Student Object
				TrainerDetailsVO details = new TrainerDetailsVO();				
				details.setEmail(rs.getString("username"));
				details.setPassword(rs.getString("password"));
				if(rs.getString("traineename") != null){
				details.setName(rs.getString("traineename"));
				}else{
				details.setName(" ");	
				}
	//			details.setDob(rs.getString("dob"));
				if(rs.getString("target") != null){
				details.setTarget(rs.getString("target"));
				}else{
				details.setTarget(" ");
				}
				if(rs.getString("ailment") != null){
				details.setAnyailment(rs.getString("ailment"));
				}else{
					details.setAnyailment(" ");
				}
				if(rs.getString("state") != null){
				details.setState(rs.getString("state"));
				}else{
				details.setState(" ");
				}
				if(rs.getString("city") != null){
				details.setCity(rs.getString("city"));
				}else{
				details.setCity(" ");
				}
				if(rs.getString("phone") != null){
				details.setPhone(rs.getString("phone"));
				}else{
					details.setPhone(" ");
				}

				System.out.println("list::" + details);
				// Adding the Student Object to List
				traineesList.add(details);
				// fos.close();
			}

			rs.close();
			statement.close();
			connection.close();

			request.setAttribute("traineeProfileData", traineesList);
			request.getRequestDispatcher("/TraineeProfile.jsp").forward(request, response);

		} catch (SQLException e) {

			System.out.println(e.getMessage());
			e.printStackTrace();
		}

	}

}
