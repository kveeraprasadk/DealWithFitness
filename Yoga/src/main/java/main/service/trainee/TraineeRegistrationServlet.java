package main.service.trainee;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;

@WebServlet(name = "/TraineeRegisterServlet", urlPatterns = "/TraineeRegisterServlet")
public class TraineeRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LogManager.getLogger("TraineeRegistrationServlet");

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = (String) request.getParameter("name");
		String mobileNumber = (String) request.getParameter("mobileNumber");
		String username = (String) request.getParameter("username");
		String pass = (String) request.getParameter("password");

		if (name != null && username != null && pass != null) {
			// encode data using BASE64
			//String password = Base64.getEncoder().encodeToString(pass.getBytes());
			
			String password=null;
			try {
				password = EncodeDecodeSHA256.toHexString(EncodeDecodeSHA256.getSHA(pass));
			} catch (NoSuchAlgorithmException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

			try (Connection con = DBConnection.createConnection()) {
				String cntQuery = "SELECT count(*) FROM traineeregister where (username='" + username + "')";
				String Countrow = null;
				try (PreparedStatement stat = con.prepareStatement(cntQuery)) {
					ResultSet rs = stat.executeQuery();
					rs.next();
					Countrow = rs.getString(1);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}

				if (Countrow.equals("0")) {
					String query = "insert into traineeregister(username, traineename, phone, password, createtime) values (?, ? ,?, ?, ?)";
					PreparedStatement statement = con.prepareStatement(query); 
					statement.setString(1, username);
					statement.setString(2, name);
					statement.setString(3, mobileNumber);
					statement.setString(4, password);
					statement.setTimestamp(5, new Timestamp((new Date()).getTime()));
					int count = statement.executeUpdate();

					if (count == 1) {
						response.getWriter().write("Trainee Register successfull");
					} else {
						response.getWriter().write("Trainee Register Failed");
					}
				} else {
					response.getWriter().write("Email exists");
				}
			} catch (SQLException e) {
				log.error("Exception", e);
				response.setStatus(500);
				response.getWriter().write("Service error");
			}
		} else {
			response.setStatus(400);
			response.getWriter().write("Trainee name, email and password are mandatory to pass");
		}
	}
}