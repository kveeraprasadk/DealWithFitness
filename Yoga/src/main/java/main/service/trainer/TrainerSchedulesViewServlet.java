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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
 * Servlet implementation class TrainerSchedulesViewServlet
 */
@WebServlet(name="TrainerSchedulesViewServlet", urlPatterns = "/TrainerSchedulesViewServlet")
public class TrainerSchedulesViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Gson gson = new Gson();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		List<TrainerDetailsVO> TrainersList = new ArrayList<TrainerDetailsVO>();		
		Map<String, SeriesSchedulesVO> commentSeriesbyviewers = new LinkedHashMap<>();
	
		String traineremail = (String) request.getParameter("trainersemail");
		String userJsonString=null;
		System.out.println("trainerscheduleemail::" + traineremail);
		
		try (Connection connection = DBConnection.createConnection()) {
		try (PreparedStatement statement = connection.prepareStatement("select * from schedulesSeries where traineremail=?")) 
	//i need this query asif sir       try (PreparedStatement statement = connection.prepareStatement("select tr.trainername,tr.traineremail,tr.experience,tr.qualification,tr.aboutyourself,tr.photoname,tr.photo,tr.certificate1filename,tr.certificate2filename,tr.certificate3filename,ss.title,ss.starttime,ss.endtime,ss.endByDate,ss.selectedDayNames,ss.trainerpreference,ss.fee,ss.classlevel,ss.expertise,ss.democlass from trainerregister tr,schedulesseries ss where tr.traineremail=ss.traineremail and tr.traineremail=?")) 
			{
				statement.setString(1, traineremail);
				try (ResultSet rs = statement.executeQuery()) {

					while (rs.next()) {
						// Defining Student Object
						TrainerDetailsVO details = new TrainerDetailsVO();
						SeriesSchedulesVO seriesVo = new SeriesSchedulesVO();
						
						details.setEmail(rs.getString("traineremail"));						
						
						details.setTitle(rs.getString("title"));
						details.setStarttime(rs.getString("starttime"));
						details.setEndtime(rs.getString("endtime"));
						details.setSelecteddays(rs.getString("selectedDayNames"));
						details.setMonthlyfees(rs.getString("fee"));
						details.setClasslevel(rs.getString("classlevel"));
						details.setExpertise(rs.getString("expertise"));
						
					//	TrainersList.add(details);
						System.out.println("schedule::"+details);
						seriesVo.setTrainer(details);
						// Just create dummy id so that we can add to map, this id has no significant.
				       commentSeriesbyviewers.put(UUID.randomUUID().toString(), seriesVo);				       

//						userJsonString = this.gson.toJson(TrainersList);
//						out.write(userJsonString);
						
						response.setContentType("application/json");
						response.getWriter().write(Json.stringify(commentSeriesbyviewers.values()));
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

