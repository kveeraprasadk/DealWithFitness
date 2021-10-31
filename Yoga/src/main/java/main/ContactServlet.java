package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
import javax.servlet.http.HttpSession;

import main.common.DBConnection;
import main.common.SMTPCredentials;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String SMTP_USER = SMTPCredentials.SMTP_USERNAME;
	static final String SMTP_PASS = SMTPCredentials.SMTP_PASSWORD;

	// Amazon SES SMTP host name. 
	static final String SMTP_HOST = SMTPCredentials.HOST;    

	static final int SMTP_PORT = SMTPCredentials.PORT;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain"); // Set content type of the
		// response so that jQuery knows
		// what it can expect.
		response.setCharacterEncoding("UTF-8"); // You want world domination,
		// huh?
		PrintWriter out = response.getWriter();
		
		
		System.out.println("class running::");
		String name = (String)request.getParameter("name");
		
		String email = (String)request.getParameter("email");
		String subject = (String)request.getParameter("subject");
		String usermessage = (String)request.getParameter("message");
		
		Date date = new Date();
        Timestamp ts=new Timestamp(date.getTime());
        Connection con = null;
        try
        {
            con = DBConnection.createConnection();
            String query = "insert into fitnesscomments(commentorname,commentoremail,subject,comment,commenttime) values (?,?,?,?,?)"; //Insert user details into the table 'USERS'
            PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            statement.setString(1, name);              
            statement.setString(2, email);
            statement.setString(3, subject);
            statement.setString(4, usermessage);
            statement.setTimestamp(5, ts);              
            
            int i= statement.executeUpdate();
            if (i==1)  {         	   
         	   System.out.println("Comment saved successfully");
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println(e);
         }  
		
		Properties props = new Properties();
		props.put("mail.smtp.host", SMTP_HOST);
		props.put("mail.smtp.port", SMTP_PORT);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(SMTP_USER, SMTP_PASS);// change
																		// accordingly
		}
		});
		try {
			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress("dealwithbusiness64@gmail.com"));// change
															// accordingly
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject(subject);
			message.setContent(
			"Hi<p> DealWithFitness Creative Team,"
			+ "<br>This is the mail regarding to the Deal With Fitness Creative team to post a comment.<br>Below are the contact details. "
			+ "Please reply him comment. <br><br><br>Name :"+name+"<br>Email :"+email+"<br>Message :"+usermessage+"</p>",
			"text/html");
			//<a href=http://localhost:8083/DealWithBusiness/ChangePassword.jsp>Change Password</a>
			// send message
					Transport.send(message);

			System.out.println("message sent successfully");



			//System.out.println("Change Password Link Send to Registered mail Successfully");
			String regmailsucc="Feedback Sent";
			response.getWriter().write(regmailsucc); // Write response
			// body.

	//		request.setAttribute("successmsg", "Message Sent Successfully");
	//			request.getRequestDispatcher("/Contactus.jsp").forward(request, response);

			} catch (MessagingException e) {
			throw new RuntimeException("Failed to send email : " + e.getMessage(), e);
			}
	
		
	}

}