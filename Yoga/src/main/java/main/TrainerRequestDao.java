package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import main.common.DBConnection;
import main.model.TrainerDetailsVO;



public class TrainerRequestDao {
	public List<TrainerDetailsVO> TrainersRequests() throws SQLException,
    ClassNotFoundException {
List<TrainerDetailsVO> TrainersReq = new ArrayList<TrainerDetailsVO>();
		
		//   System.out.println("traineremail2::"+traineremail);
		Connection connection=null;
		 PreparedStatement statement=null;
		try{

		connection = DBConnection.createConnection();
String sql ="select * from trainertemptable order by creationtime desc"; 

statement = connection.prepareStatement(sql);

ResultSet rs = statement.executeQuery();



while (rs.next()) {

	// Defining Student Object
	TrainerDetailsVO details = new TrainerDetailsVO();

	details.setName(rs.getString("trainername"));
	details.setEmail(rs.getString("traineremail"));	
	details.setExperience(rs.getString("experience"));
	details.setQualification(rs.getString("qualification"));
	details.setExpertise(rs.getString("expertise"));
/*	details.setSchedule(rs.getString("schedules"));
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
*/	details.setAboutyourself(rs.getString("aboutyourself"));
	details.setFilename(rs.getString("photoname"));
	details.setCertificate1filename(rs.getString("certificate1filename"));
	details.setCertificate2filename(rs.getString("certificate2filename"));
	details.setCertificate3filename(rs.getString("certificate3filename"));
	details.setCreatetime(rs.getTimestamp("creationtime"));
/*	Blob blob = rs.getBlob("photo");
	
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
	
*/

//	System.out.println("list::"+details);
	// Adding the Student Object to List
	TrainersReq.add(details);
//	fos.close();	
}

//Closing the Resources

rs.close();
statement.close();
connection.close();


} catch (SQLException e) {

System.out.println(e.getMessage());
e.printStackTrace();
} 
return TrainersReq;
}
	public List<TrainerDetailsVO> TrainersList() throws SQLException,
    ClassNotFoundException {
List<TrainerDetailsVO> TrainersList = new ArrayList<TrainerDetailsVO>();
		
		//   System.out.println("traineremail2::"+traineremail);
		Connection connection=null;
		 PreparedStatement statement=null;
		try{

		connection = DBConnection.createConnection();
String sql ="select * from trainerregister order by creationtime desc"; 

statement = connection.prepareStatement(sql);

ResultSet rs = statement.executeQuery();



while (rs.next()) {

	// Defining Student Object
	TrainerDetailsVO details = new TrainerDetailsVO();

	details.setName(rs.getString("trainername"));
	details.setEmail(rs.getString("traineremail"));	
	details.setExperience(rs.getString("experience"));
	details.setQualification(rs.getString("qualification"));
	details.setExpertise(rs.getString("expertise"));
/*	details.setSchedule(rs.getString("schedules"));
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
*/	details.setAboutyourself(rs.getString("aboutyourself"));
	details.setFilename(rs.getString("photoname"));
	details.setCertificate1filename(rs.getString("certificate1filename"));
	details.setCertificate2filename(rs.getString("certificate2filename"));
	details.setCertificate3filename(rs.getString("certificate3filename"));
	details.setCreatetime(rs.getTimestamp("creationtime"));
/*	Blob blob = rs.getBlob("photo");
	
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
	
*/

//	System.out.println("list::"+details);
	// Adding the Student Object to List
	TrainersList.add(details);
//	fos.close();	
}

//Closing the Resources

rs.close();
statement.close();
connection.close();


} catch (SQLException e) {

System.out.println(e.getMessage());
e.printStackTrace();
} 
return TrainersList;
}
	public List<TrainerDetailsVO> TraineesList() throws SQLException,
    ClassNotFoundException {
List<TrainerDetailsVO> TraineesList = new ArrayList<TrainerDetailsVO>();
		
		//   System.out.println("traineremail2::"+traineremail);
		Connection connection=null;
		 PreparedStatement statement=null;
		try{

		connection = DBConnection.createConnection();
String sql ="select * from traineeregister order by createtime desc"; 

statement = connection.prepareStatement(sql);

ResultSet rs = statement.executeQuery();



while (rs.next()) {

	// Defining Student Object
	TrainerDetailsVO details = new TrainerDetailsVO();

	details.setEmail(rs.getString("username"));
	details.setPassword(rs.getString("password"));
	details.setName(rs.getString("traineename"));
	details.setDob(rs.getString("dob"));
	details.setTarget(rs.getString("target"));
	details.setAnyailment(rs.getString("ailment"));
	details.setCity(rs.getString("city"));
	details.setPhone(rs.getString("phone"));
	details.setCreatetime(rs.getTimestamp("createtime"));
/*	Blob blob = rs.getBlob("photo");
	
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
	
*/

	System.out.println("list::"+details);
	// Adding the Student Object to List
	TraineesList.add(details);
//	fos.close();	
}

//Closing the Resources

rs.close();
statement.close();
connection.close();


} catch (SQLException e) {

System.out.println(e.getMessage());
e.printStackTrace();
} 
return TraineesList;
}
}
