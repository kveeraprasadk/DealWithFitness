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

<link rel="shortcut icon" href="profile/images/fav.jpg">
<link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css" href="profile/css/style.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>

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
	<!-- Nav Bar End -->

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainer's Zone</h2>
				</div>
				<div class="col-12">
					<a href="javascript: switchView('calendar')">My Training
						Calendar</a> <a href="javascript: switchView('profile')">My Profile</a>
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
	<div class="container-fluid overcover" id="profile-container" style="display: none">
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
					<input type="hidden" id="trainer-profile-base64-encoded-element"
						value="<%=trainerdetails.getBase64Image()%>" />
					<div class="fx-ro">
						<div class="dat">
							Name : <b><%=trainerdetails.getName()%></b>
						</div>

					</div>
					<div class="fx-ro">
						<div class="dat">
							Email : <b id="trainer-id"><%=trainerdetails.getEmail()%></b>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat">
							Experience : <b><%=trainerdetails.getExperience()%></b>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat">
							Qualification : <b><%=trainerdetails.getQualification()%></b>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat">
							Phoneno : <b><%=trainerdetails.getPhoneno()%></b>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat">
							Expertise : <b><%=trainerdetails.getExpertise()%></b>
						</div>
					</div>
					<h3>About Trainer</h3>
					<p><%=trainerdetails.getAboutyourself()%></p>

					<h3 class="mth3">Certificates</h3>

					<ul class="exrts">
						<li><%=trainerdetails.getCertificate1filename()%></li>
						<li>
							<%
							if (trainerdetails.getCertificate1filename().length() > 3) {
							%>
							<button class="btn">Download</button> <%
 }
 %>
						</li>
						<li><%=trainerdetails.getCertificate2filename()%></li>
						<li>
							<%
							if (trainerdetails.getCertificate2filename().length() > 3) {
							%>
							<button class="btn">Download</button> <%
 System.out.println("tt::" + trainerdetails.getCertificate2filename().length());
 }
 %>
						</li>
						<li><%=trainerdetails.getCertificate3filename()%></li>
						<li>
							<%
							if (trainerdetails.getCertificate3filename().length() > 3) {
							%>
							<button class="btn">Download</button> <%
 }
 %>
						</li>
					</ul>

				</div>
				<div
					class="col-lg-4 col-md-5 leftgh flex-column flex-halign-center flex-valign-center">
					<div class="bh-img">
						<img id="profile-image-element" alt="">
					</div>
					<div class="name-det">
						<h2><%=trainerdetails.getName()%></h2>
						<h3>Contact</h3>
						<p><%=trainerdetails.getName()%>
							<br>
						</p>
						<p><%=trainerdetails.getEmail()%>
							<br>
						</p>
						<p>
							<button class="btn btn-info trainereditprofile">Edit
								Profile</button>
						</p>
						<div id="editprofilehide">

							<p>
								<input type="text" name="form-name"
									class="form-name form-control" id="form-name"
									value="<%=trainerdetails.getName()%>" required>
							</p>
							<p>
								<input type="text" name="form-qualification"
									class="form-qualification form-control" id="form-qualification"
									value="<%=trainerdetails.getQualification()%>" required>
							</p>
							<p>
								<select name="form-experience" id="form-experience"
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
							</p>
							<p>
								<input type="text" name="form-phone"
									class="form-phone form-control" id="form-phone"
									value="<%=trainerdetails.getPhoneno()%>" required>
							</p>
							<p>
								<select name="form-expertise" id="form-expertise"
									class="form-control required" onfocus='this.size=5;'
									onblur='this.size=1;' onchange='this.size=1; this.blur();'
									required>
									<option value="<%=trainerdetails.getExpertise()%>"><%=trainerdetails.getExpertise()%></option>
									<option value="Yoga for health">Yoga for health</option>
									<option value="Weight Loss">Weight Loss</option>
									<option value="Kids Yoga">Kids Yoga</option>
									<option value="Pregnancy Yoga">Pregnancy Yoga</option>
									<option value="Meditation">Meditation</option>
								</select>
							</p>
							<p>
								<textarea class="form-control" id="form-aboutself"
									name="form-aboutself" placeholder="About Yourself.." required><%=trainerdetails.getAboutyourself()%></textarea>
							</p>
							<button type="button" class="btn btn-primary" name="updatebutton"
								id="updatebutton">Update</button>
						</div>
						<div id="updatesuccess"></div>
						<%
						}
						}
						%>
						<form id="trainerppchangepassword" name="trainerppchangepassword">
							<p>
								<button class="btn btn-info trainerchangepassword">Change
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
			$('#addmoreclass2').hide();
			$('#addmoreclass3').hide();

			$(".trainereditprofile").click(function() {
				$('#editprofilehide').toggle();
			});
			$(".trainerchangepassword").click(function() {
				$('#changepasswordhide').toggle();
			});
			$("#addclass2").click(function() {
				$('#addmoreclass2').show();
				$('#addclass2').hide();
				$('#addclass3').show();
			});
			$("#addclass3").click(function() {
				$('#addmoreclass3').show();
				$('#addclass3').hide();
			});
		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#updatebutton")
									.click(
											function() {

												event.preventDefault();
												var name = $("#form-name")
														.val();
												var exper = $(
														"#form-experience")
														.val();
												var qua = $(
														"#form-qualification")
														.val();
												var phone = $("#form-phone")
														.val();

												var exp = $("#form-expertise")
														.val();

												var message = $(
														"#form-aboutself")
														.val();

												$
														.ajax({
															url : "TrainerProfileDetailsUpdateServlet",
															type : "POST",
															data : {
																name : name,
																experience : exper,
																qualification : qua,
																phone : phone,
																expertise : exp,
																aboutyourself : message
															},
															cache : false,

															success : function(
																	data) {

																$(
																		'#updatesuccess')
																		.html(
																				"<div class='alert alert-success'>");
																$(
																		'#updatesuccess > .alert-success')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#updatesuccess > .alert-success')
																		.append(
																				"<strong>"
																						+ data
																						+ ". </strong>");
																$(
																		'#updatesuccess > .alert-success')
																		.append(
																				'</div>');
																$(
																		'#editprofilehide')
																		.hide();
																document.location.href = './TrainerProfile';
															},
															error : function() {
																$(
																		'#updatesuccess')
																		.html(
																				"<div class='alert alert-danger'>");
																$(
																		'#updatesuccess > .alert-danger')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#updatesuccess > .alert-danger')
																		.append(
																				$(
																						"<strong>")
																						.text(
																								"Sorry "
																										+ name
																										+ ", update failed. Please try again later!"));
																$(
																		'#updatesuccess > .alert-danger')
																		.append(
																				'</div>');

															}

														});

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
	<div class="footer wow fadeIn" data-wow-delay="0.3s">
		<div class="container-fluid">
			<div class="container">
				<div class="footer-info">
					<a href="index.jsp" class="footer-logo">DealWithFitness<span></span></a>

					<div class="footer-menu">

						<p>dealwithfitness64@gmail.com</p>
					</div>
					<div class="footer-social">
						<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
							class="fab fa-facebook-f"></i></a> <a href=""><i
							class="fab fa-youtube"></i></a> <a href=""><i
							class="fab fa-instagram"></i></a> <a href=""><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
			<div class="container copyright">
				<div class="row">
					<div class="col-md-6">
						<p>
							&copy; <a href="#">dealwithfitness</a>, All Right Reserved.
						</p>
					</div>
					<div class="col-md-6">
						<p>
							Designed By <Strong>Bluehorse Creative Team</Strong>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

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
	<script src="profile/js/popper.min.js"></script>
	<script src="profile/js/bootstrap.min.js"></script>
	<script src="profile/js/script.js"></script>
</body>
</html>
