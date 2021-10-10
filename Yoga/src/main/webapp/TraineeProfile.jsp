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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<link rel="shortcut icon" href="profile/images/fav.jpg">
<link rel="stylesheet" href="profile/css/bootstrap.min.css">
<link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css" href="profile/css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />

<!-- Template Stylesheet -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>
<link href="css/style.css" rel="stylesheet">
<script src="./dist/whoami.js"></script>
</head>

<body onLoad="LoadingTrainersProfileData()">
	<script type="text/javascript">
		function LoadingTrainersProfileData() {
			whoami.detect();
			$.ajax({
						type : 'GET',
						url : "${pageContext.request.contextPath}/TraineeProfileViewServlet",
					});
		}
	</script>

	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<span class="logo-text">DEALWITHFITNESS</span>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav ml-auto">
					<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
						href="About.jsp" class="nav-item nav-link">About</a> <a
						href="./logoutservice" class="nav-item nav-link"
						id="user-logout-element" style="display: none">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Nav Bar End -->


	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainee's Zone</h2>
				</div>
				<div class="col-12">
					<a href="traineelandingpage.jsp">My Trainings</a> <a href="javascript:">My Profile</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- About Start -->
	<div class="container-fluid overcover">
		<div class="container profile-box">
			<div class="cover-image row">
				<!--           <img src="profile/images/bloogs-6.jpg" alt="">  -->
			</div>
			<%
			ArrayList<TrainerDetailsVO> trainees = (ArrayList<TrainerDetailsVO>) request.getAttribute("traineeProfileData");
			%>


			<%
			// Iterating through subjectList
			if (trainees != null && trainees.size() > 0) // Null check for the object
			{
				Iterator<TrainerDetailsVO> iterator = trainees.iterator(); // Iterator interface
				int inv = 0;
				for (TrainerDetailsVO traineedetails : trainees) // iterate through all the data until the last record
				{
					//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
					inv++;
					//	System.out.println("My Investor: "+ traineedetails.getName());
			%>
			<div class="row">
				<div class="col-lg-8 col-md-7 detail-px no-padding">


					<h3 class="mth3">Please Update your profile with following
						fields for better services</h3>
					<div class="fx-ro">
						<div class="dat col-lg-4">Trainee Name</div>
						<div class="dat col-lg-8">
							<input type="text" name="form-name"
								class="form-name form-control" id="form-name"
								value="<%=traineedetails.getName()%>" required>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Trainee Email</div>
						<div class="dat col-lg-8">
							<input type="text" name="form-email"
								class="form-email form-control" id="form-email"
								value="<%=traineedetails.getEmail()%>" required
								disabled="disabled">
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">DoB</div>
						<div class="dat col-lg-8">
							<input type="date" name="form-dob" class="form-dob form-control"
								id="form-dob" value="<%=traineedetails.getDob()%>" required>
						</div>
					</div>

					<div class="fx-ro">
						<div class="dat col-lg-4">Target</div>
						<div class="dat col-lg-8">
							<input type="text" name="form-target"
								class="form-target form-control" id="form-target"
								value="<%=traineedetails.getTarget()%>" required>
						</div>
					</div>

					<div class="fx-ro">
						<div class="dat col-lg-4">Any Ailment</div>
						<div class="dat col-lg-8">
							<input type="text" name="form-ailment"
								class="form-ailment form-control" id="form-ailment"
								value="<%=traineedetails.getAnyailment()%>" required>
						</div>
					</div>

					<div class="fx-ro">
						<div class="dat col-lg-4">Phone</div>
						<div class="dat col-lg-8">
							<input type="text" name="form-phone"
								class="form-phone form-control" id="form-phone"
								value="<%=traineedetails.getPhone()%>" required>
						</div>
					</div>

					<div class="fx-ro">
						<div class="dat col-lg-4">city</div>
						<div class="dat col-lg-8">
							<input type="text" name="form-city"
								class="form-city form-control" id="form-city"
								value="<%=traineedetails.getCity()%>" required>
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4"></div>
						<div class="dat col-lg-8">
							<button type="submit" class="btn btn-primary"
								id="traineeprofileupdate">Update</button>
						</div>
					</div>
					<div id="updatesuccess"></div>
					

					<h3>Trainers</h3>
					<!--          <ptraineedetails.getAboutyourself()f() %></p>     -->



				</div>
				<div class="col-lg-4 col-md-5 leftgh">
					<div class="img-box">
						<img src="profile/images/gallery/gallery_12.jpg" alt="">
					</div>
					<div class="name-det">


						<h2><%=traineedetails.getName()%></h2>

						<h3>Contact</h3>

						<p><%=traineedetails.getName()%>
							<br>
						</p>

						<p><%=traineedetails.getEmail()%>
							<br>
						</p>
						<%
						}
						}
						%>

						<form id="traineeppchangepassword" name="traineeppchangepassword">
							<h3>
								<a class="trainerchangepassword" data-toggle="collapse" data-target="#changepasswordhide">Change Password</a>
							</h3>
							<div id="changepasswordhide" class="collapse">
								<p>
									<input type="text" name="formcurrentpassword"
										placeholder="Current Password.."
										class="form-currentpassword form-control"
										id="formcurrentpassword" required>
								</p>

								<p>
									<input type="text" name="formnewpassword"
										placeholder="New Password.."
										class="form-newpassword form-control" id="formnewpassword"
										required>
								</p>

								<p>
									<input type="text" name="formconfirmpassword"
										placeholder="Confirm Password.."
										class="form-confirmpassword form-control"
										id="formconfirmpassword" required>
								</p>
								<button type="button" class="btn btn-primary" name="changepasswordbutton"
									id="changepasswordbutton">Change</button>
									<button type="button" class="btn btn-danger" 
									id="closebutton">Close</button>

							</div>
							<div id="success"></div>
						</form>
						<h3 style="display: none">
							<a href="./TraineeLogoutServlet">Logout</a>
						</h3>
					</div>


				</div>
			</div>



		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#traineeppchangepassword").validate({
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
			$('.classlevelhide').hide();
			$('.schedulehide').hide();
			$(".trainereditprofile").click(function() {
				$('#editprofilehide').show();
			});
			$(".trainerchangepassword").click(function() {
				$('#changepasswordhide').show();
			});
			$(".classhide").click(function() {
				$('.classlevelhide').show();
				$('.schedulehide').show();
			});
			$("#closebutton").click(function() {
				$('#changepasswordhide').hide();
			});
		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#traineeprofileupdate")
									.click(
											function() {

												event.preventDefault();
												var name = $("#form-name")
														.val();
												var email = $("#form-email")
														.val();
												var dob = $("#form-dob").val();
												var target = $("#form-target")
														.val();
												var ailment = $("#form-ailment")
														.val();
												var phone = $("#form-phone")
														.val();
												var city = $("#form-city")
														.val();
												alert(email);

												$
														.ajax({
															url : "TraineeProfileDetailsUpdateServlet",
															type : "POST",
															data : {
																name : name,
																email : email,
																dob : dob,
																target : target,
																ailment : ailment,
																phone : phone,
																city : city

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
																document.location.href = './TraineeProfile';
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
															url : "TraineesChangePasswordServlet",
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

	<script src="profile/js/jquery-3.2.1.min.js"></script>
	<script src="profile/js/popper.min.js"></script>
	<script src="profile/js/bootstrap.min.js"></script>
	<script src="profile/js/script.js"></script>
</body>
</html>
