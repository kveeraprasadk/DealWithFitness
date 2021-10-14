package main.service.trainee;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;
import main.service.common.UserSession;
import main.service.common.UserSession.Type;

/**
 * Servlet implementation class TraineeClassLoginPayment
 */

public class TraineeClassLoginPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Logger log = LogManager.getLogger("TraineeClassLoginPayment");

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

		String traineeEmail = (String) request.getParameter("email");
		String pass = (String) request.getParameter("password");

		// Base64.Encoder enc = Base64.getEncoder();
		// encode data using BASE64
		// String password = enc.encodeToString(pass.getBytes());
		String password = null;
		try {
			password = EncodeDecodeSHA256.toHexString(EncodeDecodeSHA256.getSHA(pass));
		} catch (NoSuchAlgorithmException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		System.out.println("encoded value is \t" + password);

		try (Connection con = DBConnection.createConnection()) {
			String cntQuery = "SELECT traineename FROM traineeregister where (username='" + traineeEmail
					+ "' and password='" + password + "')";
			try (PreparedStatement stat = con.prepareStatement(cntQuery)) {
				try (ResultSet rs = stat.executeQuery()) {
					if (rs.next()) {
						// If session already exists then invalidate it and create new one
						UserSession.createUserSession(request.getSession(true), UserSession.Type.TRAINEE,
								rs.getString("traineename"), traineeEmail);
						response.getWriter().write("Login Success");
					} else {
						response.getWriter().write(
								"Not a valid Email/Password. If you are a new user then please create a trainee account before login into Deal with fitness.");
					}
				}
			}
		} catch (SQLException exp) {
			log.error("Exception", exp);
		}
	}
}
