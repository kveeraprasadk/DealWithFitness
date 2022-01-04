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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import main.common.DBConnection;
import main.common.Json;
import main.model.SeriesSchedulesVO;
import main.model.TrainerDetailsVO;


/**
 * Servlet implementation class TrainerDetailsView
 */
@WebServlet(name="TrainerDetailsView", urlPatterns = "/TrainerDetailsView")
public class TrainerDetailsView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	public String traineremail;
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
		
	
		traineremail = (String) request.getParameter("trainersemail");
		String userJsonString=null;
		System.out.println("traineremail2::" + traineremail);
		
		try (Connection connection = DBConnection.createConnection()) {
		try (PreparedStatement statement = connection.prepareStatement("select * from trainerregister where traineremail=?")) 
	//       try (PreparedStatement statement = connection.prepareStatement("select tr.trainername,tr.traineremail,tr.experience,tr.qualification,tr.aboutyourself,tr.photoname,tr.photo,tr.certificate1filename,tr.certificate2filename,tr.certificate3filename,ss.title,ss.starttime,ss.endtime,ss.endByDate,ss.selectedDayNames,ss.trainerpreference,ss.fee,ss.classlevel,ss.expertise,ss.democlass from trainerregister tr,schedulesseries ss where tr.traineremail=ss.traineremail and tr.traineremail=?")) 
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
					List<TrainerDetailsVO> sschedules=schedulesView(traineremail);
//						System.out.println(rs.getString("title"));
					TrainersList.addAll(sschedules);
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
	public List<TrainerDetailsVO> schedulesView(String email){
		
		List<TrainerDetailsVO> TrainersList = new ArrayList<TrainerDetailsVO>();		
		
		System.out.println("trainerscheduleemail::" +email);
		
		try (Connection connection = DBConnection.createConnection()) {
		try (PreparedStatement statement = connection.prepareStatement("select ss.traineremail,ss.id,ss.title,ss.selectedDayNames,ss.fee,ss.classlevel,ss.expertise,ss.starttime,ss.endtime from schedulesSeries ss where ss.traineremail=?")) 
	//    try (PreparedStatement statement = connection.prepareStatement("select tr.trainername,tr.traineremail,tr.experience,tr.qualification,tr.aboutyourself,tr.photoname,tr.photo,tr.certificate1filename,tr.certificate2filename,tr.certificate3filename,ss.title,ss.starttime,ss.endtime,ss.endByDate,ss.selectedDayNames,ss.trainerpreference,ss.fee,ss.classlevel,ss.expertise,ss.democlass from trainerregister tr,schedulesseries ss where tr.traineremail=ss.traineremail and tr.traineremail=?")) 
			{
				statement.setString(1, email);
				try (ResultSet rs = statement.executeQuery()) {

					while (rs.next()) {
						// Defining Student Object
						TrainerDetailsVO details = new TrainerDetailsVO();						
						
						details.setEmail(rs.getString("traineremail"));						
						details.setId(rs.getString("id"));
						details.setTitle(rs.getString("title"));
						
						details.setSelecteddays(rs.getString("selectedDayNames"));
						details.setMonthlyfees(rs.getString("fee"));
						details.setClasslevel(rs.getString("classlevel"));
						details.setScheduleExpertise(rs.getString("expertise"));
						
						// milliseconds
					    long startmSec = rs.getLong("starttime");
					    long endmSec = rs.getLong("endtime");
					    // Creating date format
					    DateFormat simple = new SimpleDateFormat("MMM-dd, yyyy HH:mm aa");

					    // using Date() constructor
					    Date startresult = new Date(startmSec);
					    Date endresult = new Date(endmSec);
				//	    System.out.println(simple.format(result));					   
					    details.setStarttime(simple.format(startresult));
					    details.setEndtime(simple.format(endresult));
					    
//					    if (rs.getString("traineeId") != null) {
//					    	details.getAttendees().add(rs.getString("traineeId"));
//						}
					    
						TrainersList.add(details);		
						
						
					}
				}
				
			 }	
		  }
		
		catch(SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			throw new IllegalArgumentException(e);
		}
		return TrainersList;
		
	}

}

