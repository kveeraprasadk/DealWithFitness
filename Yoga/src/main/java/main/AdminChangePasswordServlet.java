package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.DBConnection;

/**
 * Servlet implementation class AdminChangePasswordServlet
 */
public class AdminChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		 response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter(); 
	    
	    HttpSession session = request.getSession(true);
		String adminemail=(String)session.getAttribute("adminemail");
		System.out.println("success::"+adminemail);
		String curpassword=(String)request.getParameter("currentpassword");		
		String newpass=(String)request.getParameter("newpassword");
	
		
		Base64.Encoder enc = Base64.getEncoder();
		String newpassword = enc.encodeToString(newpass.getBytes());
		String currentpassword = enc.encodeToString(curpassword.getBytes());
Connection con = null;
       
       try
       {
           con = DBConnection.createConnection();
              
           String query = "update dwfadmin set password=? where username=? and password=?";
           PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
           statement.setString(1, newpassword);
           statement.setString(2, adminemail);
           statement.setString(3, currentpassword);
          
                      
           int i= statement.executeUpdate();
           
           if (i!=0) { //Just to ensure data has been inserted into the database
           //	HttpSession session = request.getSession(true);
           //	session.setAttribute("traineremail", email);
          out.println("Updated Successfully");
          System.out.println("success");
       //   request.setAttribute("success", "register success");
          
          // forwards to the message page
         // getServletContext().getRequestDispatcher("/trainersprofile.jsp").forward(request, response);
      
           }else{
           	out.println("Updated Failed");
           	System.out.println("fail");
           //	 request.setAttribute("fail", "register fail");
                
                // forwards to the message page
            //    getServletContext().getRequestDispatcher("/Trainer.jsp").forward(request, response);
           }
       }
       catch(SQLException e)
       {
          e.printStackTrace();
          System.out.println(e);
       }       
	}

}

