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

import main.common.AppUtils;
import main.common.DBConnection;

/**
 * Servlet implementation class TrainerProfileExtraCertificatesaddServlet
 */
@WebServlet("/extracertificates")
@MultipartConfig(maxFileSize = 1048576) // upload file's size up to 1MB(1048576 bytes binary)
public class TrainerProfileExtraCertificatesaddServlet extends HttpServlet {
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
		
		InputStream certificate1inputStream = null;
		InputStream certificate2inputStream = null;
		InputStream certificate3inputStream = null;
		
		Part certificate1 = request.getPart("form-certificate1-extra");
		String certificatefileName1 = AppUtils.getFileNameFromFormPart(certificate1);
		if (certificate1 != null) {
			// prints out some information for debugging
			System.out.println("certificate1::::" + certificate1.getName());
			System.out.println(certificate1.getSize());
			System.out.println(certificate1.getContentType());

			// obtains input stream of the upload file
			certificate1inputStream = certificate1.getInputStream();
		} else {
			certificate1inputStream = null;
			certificatefileName1 = "";
		}
		Part certificate2 = request.getPart("form-certificate2-extra");
		String certificatefileName2 = AppUtils.getFileNameFromFormPart(certificate2);
		if (certificate2 != null) {
			// prints out some information for debugging
			System.out.println("certificate2::::" + certificate2.getName());
			System.out.println(certificate2.getSize());
			System.out.println(certificate2.getContentType());

			// obtains input stream of the upload file
			certificate2inputStream = certificate2.getInputStream();
		} else {
			certificate2inputStream = null;
			certificatefileName2 = "";
		}
		Part certificate3 = request.getPart("form-certificate3-extra");
		String certificatefileName3 = AppUtils.getFileNameFromFormPart(certificate3);
		if (certificate3 != null) {
			// prints out some information for debugging
			System.out.println("certificate3::::" + certificate3.getName());
			System.out.println(certificate3.getSize());
			System.out.println(certificate3.getContentType());

			// obtains input stream of the upload file
			certificate3inputStream = certificate3.getInputStream();
		} else {
			certificate3inputStream = null;
			certificatefileName3 = "";
		}
		
		Connection con = null;
		 try
	        {
	            con = DBConnection.createConnection();
	               
	            String query = "update trainerregister set certificate1=?,certificate1filename=?,certificate2=?,certificate2filename=?,certificate3=?,certificate3filename=? where traineremail=?";
	            PreparedStatement statement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
	            statement.setBlob(1, certificate1inputStream);
	            statement.setString(2, certificatefileName1);
	            statement.setBlob(3, certificate2inputStream);
				statement.setString(4, certificatefileName2);
				statement.setBlob(5, certificate3inputStream);
				statement.setString(6, certificatefileName3);				
	            statement.setString(7, traineremail);	           
	                       
	            int i= statement.executeUpdate();
	            
	            if (i!=0) { //Just to ensure data has been inserted into the database
	            //	HttpSession session = request.getSession(true);
	            //	session.setAttribute("traineremail", email); 	
	            	
	            	
	           out.println("Updated Successfully");
	           System.out.println("success");
	        //   request.setAttribute("success", "register success");
	           
	           // forwards to the message page
	     //      getServletContext().getRequestDispatcher("/trainersprofile.jsp").forward(request, response);
	           
	       //    response.sendRedirect("/TrainerProfile");
	            }else{
	            	out.println("Updated Failed");
	            	System.out.println("fail");
	            //	 request.setAttribute("fail", "register fail");	                 
	                 // forwards to the message page
	            //     getServletContext().getRequestDispatcher("/trainersprofile.jsp").forward(request, response);
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


