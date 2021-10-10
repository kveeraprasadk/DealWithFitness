package main.service.trainer;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

import main.common.DBConnection;
import main.model.TrainerDetailsVO;

/**
 * Servlet implementation class TrainersProfileViewServlet
 */
@WebServlet(name = "/TrainersProfileViewServlet", urlPatterns = "/TrainerProfile")
public class TrainersProfileViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		List<TrainerDetailsVO> TrainersList = new ArrayList<TrainerDetailsVO>();
		HttpSession session = request.getSession();
		String traineremail = (String) session.getAttribute("traineremail");

		System.out.println("traineremail1::" + traineremail);

		try (Connection connection = DBConnection.createConnection()) {
			String sql = "select * from trainerregister where traineremail=?";
			try (PreparedStatement statement = connection.prepareStatement(sql)) {
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
						details.setDemo3(rs.getString("class3demo"));
						details.setAboutyourself(rs.getString("aboutyourself"));
						details.setFilename(rs.getString("photoname"));
						details.setCertificate1filename(rs.getString("certificate1filename"));
						details.setCertificate2filename(rs.getString("certificate2filename"));
						details.setCertificate3filename(rs.getString("certificate3filename"));

						details.setBase64Image(asBlobEncoded(rs.getBlob("photo")));

						System.out.println("list::" + details);
						// Adding the Student Object to List
						TrainersList.add(details);
					}
					request.setAttribute("TrainerProfileData", TrainersList);
					request.getRequestDispatcher("/trainersprofile.jsp").forward(request, response);
				}
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			throw new IllegalArgumentException(e);
		}
	}

	private String asBlobEncoded(Blob blob) throws SQLException, IOException {
		try (InputStream inputStream = blob.getBinaryStream()) {
			try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				return Base64.getEncoder().encodeToString(imageBytes);
			}
		}
	}
}
