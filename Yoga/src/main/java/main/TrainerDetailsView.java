package main;

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
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import main.common.DBConnection;
import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TrainerDetailsView
 */

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

		// String traineremail="ravi@gmail.com";
		System.out.println("traineremail2::" + traineremail);
		Connection connection = null;
		PreparedStatement statement = null;
		try {

			connection = DBConnection.createConnection();
			String sql = "select * from trainerregister where traineremail=?";

			statement = connection.prepareStatement(sql);
			statement.setString(1, traineremail);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				// Defining Student Object
				TrainerDetailsVO details = new TrainerDetailsVO();

				details.setName(rs.getString("trainername"));
				details.setEmail(rs.getString("traineremail"));
				details.setExperience(rs.getString("experience"));
				details.setQualification(rs.getString("qualification"));
				details.setExpertise(rs.getString("expertise"));
		/*		details.setSchedule(rs.getString("schedules"));
				details.setClasslevel(rs.getString("classlevel"));
				details.setMonthlyfees(rs.getString("monthlyfees"));
				details.setExpertise2(rs.getString("expertise2"));
				details.setSchedule2(rs.getString("schedules2"));
				details.setClasslevel2(rs.getString("classlevel2"));
				details.setMonthlyfees2(rs.getString("monthlyfees2"));
				details.setExpertise3(rs.getString("expertise3"));
				details.setSchedule3(rs.getString("schedules3"));
				details.setClasslevel3(rs.getString("classlevel3"));
				details.setMonthlyfees3(rs.getString("monthlyfees3"));
	*/			details.setAboutyourself(rs.getString("aboutyourself"));
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

//	System.out.println("list::"+details);
				// Adding the Student Object to List
				TrainersList.add(details);
//	fos.close();	

				/*
				 * TrainersList.add(rs.getString("trainername"));
				 * TrainersList.add(rs.getString("traineremail"));
				 * TrainersList.add(rs.getString("expertise"));
				 * TrainersList.add(rs.getString("schedules"));
				 * TrainersList.add(rs.getString("classlevel"));
				 * TrainersList.add(rs.getString("monthlyfees"));
				 * TrainersList.add(rs.getString("aboutyourself"));
				 * TrainersList.add(rs.getString("photoname"));
				 * TrainersList.add(rs.getString("certificate1filename"));
				 * TrainersList.add(rs.getString("certificate2filename"));
				 * TrainersList.add(rs.getString("certificate3filename"));
				 * System.out.println("list::"+TrainersList);
				 */

				String userJsonString = this.gson.toJson(TrainersList);
				// String str1="success";
				out.write(userJsonString);
			}

//Closing the Resources

			rs.close();
			statement.close();
			connection.close();

//request.setAttribute("TrainerProfileData", TrainersList);
//request.getRequestDispatcher("/trainersprofile.jsp").forward(request, response);

		} catch (SQLException e) {

			System.out.println(e.getMessage());
			e.printStackTrace();
		}

	}

}
