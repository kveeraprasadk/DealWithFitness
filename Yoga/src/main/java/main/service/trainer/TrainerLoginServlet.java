package main.service.trainer;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.AppConstants;
import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;
import main.model.SessionUser;

/**
 * Servlet implementation class TrainerLoginServlet
 */
@WebServlet(name = "/TrainerLoginServlet", urlPatterns = "/TrainerLoginServlet")
public class TrainerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String trainerName = null;
			boolean	adminapprove;
		String username = (String) request.getParameter("username");
		String pass = (String) request.getParameter("password");
	//	Base64.Encoder enc = Base64.getEncoder();
		// encode data using BASE64
//		String password = enc.encodeToString(pass.getBytes());
		String password=null;
		try {
			password = EncodeDecodeSHA256.toHexString(EncodeDecodeSHA256.getSHA(pass));
		} catch (NoSuchAlgorithmException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		System.out.println("encoded value is \t" + password);

		try (Connection con = DBConnection.createConnection()) {
			String cntQuery = "SELECT trainername,adminapprove FROM trainerregister where (traineremail='" + username
					+ "' and password='" + password + "')";
			try (PreparedStatement stat = con.prepareStatement(cntQuery)) {
				try (ResultSet rs = stat.executeQuery()) {
					if (rs.next()) {
						trainerName = rs.getString("trainername");
						adminapprove=rs.getBoolean("adminapprove");
						System.out.println("trainerName is::" + trainerName);
						if (trainerName != null) {
							HttpSession session = request.getSession(true);
							session.setAttribute("traineremail", username);

							SessionUser sessionUser = new SessionUser();
							sessionUser.setType("Trainer"+adminapprove);
							sessionUser.setEmail(username);
							sessionUser.setName(trainerName);
							session.setAttribute(AppConstants.SESSION_USER_INFO, sessionUser);
							System.out.println("Trainer :"+adminapprove);
							if(!adminapprove){
								System.out.println("Trainer temp Login successfull");
								response.getWriter().write("Trainer Temp Login Success");
							}else{
							System.out.println("Approved Login successfull");
							response.getWriter().write("Login Success");
							}
						} else {
							System.out.println("Invalid Credentials");
							response.getWriter().write("Invalid Credentials");
						}
					} else {
						System.out.println("Null Values");
						response.getWriter().write("Invalid Credentials");
					}

				}
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("catch block");

			e1.printStackTrace();

		}
	}
}
