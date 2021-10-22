package main;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.common.DBConnection;
import main.common.SMTPCredentials;
import main.model.TraineeStory;

/**
 * Servlet implementation class TraineeStoryConfirmServlet
 */
public class TraineeStoryConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SMTP_USERNAME = SMTPCredentials.SMTP_USERNAME;
	public static final String SMTP_PASSWORD = SMTPCredentials.SMTP_PASSWORD;

	// Amazon SES SMTP host name.
	public static final String HOST = SMTPCredentials.HOST;
	public static final int PORT = SMTPCredentials.PORT;
	private static final Logger log = LogManager.getLogger("TraineeStoryConfirmServlet");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		int j = 0;
		String story = null;
		String storyid = null;
		String ttmail = (String) request.getParameter("traineetrainer");
		String traineeid = null, trainerid = null;
		String[] res = ttmail.split("[,]", 0);
		int ins = 0;
		for (String myStr : res) {
			if (ins == 0) {
				traineeid = myStr;
				ins++;
			} else {
				trainerid = myStr;
			}
			System.out.println(myStr);
		}

		try (Connection con = DBConnection.createConnection()) {
			String query2 = "update traineeStories set adminapprove=? where trainerId=? and traineeId=?";
			try (PreparedStatement statement2 = con.prepareStatement(query2)) { // Making
																				// use
																				// of
																				// prepared
																				// statements
																				// here
																				// to
																				// insert
																				// bunch
																				// of
																				// data
				statement2.setBoolean(1, true);
				statement2.setString(2, trainerid);
				statement2.setString(3, traineeid);

				j = statement2.executeUpdate();

				String sql = "select * from traineeStories where traineeId=? and trainerId=?";
				try (PreparedStatement statement = con.prepareStatement(sql)) {
					statement.setString(1, traineeid);
					statement.setString(2, trainerid);
					try (ResultSet rs = statement.executeQuery()) {
						while (rs.next()) {

							story = rs.getString("story");
							storyid = rs.getString("storyId");

						}

						if (j != 0) {
							out.write("Trainee Story Confirmed Successfully");

							System.out.println("success");
							SendEmail(traineeid, trainerid, storyid, story);

						} else {
							out.write("Trainee Story Confirm Failed");
							System.out.println("fail");
						}
					}
				}
			}
		} catch (Exception ex) {
			log.error("Exception while  trainee story confirmation", ex);
			response.setStatus(500);
		}
	}

	public void SendEmail(String traineeid, String trainerid, String storyid, String story) {
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(traineeid));
			message.setSubject("DealWithFitness Story Confirmation");
			message.setContent(
					"Hi  " + traineeid + " ,<br> Your Story has been Approved from DealWithFitness application."
							+ "<br><br>TrainerId :" + trainerid + "<br>StoryId:" + storyid + "<br>Story:" + story,
					"text/html");

			// send message
			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		System.out.println("story mailed successfully");
	}
}
