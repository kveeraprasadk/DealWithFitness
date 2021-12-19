package main.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TrainerDetailsVO {
	private String name;
	private String email;
	private String expertise;
	private String schedule;
	private String classlevel;
	private String monthlyfees;
	private String expertise2;
	private String schedule2;
	private String classlevel2;
	private String monthlyfees2;
	private String expertise3;
	private String schedule3;
	private String classlevel3;
	private String monthlyfees3;
	private String aboutyourself;
	private String filename;
	private Blob image;
	private byte[] picture;
	private String base64Image;
	private String certificate1filename;
	private String certificate2filename;
	private String certificate3filename;
	private Timestamp createtime;
	private String password;
	private String qualification;
	private String experience;
	private String phoneno;
	private String username;
	private String dob;
	private String target;
	private String anyailment;
	private String state;
	private String city;
	private String phone;
	private String demo1;
	private String demo2;
	private String demo3;
	private String comment;
	private String subject;	
	private String title;
	private String starttime;
	private String endtime;
	private String selecteddays;
	private String defdays;
	
	public String getSelecteddays() {
		return selecteddays;
	}

	public void setSelecteddays(String selecteddays) {
		this.selecteddays = selecteddays;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	private List<SeriesSchedulesVO> series = new ArrayList<>();
	

	public List<SeriesSchedulesVO> getSeries() {
		return series;
	}

	public void setSeries(List<SeriesSchedulesVO> series) {
		this.series = series;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getBase64Image() {
		return base64Image;
	}

	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getClasslevel() {
		return classlevel;
	}

	public void setClasslevel(String classlevel) {
		this.classlevel = classlevel;
	}

	public String getMonthlyfees() {
		return monthlyfees;
	}

	public void setMonthlyfees(String monthlyfees) {
		this.monthlyfees = monthlyfees;
	}

	public String getExpertise2() {
		return expertise2;
	}

	public void setExpertise2(String expertise2) {
		this.expertise2 = expertise2;
	}

	public String getSchedule2() {
		return schedule2;
	}

	public void setSchedule2(String schedule2) {
		this.schedule2 = schedule2;
	}

	public String getClasslevel2() {
		return classlevel2;
	}

	public void setClasslevel2(String classlevel2) {
		this.classlevel2 = classlevel2;
	}

	public String getMonthlyfees2() {
		return monthlyfees2;
	}

	public void setMonthlyfees2(String monthlyfees2) {
		this.monthlyfees2 = monthlyfees2;
	}

	public String getExpertise3() {
		return expertise3;
	}

	public void setExpertise3(String expertise3) {
		this.expertise3 = expertise3;
	}

	public String getSchedule3() {
		return schedule3;
	}

	public void setSchedule3(String schedule3) {
		this.schedule3 = schedule3;
	}

	public String getClasslevel3() {
		return classlevel3;
	}

	public void setClasslevel3(String classlevel3) {
		this.classlevel3 = classlevel3;
	}

	public String getMonthlyfees3() {
		return monthlyfees3;
	}

	public void setMonthlyfees3(String monthlyfees3) {
		this.monthlyfees3 = monthlyfees3;
	}

	public String getAboutyourself() {
		return aboutyourself;
	}

	public void setAboutyourself(String aboutyourself) {
		this.aboutyourself = aboutyourself;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public byte[] getPicture() {
		return picture;
	}

	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public String getCertificate1filename() {
		return certificate1filename;
	}

	public void setCertificate1filename(String certificate1filename) {
		this.certificate1filename = certificate1filename;
	}

	public String getCertificate2filename() {
		return certificate2filename;
	}

	public void setCertificate2filename(String certificate2filename) {
		this.certificate2filename = certificate2filename;
	}

	public String getCertificate3filename() {
		return certificate3filename;
	}

	public void setCertificate3filename(String certificate3filename) {
		this.certificate3filename = certificate3filename;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getAnyailment() {
		return anyailment;
	}

	public void setAnyailment(String anyailment) {
		this.anyailment = anyailment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDemo1() {
		return demo1;
	}

	public void setDemo1(String demo1) {
		this.demo1 = demo1;
	}

	public String getDemo2() {
		return demo2;
	}

	public void setDemo2(String demo2) {
		this.demo2 = demo2;
	}

	public String getDemo3() {
		return demo3;
	}

	public void setDemo3(String demo3) {
		this.demo3 = demo3;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getDefdays() {
		return defdays;
	}

	public void setDefdays(String defdays) {
		this.defdays = defdays;
	}

	
}
