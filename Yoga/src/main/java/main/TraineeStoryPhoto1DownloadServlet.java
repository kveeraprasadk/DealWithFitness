package main;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.common.DBConnection;

/**
 * Servlet implementation class TraineeStoryPhoto1DownloadServlet
 */
public class TraineeStoryPhoto1DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int BUFFER_SIZE = 40965;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tid = (String) request.getParameter("user");
		System.out.println("original::"+tid);
		String traineeid=null,trainerid = null, fname = null;
		String[] res = tid.split("[,]", 0);
		int ins = 0;
		for (String myStr : res) {
			if (ins == 0) {
				traineeid = myStr;
				ins++;
			} else if (ins == 1) {
				trainerid = myStr;
				ins++;
			}else{
				fname = myStr; 
			}
			System.out.println(myStr);
		}		
		System.out.println("list::"+traineeid+trainerid+fname);
		try (Connection conn = DBConnection.createConnection()) {
			// connects to the database

			// queries the database
			String sql = "SELECT * FROM traineeStories WHERE traineeId = ? and trainerId = ? and filename1 = ?";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, traineeid);
			statement.setString(2, trainerid);
			statement.setString(3, fname);

			ResultSet result = statement.executeQuery();
			System.out.println("enter");
			if (result.next()) {
				// gets file name and file blob data
				String fileName = result.getString("filename1");
				Blob blob = result.getBlob("photo1");
				InputStream inputStream = blob.getBinaryStream();
				int fileLength = inputStream.available();

				System.out.println("fileLength = " + fileLength + fileName + blob);

				ServletContext context = getServletContext();

				// sets MIME type for the file download
				String mimeType = context.getMimeType(fileName);
				System.out.println("mime::" + mimeType);
				if (mimeType == null) {
					mimeType = "application/octet-stream";
				}

				// set content properties and header attributes for the response
				response.setContentType(mimeType);
				response.setContentLength(fileLength);
				String headerKey = "Content-Disposition";
				String headerValue = String.format("attachment; filename=\"%s\"", fileName);
				response.setHeader(headerKey, headerValue);

				// writes the file to the client
				OutputStream outStream = response.getOutputStream();

				byte[] buffer = new byte[BUFFER_SIZE];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				System.out.println("buffer::" + buffer);
				inputStream.close();
				outStream.close();

			} else {
				// no file found
				response.getWriter().print("File not found for the id: " + traineeid);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			response.getWriter().print("SQL Error: " + ex.getMessage());
		} catch (IOException ex) {
			ex.printStackTrace();
			response.getWriter().print("IO Error: " + ex.getMessage());
		} finally {
			if (DBConnection.createConnection() != null) {
				// closes the database connection
				try {
					DBConnection.createConnection().close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		}
	}

}
