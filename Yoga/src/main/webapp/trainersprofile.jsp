<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="main.model.TrainerDetailsVO"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>DealWithFitness</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="profile/css/bootstrap.min.css">
<link rel="shortcut icon" href="profile/images/fav.jpg">
<link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css" href="profile/css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
		
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>


	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	<script src="js/TrainerProfile.js"></script>
	<script src="profile/js/jquery-3.2.1.min.js"></script>
	<script src="profile/js/popper.min.js"></script>
	<script src="profile/js/bootstrap.min.js"></script>
	<script src="profile/js/script.js"></script>
<script src="./dist/whoami.js"></script>

<style>
.toggle.ios, .toggle-on.ios, .toggle-off.ios {
	border-radius: 20px;
}

.toggle.ios .toggle-handle {
	border-radius: 20px;
}

.unstyled-button {
	border: none;
	padding: 0;
	background: none;
}
.error {
	color: #FF0000 !important;
}
</style>
<style>
/* The Modal (background) */
.modal-new {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 395px;
  top: 90px;
  width: 40%; /* Full width */
  height: 90%; /* Full height */

  padding-top: 50px;
}
/* Modal Content/Box */
.content-new {
 /* background-color: #828282;  */
    background-color: #d9edf7;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888; 
  width: 80%; /* Full width */
  height: 100%; /* Full height */
}
/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
	float: left;
	width: 50%;
}

/* Add a color to the cancel button */
.cancelbtn {
	background-color: #ccc;
	color: black;
}

/* Add a color to the delete button */
.deletebtn {
/*	background-color: #f44336; */
	background-color: 	#4169E1;
}



/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The Modal Close Button (x) */
.close {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: red;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

.unstyled-button {
	border: none;
	padding: 0;
	background: none;
}
/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .deletebtn {
		width: 100%;
	}
}
</style>

<script src="./dist/external/tui-code-snippet.min.js"></script>
<script src="./dist/external/moment.min.js"></script>
<script src="./dist/external/tui-calendar.min.js"></script>
<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/trainer-booking.js"></script>

<link rel="stylesheet" type="text/css"
	href="./css/external/tui-date-picker.css">
<link rel="stylesheet" type="text/css"
	href="./css/external/tui-time-picker.css">
<link rel="stylesheet" type="text/css"
	href="./css/external/tui-calendar.min.css">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/bookings.css">
<link rel="stylesheet" type="text/css" href="./css/icons.css">
<link rel="stylesheet" type="text/css" href="./css/common.css">

<script type="text/javascript">
	var calendarInitialized = false;

	function switchView(viewName) {
		$("#profile-container").css("display",
				viewName === "profile" ? "block" : "none");
		if (viewName === "calendar") {
			$("#calendar-container").css("display", "block");
			// Very first time do a lazy init
			if (!calendarInitialized) {
				trainerCalendar.init();
				calendarInitialized = true;
			}
		} else {
			$("#calendar-container").css("display", "none");
		}
	}

	function renderTrainerProfile() {
		switchView("calendar");
		whoami.detect(()=> {
			const image = $("#trainer-profile-base64-encoded-element").val();
			if (image) {
				console.log("Profile picture present")
				$("#profile-image-element").attr("src",
						"data:image/*;base64," + image);
			} else {
				console.log("No profile picture");
			}		
		})
	}
</script>
</head>

