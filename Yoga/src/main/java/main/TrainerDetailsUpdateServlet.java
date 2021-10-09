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

import main.common.DBConnection;

/**
 * Servlet implementation class TrainerDetailsUpdateServlet
 */
public class TrainerDetailsUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		 response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter(); 
		
		String name=(String)request.getParameter("name");		
		String email=(String)request.getParameter("email");
		String expertise=(String)request.getParameter("expertise");		
		String monthlyfees=(String)request.getParameter("monthlyfees");
		String schedule=(String)request.getParameter("schedule");
		String classlevel=(String)request.getParameter("classlevel");
		String abuotyourself=(String)request.getParameter("aboutyourself");
		
		Connection con = null;
        
        try
        {
            con = DBConnection.createConnection();
               
            String query = "update trainerregister set trainername=?,expertise=?,schedules=?,classlevel=?,monthlyfees=?,aboutyourself=? where traineremail=?";
            PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            statement.setString(1, name);
            statement.setString(2, expertise);
            statement.setString(3, schedule);
            statement.setString(4, classlevel);
            statement.setString(5, monthlyfees);
            statement.setString(6, abuotyourself);
            statement.setString(7, email);
                       
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


