package main.service.trainee;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
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


import main.common.SMTPCredentials;

/**
 * Servlet implementation class TraineePhoneNumberSendServlet
 */
public class TraineePhoneNumberSendServlet extends HttpServlet {
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
		
		String pnumber = (String) request.getParameter("pnumber");		
		String email="agrlsandeep@gmail.com";
		System.out.println("phone number is \t" + pnumber);
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		System.out.println("timestamp::" + ts);
		String sucmsg=SendEmail(email,pnumber,ts);	
		if(sucmsg.equals("success")){
			out.write("Submitted successfully");
		}else{
			out.write("Submition failed");
		}
		}
	public String SendEmail(String emailid, String phone, Timestamp ts) {
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
			message.setSubject("DWF Trainee Request for online class");
			message.setContent("Hi  " 
					+ " ,<br> This is the Mail Regarding to trainee request for online classes in DealWithFitness.  <br><br>Phone Number :"
					+ phone + "<br>Request Time :" + ts, "text/html");

			// send message
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		System.out.println("credentials mailed successfully");
		return "success";
	}
}
