package main.service.trainer;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import main.common.DBConnection;
import main.model.SeriesSchedulesVO;
import main.model.TrainerDetailsVO;


/**
 * Servlet implementation class TrainerDetailsView
 */
@WebServlet(name="TrainerDetailsView", urlPatterns = "/TrainerDetailsView")
public class TrainerDetailsView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		List<TrainerDetailsVO> TrainersList = new ArrayList<TrainerDetailsVO>();
		
	
		String traineremail = (String) request.getParameter("trainersemail");
		String userJsonString=null;
		System.out.println("traineremail2::" + traineremail);
		
		try (Connection connection = DBConnection.createConnection()) {
		try (PreparedStatement statement = connection.prepareStatement("select * from trainerregister where traineremail=?")) 
	//		try (PreparedStatement statement = connection.prepareStatement("select tr.trainername,tr.traineremail,tr.experience,tr.qualification,tr.aboutyourself,tr.photoname,tr.photo,tr.certificate1filename,tr.certificate2filename,tr.certificate3filename,ss.title,ss.starttime,ss.endtime,ss.endByDate,ss.selectedDayNames,ss.trainerpreference,ss.fee,ss.classlevel,ss.expertise,ss.democlass from trainerregister tr,schedulesseries ss where tr.traineremail=ss.traineremail and tr.traineremail=?")) 
			{
				statement.setString(1, traineremail);
				try (ResultSet rs = statement.executeQuery()) {

					while (rs.next()) {
						// Defining Student Object
						TrainerDetailsVO details = new TrainerDetailsVO();
						details.setName(rs.getString("trainername"));
						details.setEmail(rs.getString("traineremail"));
						details.setExperience(rs.getString("experience"));
						details.setQualification(rs.getString("qualification"));
						details.setExpertise(rs.getString("expertise"));
						details.setAboutyourself(rs.getString("aboutyourself"));
						details.setFilename(rs.getString("photoname"));
						details.setCertificate1filename(rs.getString("certificate1filename"));
						details.setCertificate2filename(rs.getString("certificate2filename"));
						details.setCertificate3filename(rs.getString("certificate3filename"));
						
//						details.setTitle(rs.getString("title"));
//						details.setStarttime(rs.getString("starttime"));
//						details.setEndtime(rs.getString("endtime"));
//						details.setSelecteddays(rs.getString("selectedDayNames"));
//						details.setMonthlyfees(rs.getString("fee"));
//						details.setClasslevel(rs.getString("classlevel"));
	
						Blob blob = rs.getBlob("photo");

						InputStream inputStream = blob.getBinaryStream();
						ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
						byte[] buffer = new byte[4096];
						int bytesRead = -1;

						while ((bytesRead = inputStream.read(buffer)) != -1) {
							outputStream.write(buffer, 0, bytesRead);
						}

						byte[] imageBytes = outputStream.toByteArray();
						String base64Image = Base64.getEncoder().encodeToString(imageBytes);

						details.setBase64Image(base64Image);

						inputStream.close();
						outputStream.close();

						TrainersList.add(details);
					
//						System.out.println(rs.getString("title"));
						userJsonString = this.gson.toJson(TrainersList);
						out.write(userJsonString);
					}
				}
				
			 }	
		  }
		
		catch(SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			throw new IllegalArgumentException(e);
		}
	}
}

