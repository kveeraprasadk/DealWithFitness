package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.DBConnection;

/**
 * Servlet implementation class TrainerProfileDetailsUpdateServlet
 */
public class TrainerProfileDetailsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		 response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter(); 
	    
	    HttpSession session = request.getSession(true);
		String traineremail=(String)session.getAttribute("traineremail");
		
		String name=(String)request.getParameter("name");			
		String experience=(String)request.getParameter("experience");
		String qualification=(String)request.getParameter("qualification");
		
		String expertise=(String)request.getParameter("expertise");	
	/*	String monthlyfees=(String)request.getParameter("monthlyfees");
		String schedule=(String)request.getParameter("schedule");
		String classlevel=(String)request.getParameter("classlevel");
		
		String expertise2=(String)request.getParameter("expertise2");	
		String monthlyfees2=(String)request.getParameter("monthlyfees2");
		String schedule2=(String)request.getParameter("schedule2");
		String classlevel2=(String)request.getParameter("classlevel2"); 
		
		String expertise3=(String)request.getParameter("expertise3");	
		String monthlyfees3=(String)request.getParameter("monthlyfees3");
		String schedule3=(String)request.getParameter("schedule3");
		String classlevel3=(String)request.getParameter("classlevel3");
	*/	
		String abuotyourself=(String)request.getParameter("aboutyourself");
		
		Connection con = null;
       
       try
       {
           con = DBConnection.createConnection();
              
           //String query = "update trainerregister set trainername=?,experience=?,qualification=?,expertise=?,schedules=?,classlevel=?,monthlyfees=?,expertise2=?,schedules2=?,classlevel2=?,monthlyfees2=?,expertise3=?,schedules3=?,classlevel3=?,monthlyfees3=?,aboutyourself=? where traineremail=?";
           String query = "update trainerregister set trainername=?,experience=?,qualification=?,expertise=?,aboutyourself=? where traineremail=?";
           PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
           statement.setString(1, name);           
           statement.setString(2, experience);
           statement.setString(3, qualification);
           statement.setString(4, expertise);          
           statement.setString(5, abuotyourself);
           statement.setString(6, traineremail);
                      
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
