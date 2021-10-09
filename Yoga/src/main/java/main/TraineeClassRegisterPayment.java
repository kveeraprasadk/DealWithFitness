package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.DBConnection;

/**
 * Servlet implementation class TraineeClassRegisterPayment
 */
public class TraineeClassRegisterPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8");
	    
	    String email=(String)request.getParameter("email");		
		String phone=(String)request.getParameter("phoneno");
		String pass=(String)request.getParameter("password");
        System.out.println("encoded value is \t" + email+phone+pass );
        Base64.Encoder enc = Base64.getEncoder();
        // encode data using BASE64
           String password = enc.encodeToString(pass.getBytes());
           System.out.println("encoded value is \t" + password );
           
           Date date = new Date();
           Timestamp ts=new Timestamp(date.getTime());
           Connection con = null;
           try
           {
               con = DBConnection.createConnection();
               
               String cntQuery = "SELECT count(*) FROM traineeregister where (username='"+email+"')";
               PreparedStatement stat;
               String Countrow=null;
   			try {
   				stat = con.prepareStatement(cntQuery);
   				 ResultSet rs = stat.executeQuery();
   		            rs.next();
   		            Countrow = rs.getString(1);
   		            
   			} catch (SQLException e1) {
   				// TODO Auto-generated catch block
   				e1.printStackTrace();
   			}
   			System.out.println("count is::"+Countrow);
         
   			if(Countrow.equals("0")){
                             
               String query = "insert into traineeregister(username,password,phone,createtime) values (?,?,?,?)"; //Insert user details into the table 'USERS'
               PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
               statement.setString(1, email);              
               statement.setString(2, password);
               statement.setString(3, phone);
               statement.setTimestamp(4, ts);              
               
               int i= statement.executeUpdate();
              
               if (i==1)  {
            	   HttpSession session = request.getSession(true);
               	session.setAttribute("traineeemail", email); 
            	   System.out.println("Trainee Register successfull");
            	   String error1="Trainee Register successfull";
            	   response.getWriter().write(error1); 
	              
	           //    request.getRequestDispatcher("/TraineeProfile.jsp").forward(request, response);
               }else{
            	   System.out.println("Trainee Register Failed");
            	   String error1="Trainee Register Failed";
            	   response.getWriter().write(error1);       
               }
   			}else{
   				System.out.println("Email ID Already Registered, Plz Login..!");
            	String error2="Email ID Already Registered, Plz Login..!";
            	response.getWriter().write(error2);
   			}
               
           }
           catch(SQLException e)
           {
              e.printStackTrace();
              System.out.println(e);
           }       
           
       }

}

