package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;

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

import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;

/**
 * Servlet implementation class TrainersConfirmServlet
 */
public class TrainersConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// AWS SMTP Credentials
	public static final String SMTP_USERNAME = "dealwithfitness64@gmail.com";
	public static final String SMTP_PASSWORD = "password";

	// Amazon SES SMTP host name.
	public static final String HOST = "smtp.gmail.com";
	public static final int PORT = 465;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		int i = 0, j = 0, k = 0;
		String traineremail = (String) request.getParameter("traineremail");

		String pass = String.valueOf(UniqueIdCreate());
	//	Base64.Encoder enc = Base64.getEncoder();
	//	String password = enc.encodeToString(pass.getBytes());
		String password=null;
		try {
			password = EncodeDecodeSHA256.toHexString(EncodeDecodeSHA256.getSHA(pass));
		} catch (NoSuchAlgorithmException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		System.out.println("encoded value is \t" + password);

		Connection con = null;

		try {
			con = DBConnection.createConnection();

			String query1 = "insert into trainerregister select * from trainertemptable where traineremail=?";
			PreparedStatement statement1 = con.prepareStatement(query1); // Making use of prepared statements here to
																			// insert bunch of data
			statement1.setString(1, traineremail);
			i = statement1.executeUpdate();
			if (i != 0) {
				String query2 = "update trainerregister set password=?,class1demo=?,class2demo=?,class3demo=? where traineremail=?";
				PreparedStatement statement2 = con.prepareStatement(query2); // Making use of prepared statements here
																				// to insert bunch of data
				statement2.setString(1, password);
				statement2.setString(2, "No");
				statement2.setString(3, "No");
				statement2.setString(4, "No");
				statement2.setString(5, traineremail);

				j = statement2.executeUpdate();
			}
			if (i != 0 && j != 0) {

				String query3 = "delete from trainertemptable where traineremail=?";
				PreparedStatement statement3 = con.prepareStatement(query3); // Making use of prepared statements here
																				// to insert bunch of data
				statement3.setString(1, traineremail);

				k = statement3.executeUpdate();
			}
			if (i != 0 && j != 0 && k != 0) {

				out.write("Trainer Confirmed Successfully");

				System.out.println("success");
				SendEmail(traineremail, pass);

			} else {
				out.write("Trainer Confirm Failed");
				System.out.println("fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

	static char[] UniqueIdCreate() {
		int len = 10;
		System.out.println("Generating password using random() : ");
		System.out.print("Your new password is : ");

		// A strong password has Cap_chars, Lower_chars,
		// numeric value and symbols. So we are using all of
		// them to generate our password
		String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String Small_chars = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";
		// String symbols = "!@#$%^&*_=+-/.?<>)";

		// String values = Capital_chars + Small_chars +numbers + symbols;
		String values = Capital_chars + Small_chars + numbers;
		// Using random method
		Random rndm_method = new Random();

		char[] password = new char[len];

		for (int i = 0; i < len; i++) {
			// Use of charAt() method : to get character value
			// Use of nextInt() as it is scanning the value as int
			password[i] = values.charAt(rndm_method.nextInt(values.length()));

		}
		return password;
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
				return new PasswordAuthentication(SMTP_USERNAME, SMTP_PASSWORD);// change accordingly
			}
		});

		// compose message
		try {
			MimeMessage message = new MimeMessage(session);
			// String toid=request.getParameter("forgotmail");
			message.setFrom(new InternetAddress("dealwithfitness64@gmail.com"));// change accordingly
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailid));
			message.setSubject("DealWithFitness Registration Confirmation");
			message.setContent("Hi  " + emailid
					+ " ,<br> You are Registration for DealWithFitness application was Successfully.<br> Your Credentials are. <br><br>Username :"
					+ emailid + "<br>Password :" + password, "text/html");

			// send message
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		System.out.println("credentials mailed successfully");
	}
}
