package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import main.common.DBConnection;
import main.model.TraineeStory;
import main.model.TrainerDetailsVO;



public class TrainerRequestDao {
	public List<TrainerDetailsVO> TrainersRequests() throws SQLException,
    ClassNotFoundException {
List<TrainerDetailsVO> TrainersReq = new ArrayList<TrainerDetailsVO>();
		
		//   System.out.println("traineremail2::"+traineremail);
		
		try(Connection 	connection = DBConnection.createConnection()){
String sql ="select * from trainerregister where adminapprove=? order by creationtime desc"; 
try(PreparedStatement statement = connection.prepareStatement(sql)){
statement.setBoolean(1, false);
try(ResultSet rs = statement.executeQuery()){

while (rs.next()) {

	// Defining Student Object
	TrainerDetailsVO details = new TrainerDetailsVO();

	details.setName(rs.getString("trainername"));
	details.setEmail(rs.getString("traineremail"));	
	details.setExperience(rs.getString("experience"));
	details.setQualification(rs.getString("qualification"));
	details.setExpertise(rs.getString("expertise"));
	details.setPhone(rs.getString("phoneno"));
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

}
}
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
		
		 try(Connection connection = DBConnection.createConnection()){
String sql ="select * from trainerregister where adminapprove=? order by creationtime desc"; 

try(PreparedStatement statement = connection.prepareStatement(sql)){
statement.setBoolean(1, true);
try(ResultSet rs = statement.executeQuery()){



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
}
}
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
try(Connection 	connection = DBConnection.createConnection()){
String sql ="select * from traineeregister order by createtime desc"; 

try(PreparedStatement statement = connection.prepareStatement(sql)){

try(ResultSet rs = statement.executeQuery()){



while (rs.next()) {

	// Defining Student Object
	TrainerDetailsVO details = new TrainerDetailsVO();

	details.setEmail(rs.getString("username"));
	details.setPassword(rs.getString("password"));
	if(rs.getString("traineename") != null){
		details.setName(rs.getString("traineename"));
		}else{
		details.setName(" ");	
		}
	if(rs.getString("dob") != null){
			details.setDob(rs.getString("dob"));
	}else{
		details.setDob(" ");
	}
		if(rs.getString("target") != null){
		details.setTarget(rs.getString("target"));
		}else{
		details.setTarget(" ");
		}
		if(rs.getString("ailment") != null){
		details.setAnyailment(rs.getString("ailment"));
		}else{
			details.setAnyailment(" ");
		}
		if(rs.getString("state") != null){
		details.setState(rs.getString("state"));
		}else{
		details.setState(" ");
		}
		if(rs.getString("city") != null){
		details.setCity(rs.getString("city"));
		}else{
		details.setCity(" ");
		}
		if(rs.getString("phone") != null){
		details.setPhone(rs.getString("phone"));
		}else{
			details.setPhone(" ");
		}
	details.setCreatetime(rs.getTimestamp("createtime"));

	System.out.println("list::"+details);
	// Adding the Student Object to List
	TraineesList.add(details);
//	fos.close();	
}

//Closing the Resources

rs.close();
statement.close();
connection.close();
}
}
} catch (SQLException e) {

System.out.println(e.getMessage());
e.printStackTrace();
} 
return TraineesList;
}
	
	public List<TraineeStory> TraineeStoryRequest() throws SQLException,
    ClassNotFoundException {
List<TraineeStory> tstoryrequest = new ArrayList<TraineeStory>();
		
		
try(Connection 	connection = DBConnection.createConnection()){
String sql ="select * from traineeStories where adminapprove=? order by creationTime desc"; 

try(PreparedStatement statement = connection.prepareStatement(sql)){
statement.setString(1, "false");
try(ResultSet rs = statement.executeQuery()){



while (rs.next()) {

	// Defining Student Object
	TraineeStory details = new TraineeStory();

	details.setTraineeId(rs.getString("traineeid"));
	details.setTrainerId(rs.getString("trainerid"));	
	details.setStory(rs.getString("story"));		
	if(rs.getString("filename1") != null){
	details.setFilename1(rs.getString("filename1"));
	}else{
		details.setFilename1("");
	}
	if(rs.getString("filename2") != null){
	details.setFilename2(rs.getString("filename2"));
	}else{
		details.setFilename2("");
	}
	// details.setCreationTime(rs.getLong("creationTime"));
	Long vv=rs.getLong("creationTime");
	String convertedExpireTime = Long.toString(vv);
	//Create a calendar instance
	Calendar calendar = Calendar.getInstance();
	calendar.setTimeInMillis(Long.parseLong(convertedExpireTime));
	int mYear = calendar.get(Calendar.YEAR);
	int mMonth = calendar.get(Calendar.MONTH);
	int mDay = calendar.get(Calendar.DAY_OF_MONTH);
	int mHour = calendar.get(Calendar.HOUR_OF_DAY);
	int mMin = calendar.get(Calendar.MINUTE);
	int mSec = calendar.get(Calendar.SECOND);
	String readableFormat = mYear + "-" + mMonth + "-" + mDay + " " + mHour + ":"+ mMin + ":"+ mSec; // The value is now converted to 2019-6-27 0:59:59
	details.setTrainerName(readableFormat);
	
	// Adding the Student Object to List
	tstoryrequest.add(details);
//	fos.close();	
}

//Closing the Resources

rs.close();
statement.close();
connection.close();
}
}
} catch (SQLException e) {

System.out.println(e.getMessage());
e.printStackTrace();
} 
return tstoryrequest;
}
}
