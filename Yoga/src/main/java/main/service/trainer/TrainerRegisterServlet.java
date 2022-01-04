package main.service.trainer;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import main.common.AppConstants;
import main.common.AppUtils;
import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;
import main.model.SessionUser;


/**
 * Servlet implementation class TrainerRegisterServlet
 */
@MultipartConfig(maxFileSize = 1048576) // upload file's size up to 1MB(1048576 bytes binary)
							
public class TrainerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	  
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String name =(String) request.getParameter("name");
		String email =(String) request.getParameter("email");

		String abuotme =(String) request.getParameter("about");
		String experience =(String) request.getParameter("experience");
		String qualification =(String) request.getParameter("qualification");
		String phoneno =(String) request.getParameter("phone");
		String expertise =(String) request.getParameter("expertise");
		String pass =(String) request.getParameter("password");	
		System.out.println("pass:"+pass);
		String password=null;
		try {
			password = EncodeDecodeSHA256.toHexString(EncodeDecodeSHA256.getSHA(pass));
		} catch (NoSuchAlgorithmException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		System.out.println("password::" + password);
		System.out.println("timestamp::" + ts);

		String Countrow = null;
		boolean isapprove=false;
		
		InputStream is=null; 
		InputStream certificate1inputStream = null;
		InputStream certificate2inputStream = null;
		InputStream certificate3inputStream = null;
		String fileName = "";
		String certificatefileName1 = "";
		String certificatefileName2 = "";
		String certificatefileName3 = "";
		try (Connection con = DBConnection.createConnection()){
			String cnt = "select count(*) from trainerregister tr,traineeregister te where tr.traineremail=? or te.username=?";
	//		String cnt = "select count(*) from trainerregister where traineremail=?";
			PreparedStatement statement1 = con.prepareStatement(cnt);
			statement1.setString(1, email);
			statement1.setString(2, email);
			ResultSet rs = statement1.executeQuery();
			rs.next();
			Countrow = rs.getString(1);		
	
			if (Countrow.equals("0")) {

				// String query11 = "insert into
				// trainertemptable(trainername,traineremail,experience,qualification,expertise,classlevel,monthlyfees,schedules,expertise2,classlevel2,monthlyfees2,schedules2,expertise3,classlevel3,monthlyfees3,schedules3,aboutyourself,photoname,photo,creationtime,certificate1,certificate1filename,certificate2,certificate2filename,certificate3,certificate3filename)
				// values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; //Insert user
				// details into the table 'USERS'
				String query = "insert into trainerregister(trainername,traineremail,experience,qualification,phoneno,expertise,aboutyourself,photoname,photo,creationtime,certificate1,certificate1filename,certificate2,certificate2filename,certificate3,certificate3filename,password,adminapprove) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; // Insert
				// 'USERS'
PreparedStatement statement = con.prepareStatement(query); // Making use of prepared statements here to
// insert bunch of data
statement.setString(1, name);
statement.setString(2, email);
statement.setString(3, experience);
statement.setString(4, qualification);
statement.setString(5, phoneno);
statement.setString(6, expertise);
statement.setString(7, abuotme);
statement.setString(8, fileName);
statement.setBlob(9, is);
statement.setTimestamp(10, ts);
statement.setBlob(11, certificate1inputStream);
statement.setString(12, certificatefileName1);
statement.setBlob(13, certificate2inputStream);
statement.setString(14, certificatefileName2);
statement.setBlob(15, certificate3inputStream);
statement.setString(16, certificatefileName3);
statement.setString(17, password);
statement.setBoolean(18, isapprove);

				int i = statement.executeUpdate();

				if (i != 0) {
					HttpSession session = request.getSession(true);
					session.setAttribute("traineremail", email);
					session.setAttribute("trainername", name);
					
					SessionUser sessionUser = new SessionUser();
					sessionUser.setType("Trainer"+isapprove);
					sessionUser.setEmail(email);
					sessionUser.setName(name);
					session.setAttribute(AppConstants.SESSION_USER_INFO, sessionUser);
					System.out.println("Trainer :"+isapprove);
					
					session.setAttribute("trainerexperience", experience);
					session.setAttribute("trainerqualification", qualification);
					session.setAttribute("trainerexpertise", expertise);
					session.setAttribute("trainerphone", phoneno);
					session.setAttribute("trainerpassword", password);					
					session.setAttribute("traineraboutme", abuotme);					

					out.write("Temporary Profile Created Successfully");
					System.out.println("Temporary Profile Created Successfully");					
				//	request.getRequestDispatcher("TrainerTempProfile.jsp").forward(request, response);

					
				} else {
					out.write("Registration Failed Plz Try Again ..!");
					System.out.println("Registration Failed Plz Try Again ..!");
//					request.setAttribute("success", "Register Failed Plz Try Again ..!");
//					request.getRequestDispatcher("/Trainer.jsp").include(request, response);
				}
			} else {
				System.out.println("Email ID is Already Registered");
				out.write("Email ID is Already Registered");
//				request.setAttribute("success", "Email ID is Already Registered");
//				request.getRequestDispatcher("/Trainer.jsp").include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}

	}

	
}
