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

		String name = request.getParameter("formfirstname");
		String email = request.getParameter("formemail");

		String abuotme = request.getParameter("formaboutself");
		String experience = request.getParameter("formexperience");
		String qualification = request.getParameter("formqualification");
		String phoneno = request.getParameter("formphone");
		String expertise = request.getParameter("formexpertise1");
		String pass = request.getParameter("formpassword");	
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

		InputStream inputStream = null; // input stream of the upload file
		InputStream is=null; 
		InputStream certificate1inputStream = null;
		InputStream certificate2inputStream = null;
		InputStream certificate3inputStream = null;
		BufferedImage resizeImageJpg;

		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("formimage");
		// String fileName1 = filePart.getSubmittedFileName();
		/*
		 * System.out.println("path:"+request.getContextPath()+"/target/Yoga/img/" +
		 * fileName1); for (Part part : request.getParts()) {
		 * part.write("/target/Yoga/img/" + fileName1);
		 * System.out.println("path:"+request.getContextPath()); }
		 */

		String fileName = AppUtils.getFileNameFromFormPart(filePart);
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println("original name:"+filePart.getName());
			System.out.println("original size:"+filePart.getSize());
			System.out.println("original type:"+filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
			try {
                BufferedImage originalImage = ImageIO.read(inputStream);
                int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
                System.out.println("type::"+type);
                resizeImageJpg = resizeImage(originalImage, type);//call to resize the image
 
               // BufferedImage to ByteArrayInputStream
                ByteArrayOutputStream os = new ByteArrayOutputStream();
                ImageIO.write(resizeImageJpg, "jpg", os);
                is = new ByteArrayInputStream(os.toByteArray());
                
                System.out.println("resize name:"+is);
//    			System.out.println("original size:"+filePart.getSize());
//    			System.out.println("original type:"+filePart.getContentType());
 
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
						
		}
		Part certificate1 = request.getPart("formcertificate1");
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
		Part certificate2 = request.getPart("form-certificate2");
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
		Part certificate3 = request.getPart("form-certificate3");
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

		String Countrow = null;
		boolean isapprove=false;
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
					session.setAttribute("trainercertificatefileName1", certificatefileName1);
					session.setAttribute("trainercertificatefileName2", certificatefileName2);
					session.setAttribute("trainercertificatefileName3", certificatefileName3);
					session.setAttribute("trainerprofilephoto",is);

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

	private static BufferedImage resizeImage(BufferedImage originalImage, int type) {
        BufferedImage resizedImage = new BufferedImage(314, 210, type);//set width and height of image
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, 314, 210, null);
        g.dispose();
 
        return resizedImage;
    }
}
