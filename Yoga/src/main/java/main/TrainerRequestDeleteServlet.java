package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

import main.common.DBConnection;
import main.common.SMTPCredentials;

/**
 * Servlet implementation class TrainerRequestDeleteServlet
 */
public class TrainerRequestDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//AWS SMTP Credentials
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
	    int i=0,j=0,k=0;
	    String traineremail=(String)request.getParameter("traineremail");
	    
	    Connection con = null;
        
        try
        {
            con = DBConnection.createConnection();
            String query1 = "insert into trainerrejectlist select * from trainerregister where traineremail=? and adminapprove=?";
            PreparedStatement statement1 = con.prepareStatement(query1); //Making use of prepared statements here to insert bunch of data
            statement1.setString(1, traineremail);
            statement1.setBoolean(2, false);
            i= statement1.executeUpdate();
            if (i!=0) { 
                
           	 String query3 = "delete from trainerregister where traineremail=? and adminapprove=?";
                PreparedStatement statement3 = con.prepareStatement(query3); //Making use of prepared statements here to insert bunch of data
                statement3.setString(1, traineremail);
                statement3.setBoolean(2, false);
                 j= statement3.executeUpdate();
           } 
            if(i!=0 && j!=0){
            	
                out.write("Request Deleted Successfully");
                
                System.out.println("success");
                SendEmail(traineremail);
            
                 }else{
                 	out.write("Request Deleting Failed");
                 	System.out.println("fail");
                   }
             }
             catch(SQLException e)
             {
                e.printStackTrace();
                System.out.println(e);
             }   
	}
	public void SendEmail(String emailid){
  		 //Get the session object
         Properties props = new Properties();
         props.put("mail.smtp.host", HOST);
         props.put("mail.smtp.port", PORT);
         props.put("mail.smtp.ssl.enable",
                   "true");
         props.put("mail.smtp.auth", "true");
        

         Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
          return new PasswordAuthentication(SMTP_USERNAME,SMTP_PASSWORD);//change accordingly
          }
         });

       //compose message
         try {
          MimeMessage message = new MimeMessage(session);
          //String toid=request.getParameter("forgotmail");
          message.setFrom(new InternetAddress("dealwithfitness64@gmail.com"));//change accordingly
          message.addRecipient(Message.RecipientType.TO,new InternetAddress(emailid));
          message.setSubject("DealWithFitness Registration Rejected");
          message.setContent("Hi  "+emailid+" ,<br> You are Registration for DealWithFitness application has been rejected.<br> Please contact us for any queries. <br><br>Username :"+emailid
       		   ,"text/html");

          //send message
          Transport.send(message);
         }
          catch (MessagingException e) 
             {
           	  throw new RuntimeException(e);
           	  
           	  }
          System.out.println("credentials mailed successfully");
  		
  	}    
	}
