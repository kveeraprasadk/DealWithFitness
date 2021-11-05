package main.service.trainee;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.TrainersConfirmServlet;
import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;
import main.common.SMTPCredentials;

/**
 * Servlet implementation class TraineeForgotPasswordServlet
 */
public class TraineeForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// AWS SMTP Credentials
			public static final String SMTP_USERNAME = SMTPCredentials.SMTP_USERNAME;
			public static final String SMTP_PASSWORD = SMTPCredentials.SMTP_PASSWORD;

			// Amazon SES SMTP host name.
			public static final String HOST = SMTPCredentials.HOST;
			public static final int PORT = SMTPCredentials.PORT;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		int j = 0;
		String Countrow = null;
		String traineeemail = (String) request.getParameter("username");
		
		String pass = String.valueOf(TrainersConfirmServlet.UniqueIdCreate());
		// Base64.Encoder enc = Base64.getEncoder();
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
			
			String cnt = "select count(*) from traineeregister where username=?";
			PreparedStatement statement1 = con.prepareStatement(cnt);
			statement1.setString(1, traineeemail);
			ResultSet rs = statement1.executeQuery();
			rs.next();
			Countrow = rs.getString(1);
			if (Countrow.equals("1")) {
				System.out.println("count value is \t" + Countrow);
			String query2 = "update traineeregister set password=? where username=?";
			try (PreparedStatement statement2 = con.prepareStatement(query2)) {
				statement2.setString(1, password);
				statement2.setString(2, traineeemail);

				j = statement2.executeUpdate();
				if (j != 0) {
					out.write("NewPassword Sent");

					System.out.println("Trainee NewPassword Sent");
					SendEmail(traineeemail, pass);

				} else {
					out.write("New Password Creation Failed");
					System.out.println("fail");
				}
				
			}
		} else {
			System.out.println("Plz enter Registered EmailId");
			out.write("Plz enter Registered EmailId");
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
}
	public void SendEmail(String emailid, String password) {
		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", HOST);
		props.put("mail.smtp.port", PORT);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);// change
																				// accordingly
			}
		});

		// compose message
		try {
			MimeMessage message = new MimeMessage(session);
			// String toid=request.getParameter("forgotmail");
			message.setFrom(new InternetAddress("dealwithfitness64@gmail.com"));// change
																				// accordingly
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailid));
			message.setSubject("DealWithFitness ForgotPassword");
			message.setContent("Hi  " + emailid
					+ " ,<br> You have been requested for Recreation of New Password in DealWithFitness. DealWithFitness has been generated a new password is showned below.<br> Note: For security reason you must change your password after logging in. <br><br>Username :"
					+ emailid + "<br>NewPassword :" + password, "text/html");

			// send message
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		System.out.println("credentials mailed successfully");
	}
}
