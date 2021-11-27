package main.service.trainer;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import main.common.DBConnection;

/**
 * Servlet implementation class TrainerProfilePicUpdateServlet
 */
@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class TrainerProfilePicUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(true);
		String traineremail = (String) session.getAttribute("traineremail");
		
		InputStream inputStream = null; // input stream of the upload file
		Part filePart = request.getPart("formimage");
		String fileName = extractFileName(filePart);
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		Connection con = null;
		 try
	        {
	            con = DBConnection.createConnection();
	               
	            String query = "update trainerregister set photoname=?,photo=? where traineremail=?";
	            PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
	            statement.setString(1, fileName);
				statement.setBlob(2, inputStream);
	            statement.setString(3, traineremail);	           
	                       
	            int i= statement.executeUpdate();
	            
	            if (i!=0) { //Just to ensure data has been inserted into the database
	            //	HttpSession session = request.getSession(true);
	            //	session.setAttribute("traineremail", email);
	           out.println("Updated Successfully");
	           System.out.println("success");
	        //   request.setAttribute("success", "register success");
	           
	           // forwards to the message page
	           getServletContext().getRequestDispatcher("/trainersprofile.jsp").forward(request, response);
	           
	       //    response.sendRedirect("/TrainerProfile");
	            }else{
	            	out.println("Updated Failed");
	            	System.out.println("fail");
	            //	 request.setAttribute("fail", "register fail");
	                 
	                 // forwards to the message page
	                 getServletContext().getRequestDispatcher("/trainersprofile.jsp").forward(request, response);
	            }
	        }
	        catch(SQLException e)
	        {
	           e.printStackTrace();
	           System.out.println(e);
	        }       
	}

private String extractFileName(Part part) {
	// form-data; name="file"; filename="C:\file1.zip"
	// form-data; name="file"; filename="C:\Note\file2.zip"
	String contentDisp = part.getHeader("content-disposition");
	String[] items = contentDisp.split(";");
	for (String s : items) {
		if (s.trim().startsWith("filename")) {
			// C:\file1.zip
			// C:\Note\file2.zip
			String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
			clientFileName = clientFileName.replace("\\", "/");
			int i = clientFileName.lastIndexOf('/');
			// file1.zip
			// file2.zip
			return clientFileName.substring(i + 1);
		}
	}
	return null;
}
}