<body onLoad="renderTrainerProfile()">

	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<%@include file="./html/dialogs.html"%>
	<!-- Nav Bar End -->

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainer's Zone</h2>
				</div>
				<div class="col-12">
					<a href="javascript: switchView('calendar')" class="btn btn-info">My Training
						Calendar</a>
					<a href="javascript: switchView('profile')" class="btn btn-info">Profile</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Trainers calendar html inclusion -->
	<%@include file="./html/dialogs.html"%>
	<%@include file="./html/trainer-calender-booking.html"%>
	<%@include file="./html/recurrence-confirmation-dialog.html"%>

	<!-- About Start -->
	<div class="container-fluid overcover" id="profile-container"
		style="display: none">
		<div class="container profile-box">
			<div class="cover-image row"></div>
			<%
			ArrayList<TrainerDetailsVO> trainers = (ArrayList<TrainerDetailsVO>) request.getAttribute("TrainerProfileData");
			%>

			<%
			// Iterating through subjectList
			if (trainers != null && trainers.size() > 0) // Null check for the object
			{
				Iterator<TrainerDetailsVO> iterator = trainers.iterator(); // Iterator interface
				int inv = 0;
				for (TrainerDetailsVO trainerdetails : trainers) // iterate through all the data until the last record
				{
					//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
					inv++;
					//	System.out.println("My Investor: "+ trainerdetails.getName());
			%>
			<div class="row">
				<div class="col-lg-8 col-md-7 detail-px no-padding">
					<h3 class="mth3">Profile</h3>
					<div class="right">
						<button class="btn btn-info editprofileicon">
							<i class="fa fa-edit blue-color " ></i>
							<span style="font-size: 14px">Edit Profile</span>
						</button>
					</div>
					<input type="hidden" id="trainer-profile-base64-encoded-element"
						value="<%=trainerdetails.getBase64Image()%>" />
					<form role="form" id="trainerprofileupdateform" name="trainerprofileupdateform" class="trainerprofileupdateform">
					<div class="fx-ro">
						<div class="dat col-lg-4">Trainer Email</div>
						<div class="dat col-lg-8">
							<b id="trainer-id"><%=trainerdetails.getEmail()%></b>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Trainer Name</div>
						<div class="dat col-lg-8">
						<input type="text" name="formname"
									class="form-name form-control" id="formname"
									value="<%=trainerdetails.getName()%>" required>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Experience</div>
						<div class="dat col-lg-8">
							<select name="formexperience" id="formexperience"
									class="form-control required" onfocus='this.size=5;'
									onblur='this.size=1;' onchange='this.size=1; this.blur();'
									required>
									<option value="<%=trainerdetails.getExperience()%>"><%=trainerdetails.getExperience()%></option>
									<option value="upto 2Yr">upto 2Yr</option>
									<option value="2 to 5Yrs">2 to 5Yrs</option>
									<option value="5 to 10Yrs">5 to 10Yrs</option>
									<option value="10 to 20Yrs">10 to 20Yrs</option>
									<option value="Above 20Yrs">Above 20Yrs</option>
								</select>						
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Qualification</div>
						<div class="dat col-lg-8">
							<input type="text" name="formqualification"
									class="form-qualification form-control" id="formqualification"
									value="<%=trainerdetails.getQualification()%>" required>							
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Phone Number</div>
						<div class="dat col-lg-8">
							<input type="text" name="formphone"
									class="form-phone form-control" id="formphone"
									value="<%=trainerdetails.getPhoneno()%>" required>							
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Expertise</div>
						<div class="dat col-lg-8">
							<select name="formexpertise" id="formexpertise"
									class="form-control required" 
									required>
												<option value="<%=trainerdetails.getExpertise()%>"><%=trainerdetails.getExpertise()%></option>
												<optgroup label="Yoga">
													<option value="Yoga for health">Yoga for health</option>
													<option value="Weight Loss">Weight Loss</option>
													<option value="Kids Yoga">Kids Yoga</option>
													<option value="Pregnancy Yoga">Pregnancy Yoga</option>
													<option value="Meditation">Meditation</option>
												</optgroup>
												<optgroup label="Dance Group">
													<option value="Tomcat v7.0 Server at localhost">Dance</option>
													<option value="Zumba">Zumba</option>
												</optgroup>
												<option value="Weight / Body weight Workout">Weight
													/ Body weight Workout</option>
												<option value="Nutrition">Nutrition</option>
								</select>						
						</div>
					</div>	
					<div class="fx-ro">
						<div class="dat col-lg-4">About Trainer</div>
						<div class="dat col-lg-8">
							<textarea class="form-control" id="formaboutself"
									name="formaboutself" placeholder="About Yourself.." required><%=trainerdetails.getAboutyourself()%></textarea>							
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4"></div>
						<div class="dat col-lg-8">
							<button type="submit" class="btn btn-primary"
									name="updatebutton" id="updatebutton"><i class="fa fa-edit blue-color " ></i>&nbsp Update</button>
						</div>
					</div>
					</form>
					<div id="updatesuccess"></div>
					<h3 class="mth3">Certificates</h3>

					<ul class="exrts">
						<li><%=trainerdetails.getCertificate1filename()%></li>
						<li>
							<%
							if (trainerdetails.getCertificate1filename().length() > 3) {
							%>
							
							<a class="downloadReport btn btn-info" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate1DownloadServlet?user=<%=trainerdetails.getEmail() %>,<%=trainerdetails.getCertificate1filename() %>"><i class="fa fa-download blue-color " ></i>&nbspDownload</a>
							<%
							}
							%>
						</li>
						<li><%=trainerdetails.getCertificate2filename()%></li>
						<li>
							<%
							if (trainerdetails.getCertificate2filename().length() > 3) {
							%>
							<a class="downloadReport btn btn-info" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate2DownloadServlet?user=<%=trainerdetails.getEmail() %>,<%=trainerdetails.getCertificate2filename() %>"><i class="fa fa-download blue-color " ></i>&nbspDownload</a>
							<%
							System.out.println("tt::" + trainerdetails.getCertificate2filename().length());
							}
							%>
						</li>
						<li><%=trainerdetails.getCertificate3filename()%></li>
						<li>
							<%
							if (trainerdetails.getCertificate3filename().length() > 3) {
							%>
							<a class="downloadReport btn btn-info" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate3DownloadServlet?user=<%=trainerdetails.getEmail() %>,<%=trainerdetails.getCertificate3filename() %>"><i class="fa fa-download blue-color " ></i>&nbspDownload</a>
							<%
							}
							%>
						</li>
					</ul>

				</div>

				<div class="col-lg-4 col-md-5 leftgh flex-column flex-halign-center flex-valign-center">

					<a onclick="document.getElementById('id01').style.display='block'"
						href="#" title="Profile Picture Update" data-toggle="popover"
						data-placement="bottom">
						<div class="bh-img">
							<img id="profile-image-element" alt="">
							<!-- 	<span class="glyphicon glyphicon-camera"></span>  -->
						</div>
					</a>




					<div id="id01" class="modal modal-new">
						<span
							onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal">×</span>

						<form class="modal-content content-new" role="form"
							enctype="multipart/form-data"
							action="TrainerProfilePicUpdateServlet"
							id="trainerprofilepictureupdate"
							name="trainerprofilepictureupdate" method="post">
							<div class="container">
								<h3 class="text-center">Update Profile Picture</h3>
								<h6>Please Select Update Picture !</h6>
								<p class="text-center">
									<input type="file" name="formimage"
										class="form-image form-control" id="form-image"
										accept="image/*" onchange="preview_image(event)">
								<div class="bh-img" >
									<img id="output_image" />
								</div>
								</p>
								<br>
								<div class="clearfix">
									<button type="button"
										onclick="document.getElementById('id01').style.display='none'"
										class="cancelbtn">Cancel</button>
									<button type="submit"
										onclick="document.getElementById('id01').style.display='none'"
										class="deletebtn">Save</button>
								</div>
							</div>
						</form>
					</div>

					<script type='text/javascript'>
		function preview_image(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output_image');
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

					<div class="name-det">
						<h2><%=trainerdetails.getName()%></h2>
						<h3>Contact</h3>
						<p><%=trainerdetails.getName()%>
							<br>
						</p>
						<p><%=trainerdetails.getEmail()%>
							<br>
						</p>
						<%
						}
						}
						%>
						<form id="trainerppchangepassword" name="trainerppchangepassword">
							<p>
								<button class="btn btn-info trainerchangepassword"><i class="fa fa-key" aria-hidden="true"></i>&nbspChange
									Password</button>
							</p>
							<div id="changepasswordhide">
								<p>
									<input type="password" name="formcurrentpassword"
										placeholder="Current Password.."
										class="form-currentpassword form-control"
										id="formcurrentpassword" required>
								</p>

								<p>
									<input type="password" name="formnewpassword"
										placeholder="New Password.."
										class="form-newpassword form-control" id="formnewpassword"
										required>
								</p>

								<p>
									<input type="password" name="formconfirmpassword"
										placeholder="Confirm Password.."
										class="form-confirmpassword form-control"
										id="formconfirmpassword" required>
								</p>
								<button type="button" class="btn btn-primary"
									name="changepasswordbutton" id="changepasswordbutton">Change</button>

							</div>
							<div id="success"></div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#trainerppchangepassword").validate({
				rules : {
					formcurrentpassword : {
						required : true,
						minlength : 6
					},

					formnewpassword : {
						required : true,
						minlength : 6
					},
					formconfirmpassword : {
						required : true,
						equalTo : "#formnewpassword"
					}
				},
				messages : {
					formcurrentpassword : {
						required : "please enter password",
						minlength : "Password min 6 characters"
					},
					formnewpassword : {
						required : "please enter password",
						minlength : "Password min 6 characters"
					},
					formconfirmpassword : {
						required : "please enter confirm password",
						equalTo : "password doesn match"
					}
				}
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#editprofilehide').hide();
			$('#changepasswordhide').hide();
			$('#updatebutton').hide();

			$(".trainereditprofile").click(function() {
				$('#editprofilehide').toggle();
			});
			$(".trainerchangepassword").click(function() {
				$('#changepasswordhide').toggle();
			});
			$(".editprofileicon").click(function() {
				$('#updatebutton').toggle();
			});
		});
	</script>
	
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#changepasswordbutton")
									.click(
											function() {

												event.preventDefault();
												var currentpass = $(
														'#formcurrentpassword')
														.val();
												var newpass = $(
														'#formnewpassword')
														.val();
												var confirmpass = $(
														'#formconfirmpassword')
														.val();

												$
														.ajax({
															url : "TrainersChangePasswordServlet",
															type : "POST",
															data : {
																currentpassword : currentpass,
																newpassword : newpass,
																confirmpassword : confirmpass
															},
															cache : false,

															success : function(
																	data) {

																$('#success')
																		.html(
																				"<div class='alert alert-success'>");
																$(
																		'#success > .alert-success')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#success > .alert-success')
																		.append(
																				"<strong>"
																						+ data
																						+ ". </strong>");
																$(
																		'#success > .alert-success')
																		.append(
																				'</div>');
																$(
																		'#changepasswordhide')
																		.hide();
															},
															error : function() {
																$('#success')
																		.html(
																				"<div class='alert alert-danger'>");
																$(
																		'#success > .alert-danger')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#success > .alert-danger')
																		.append(
																				$(
																						"<strong>")
																						.text(
																								"Sorry "
																										+ name
																										+ ", update failed. Please try again later!"));
																$(
																		'#success > .alert-danger')
																		.append(
																				'</div>');

															}

														});

											});
						});
	</script>

	<!-- About End -->

	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top">
		<i class="fa fa-chevron-up"></i>
	</a>


	
</body>
</html>
