package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.common.DBConnection;
import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TrainerClassListOptionalServlet
 */
@WebServlet(name = "/TrainerClassListOptionalServlet", urlPatterns = "/classexpertiselist")
public class TrainerClassListOptionalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<TrainerDetailsVO> TrainersList = new ArrayList<TrainerDetailsVO>();
		String expertise = (String) request.getParameter("expertise");
		System.out.println("exp::" + expertise);
		Connection connection = null;
		PreparedStatement statement = null, statement2 = null, statement3 = null;
		try {

			connection = DBConnection.createConnection();

			String sql = "select * from trainerregister where expertise=?";

			statement = connection.prepareStatement(sql);
			statement.setString(1, expertise);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {

				// Defining Student Object
				TrainerDetailsVO details = new TrainerDetailsVO();

				details.setName(rs.getString("trainername"));
				details.setEmail(rs.getString("traineremail"));
				details.setExpertise(rs.getString("expertise"));
				details.setSchedule(rs.getString("schedules"));
				details.setClasslevel(rs.getString("classlevel"));
				details.setMonthlyfees(rs.getString("monthlyfees"));
				details.setDemo1(rs.getString("class1demo"));
				details.setFilename(rs.getString("photoname"));

				/*
				 * Blob blob = rs.getBlob("photo");
				 * 
				 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
				 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
				 * int bytesRead = -1;
				 * 
				 * while ((bytesRead = inputStream.read(buffer)) != -1) {
				 * outputStream.write(buffer, 0, bytesRead); }
				 * 
				 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
				 * Base64.getEncoder().encodeToString(imageBytes);
				 * 
				 * details.setBase64Image(base64Image);
				 * 
				 * 
				 * inputStream.close(); outputStream.close();
				 */
				// Adding the Student Object to List
				TrainersList.add(details);
				System.out.println(TrainersList);
//	fos.close();	
			}
			statement.close();

			String sql2 = "select * from trainerregister where expertise2=?";

			statement2 = connection.prepareStatement(sql2);
			statement2.setString(1, expertise);
			rs = statement2.executeQuery();
			while (rs.next()) {

				// Defining Student Object
				TrainerDetailsVO details = new TrainerDetailsVO();

				details.setName(rs.getString("trainername"));
				details.setEmail(rs.getString("traineremail"));
				details.setExpertise(rs.getString("expertise2"));
				details.setSchedule(rs.getString("schedules2"));
				details.setClasslevel(rs.getString("classlevel2"));
				details.setMonthlyfees(rs.getString("monthlyfees2"));
				details.setDemo1(rs.getString("class2demo"));
				details.setFilename(rs.getString("photoname"));

				/*
				 * Blob blob = rs.getBlob("photo");
				 * 
				 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
				 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
				 * int bytesRead = -1;
				 * 
				 * while ((bytesRead = inputStream.read(buffer)) != -1) {
				 * outputStream.write(buffer, 0, bytesRead); }
				 * 
				 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
				 * Base64.getEncoder().encodeToString(imageBytes);
				 * 
				 * details.setBase64Image(base64Image);
				 * 
				 * 
				 * inputStream.close(); outputStream.close();
				 */
				// Adding the Student Object to List
				TrainersList.add(details);

//	fos.close();	
			}
			statement2.close();

			String sql3 = "select * from trainerregister where expertise3=?";

			statement3 = connection.prepareStatement(sql3);
			statement3.setString(1, expertise);
			rs = statement3.executeQuery();
			while (rs.next()) {

				// Defining Student Object
				TrainerDetailsVO details = new TrainerDetailsVO();

				details.setName(rs.getString("trainername"));
				details.setEmail(rs.getString("traineremail"));
				details.setExpertise(rs.getString("expertise3"));
				details.setSchedule(rs.getString("schedules3"));
				details.setClasslevel(rs.getString("classlevel3"));
				details.setMonthlyfees(rs.getString("monthlyfees3"));
				details.setDemo1(rs.getString("class3demo"));
				details.setFilename(rs.getString("photoname"));

				/*
				 * Blob blob = rs.getBlob("photo");
				 * 
				 * InputStream inputStream = blob.getBinaryStream(); ByteArrayOutputStream
				 * outputStream = new ByteArrayOutputStream(); byte[] buffer = new byte[4096];
				 * int bytesRead = -1;
				 * 
				 * while ((bytesRead = inputStream.read(buffer)) != -1) {
				 * outputStream.write(buffer, 0, bytesRead); }
				 * 
				 * byte[] imageBytes = outputStream.toByteArray(); String base64Image =
				 * Base64.getEncoder().encodeToString(imageBytes);
				 * 
				 * details.setBase64Image(base64Image);
				 * 
				 * 
				 * inputStream.close(); outputStream.close();
				 */
				// Adding the Student Object to List
				TrainersList.add(details);

//	fos.close();	
			}
// Closing the Resources

			rs.close();
			statement3.close();
			connection.close();

			request.setAttribute("AllTrainersList", TrainersList);
			request.getRequestDispatcher("/trainerclassexp.jsp").forward(request, response);

		} catch (SQLException e) {

			System.out.println(e.getMessage());
			e.printStackTrace();
		}

	}

}
