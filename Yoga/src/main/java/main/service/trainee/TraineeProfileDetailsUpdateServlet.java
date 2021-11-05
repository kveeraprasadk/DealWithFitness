package main.service.trainee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.DBConnection;

/**
 * Servlet implementation class TraineeProfileDetailsUpdateServlet
 */
@WebServlet(name = "/TraineeProfileDetailsUpdateServlet", urlPatterns = "/TraineeProfileUpdateView")
public class TraineeProfileDetailsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		 response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter(); 
	    
	    HttpSession session = request.getSession(true);
		String traineeemail=(String)session.getAttribute("traineeemail");
		
		String name=(String)request.getParameter("name");			
	//	String email=(String)request.getParameter("email");
		String dob=(String)request.getParameter("dob");		
		String target=(String)request.getParameter("target");
		String ailment=(String)request.getParameter("ailment");
		String state=(String)request.getParameter("state");
		String city=(String)request.getParameter("city");
		String phone=(String)request.getParameter("phone");
		
		System.out.println("name::"+traineeemail);
		Connection con = null;
      
      try
      {
          con = DBConnection.createConnection();
             
          String query = "update traineeregister set traineename=?,dob=?,target=?,ailment=?,state=?,city=?,phone=? where username=?";
          PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
          statement.setString(1, name);
          statement.setString(2, dob);
          statement.setString(3, target);
          statement.setString(4, ailment);
          statement.setString(5, state);
          statement.setString(6, city);
          statement.setString(7, phone);
          statement.setString(8, traineeemail);
                               
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

