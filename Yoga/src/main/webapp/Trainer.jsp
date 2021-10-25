<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>DealWithFitness</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<!-- Favicon -->

<link rel="icon" href="img/yoga-icon1.jpg">
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

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="./dist/whoami.js"></script>
<!-- jQuery library -->


<script src="https://apis.google.com/js/platform.js" async defer></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta name="google-signin-client_id" content="GOOGLEID">
<!-- Add Google ID -->


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/ico/apple-touch-icon-57-precomposed.png">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<!-- JavaScript Libraries -->

<script src="lib/easing/easing.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/isotope/isotope.pkgd.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>

<!-- Contact Javascript File -->


<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="./dist/trainers.js"></script>
<script src="./dist/dialogs.js"></script>
<!-- Javascript -->
<script src="assets/js/scripts.js"></script>

<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
<script>
	function init() {
		whoami.detect();
	}
</script>
<style type="text/css">
label {
	color: #FF0000 !important;
}

.unstyled-button {
	border: none;
	padding: 0;
	background: none;
}
</style>
</head>

<body onload="init()">
	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
<%@include file="./html/dialogs.html"%>
	<!-- Nav Bar End -->
	
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#trainerloginform')
									.validate(
											{
												rules : {
													username : {
														required : true,
														email : true
													},

													password : {
														required : true,
														minlength : 6
													}
												},
												messages : {
													username : {
														required : "Please Enter Username",
														email : "Please Enter Valid email"
													},
													password : {
														required : "Please Enter Password",
														minlength : "Please Enter Min 6 chars"
													}
												},

												submitHandler : function(form) {

													var username = $(
															'#username').val();
													var password = $(
															'#password').val();
													progressBar.start();
													$
															.ajax({
																url : "TrainerLoginServlet",
																type : "GET",
																data : {
																	username : username,
																	password : password
																},
																cache : false,
																success : function(
																		data) {
																	console
																			.log(data);
																	if (data == "Login Success") {
																		document.location.href = './TrainerProfile';
																	} else if (data == "Trainer Temp Login Success") {
																		document.location.href = './TrainerTempProfileshowing';

																	} else {
																		$(
																				'#regsuccess')
																				.html(
																						"<div class='alert alert-danger'>");
																		$(
																				'#regsuccess > .alert-danger')
																				.html(
																						"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																				.append(
																						"</button>");
																		$(
																				'#regsuccess > .alert-danger')
																				.append(
																						$(
																								"<strong>")
																								.text(
																										data));
																		$(
																				'#regsuccess > .alert-danger')
																				.append(
																						'</div>');
																	}
																},
																error : function(
																		data) {
																	$(
																			'#regsuccess')
																			.html(
																					"<div class='alert alert-danger'>");
																	$(
																			'#regsuccess > .alert-danger')
																			.html(
																					"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																			.append(
																					"</button>");
																	$(
																			'#regsuccess > .alert-danger')
																			.append(
																					$(
																							"<strong>")
																							.text(
																									data));
																	$(
																			'#regsuccess > .alert-danger')
																			.append(
																					'</div>');

																}
																complete: () => progressBar.end()
															});
													
													return false;
												}
											});
						});
	</script>
<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#trainerforgotform')
									.validate(
											{

												rules : {
													formforgotusername : {
														required : true,
														email : true
													}

													
												},
												messages : {
													formforgotusername : {
														required : "Please Enter Username",
														email : "Please Enter Valid email"
													}
												},

												submitHandler : function(form) {

													var username = $(
															'#formforgotusername').val();
													
													$
															.ajax({
																url : "TrainerForgotPasswordServlet",
																type : "Post",
																data : {
																	username : username
																	
																},
																cache : false,
																success : function(
																		data) {
																	console
																			.log(data);
																	if (data == "NewPassword Sent") {
																		
																		$(
																				'#forgotsuccess')
																				.html(
																						"<div class='alert alert-success'>");
																		$(
																				'#forgotsuccess > .alert-success')
																				.html(
																						"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																				.append(
																						"</button>");
																		$(
																				'#forgotsuccess > .alert-success')
																				.append(
																						$(
																								"<strong>")
																								.text(
																										data));
																		$(
																				'#forgotsuccess > .alert-success')
																				.append(
																						'</div>');
																	}else if(data == "New Password Creation Failed" || "Plz enter Registered EmailId"){
																		$(
																		'#forgotsuccess')
																		.html(
																				"<div class='alert alert-danger'>");
																$(
																		'#forgotsuccess > .alert-danger')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#forgotsuccess > .alert-danger')
																		.append(
																				$(
																						"<strong>")
																						.text(
																								data));
																$(
																		'#forgotsuccess > .alert-danger')
																		.append(
																				'</div>');

																	}
																},
																error : function(
																		data) {
																	$(
																			'#forgotsuccess')
																			.html(
																					"<div class='alert alert-danger'>");
																	$(
																			'#forgotsuccess > .alert-danger')
																			.html(
																					"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																			.append(
																					"</button>");
																	$(
																			'#forgotsuccess > .alert-danger')
																			.append(
																					$(
																							"<strong>")
																							.text(
																									data));
																	$(
																			'#forgotsuccess > .alert-danger')
																			.append(
																					'</div>');

																}

															});
													return false;
												}
											});
						});
	</script>


	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Login/Register as Trainer</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- REGISTER PAGE START -->
	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row pl pr">
					<div class="col-sm-5 form-box card bg-white" style="padding: 0px;">
						<ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3"
							id="myTab" role="tablist">
							<li class="nav-item" role="presentation"><a
								class="nav-link active" id="login-tab" data-toggle="tab"
								href="#login" role="tab" aria-controls="login"
								aria-selected="true"> <i class="fas fa-user mr-1"></i> Login
							</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								id="register-tab" data-toggle="tab" href="#register" role="tab"
								aria-controls="register" aria-selected="false"> <i
									class="fas fa-user-plus mr-1"></i> Register
							</a></li>
						</ul>

						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="login" role="tabpanel"
								aria-labelledby="login-tab">
								<div class="form-top">
									<div class="form-top-left">

										<h3>Login now</h3>

									</div>

									<div class="form-top-divider"></div>
								</div>
								<div class="form-bottom">
									<form role="form" id="trainerloginform" name="trainerloginform"
										class="login-form">
										<div class="form-group">
											<label class="sr-only" for="form-username">User Name</label>
											<input type="email" name="username"
												placeholder="User Name..."
												class="form-username form-control" id="username" required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-password">Password</label> <input
												type="password" name="password" placeholder="Password..."
												class="form-password form-control" id="password" required>
										</div>
										<div class="form-group">
											<div id="regsuccess"></div>
										</div>
										<div class="form-group">

											<button type="submit"
												class="btn trainerloginbutton btn-primary"
												id="trainerloginbutton">
												<i class="fas fa-sign-in-alt ml-1"></i> &nbsp Login
											</button>
										</div>
									</form>
									<div class="options text-center text-md-right mt-1">

										<p>
											Forgot <a href="#" class="blue-text forgotpasswordshow">Password?</a>
										</p>
									</div>
									<form role="form" id="trainerforgotform"
										name="trainerforgotform" class="forgot-form">
										<div class="form-group forgotusername">
											<label class="sr-only" for="form-forgotusername">User
												Name</label> <input type="email" name="formforgotusername"
												placeholder="User Name..."
												class="form-forgotusername form-control"
												id="formforgotusername" required>
										</div>
										<div class="form-group">
											<div id="forgotsuccess"></div>
										</div>
										<div class="form-group forgotbutton">
											<button type="submit"
												class="btn trainerforgotbutton btn-primary"
												id="trainerfotgotbutton">&nbsp Send</button>
										</div>
										<div class="form-group">
											<div id="forgotsuccess"></div>
										</div>

									</form>

								</div>
							</div>
							<div class="tab-pane fade" id="register" role="tabpanel"
								aria-labelledby="register-tab">
								<div class="form-top">
									<div class="form-top-left">
										<h3>Register now</h3>
										<p>Fill in the form below to get instant access:</p>
									</div>
									<div class="form-top-right">
										<i class="fa fa-pencil"></i>
									</div>
									<div class="form-top-divider"></div>
								</div>
								<div class="form-bottom">
									<form role="form" enctype="multipart/form-data"
										action="TrainerRegisterServlet" method="post"
										id="trainerregform" name="trainerregform"
										class="registration-form">
										<div class="form-group">
											<label class="sr-only" for="form-first-name">Name</label> <input
												type="text" name="formfirstname" placeholder="Name..."
												class="form-first-name form-control" id="form-first-name"
												required>
										</div>

										<div class="form-group">
											<label class="sr-only" for="form-email">Email</label> <input
												type="email" name="formemail" placeholder="Email..."
												class="form-email form-control" id="form-email" required>
										</div>

										<div class="form-group">
											<label class="sr-only" for="form-experience">Experience</label>
											<select name="formexperience" id="form-experience"
												class="form-control required" onfocus='this.size=5;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Experience</option>
												<option value="upto 2Yr">upto 2Yr</option>
												<option value="2 to 5Yrs">2 to 5Yrs</option>
												<option value="5 to 10Yrs">5 to 10Yrs</option>
												<option value="10 to 20Yrs">10 to 20Yrs</option>
												<option value="Above 20Yrs">Above 20Yrs</option>
											</select>
											<!--       	<input type="text" name="form-experience" placeholder="Experience..." class="form-experience form-control" id="form-experience" required>   -->
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-qualification">Qualification</label>

											<input type="text" name="formqualification"
												placeholder="Qualification..."
												class="form-qualification form-control"
												id="form-qualification" required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-expertise1">Expertise-1</label>
											<span style="font-size: 14px">Choose any Expert to
												know your suitable fitness guru</span> <select
												name="formexpertise1" id="form-expertise1"
												class="form-control required">
												<option value="">Choose Expertise</option>
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
										<div class="form-group">
											<label class="sr-only" for="form-phone">Qualification</label>

											<input type="text" name="formphone" placeholder="Phone..."
												class="form-phone form-control" id="form-phone" required>
										</div>


										<div class="form-group">
											<label class="sr-only" for="form-password">Password</label> <input
												type="password" name="formpassword"
												placeholder="Password..." class="form-password form-control"
												id="form-password" required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-password">ConfirmPassword</label>

											<input type="password" name="formcpassword"
												placeholder="Confirm Password..."
												class="form-cpassword form-control" id="form-cpassword"
												required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-aboutself"> <strong>About
													Yourself</strong>
											</label>
											<textarea class="form-control" id="form-aboutself"
												name="formaboutself" placeholder="About Yourself.."
												onKeyDown="limitText(this.form.formaboutself,this.form.countdown,1000);"
												onKeyUp="limitText(this.form.formaboutself,this.form.countdown,1000);"
												required></textarea>
											<font size="2"> (Maximum characters: 1000) You have <input
												readonly type="text" class="projdesc unstyled-button"
												name="countdown" size="2" value="1000"> characters
												left.
											</font>
										</div>

										<div class="form-group">
											<strong>Profile Picture</strong> <input type="file"
												name="formimage" class="form-image form-control"
												id="form-image" accept="image/*"
												onchange="preview_image(event)" required> <img
												id="output_image" />
										</div>
										<div class="form-group">
											<strong>Upload Certificates</strong>
											<div class="row">
												<div class="col-8">
													<input type="file" name="formcertificate1"
														class="form-certificate1" id="form-certificate1">
												</div>
												<div class="col-4">
													<button type="button" id="addcertificate1">Add
														More</button>
												</div>
											</div>
											<div class="row">
												<div class="col-8">
													<input type="file" name="form-certificate2"
														class="form-certificate2" id="form-certificate2">
												</div>
												<div class="col-4">
													<button type="button" id="addcertificate2">Add
														More</button>
												</div>
											</div>
											<div class="row">
												<div class="col-8">
													<input type="file" name="form-certificate3"
														class="form-certificate3" id="form-certificate3">
												</div>
											</div>
										</div>										
										<button type="submit"
											class="btn trainerregisterbutton btn-primary"
											id="trainerregisterbutton">
											<i class="fas fa-sign-in-alt ml-1"></i> &nbsp Register
										</button>
									</form>
								</div>
								<div id="success"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-7 text"
						style="margin-top: 0px; padding-top: 0px">
						<h1>
							<strong>DealWithFitness</strong> Trainer Login and Registration
							Forms
						</h1>
						<div class="description">
							<p>Please provide your details to receive a user name and
								password to submit your application for the Yoga Teacher
								Training Program. In case you face any difficulty in submitting
								the application, please contact at us
								dealwithfitness64@gmail.com.</p>
							<p>"The security and privacy of your personal information are
								very important to us. Your data will not be shared with any
								third party. We will soon reach out to you for your consent that
								will be used by us solely for the purpose of communicating
								information that supports you with the yogic practices learned
<<<<<<< Updated upstream
								from us, any upcoming events in Yoga and special offersâif
=======
								from us, any upcoming events in Yoga and special offers—if
>>>>>>> Stashed changes
								any, on our programs. You will have the right to have your
								details removed from our database at any point"</p>
						</div>
						<!--       <div class="top-big-link">
                            	<a class="btn btn-link-1" href="#">Button 1</a>
                            	<a class="btn btn-link-2" href="#">Button 2</a>
                            </div>       -->
					</div>
				</div>
			</div>
		</div>

	</div>
	<script language="javascript" type="text/javascript">
		function limitText(limitField, limitCount, limitNum) {
			if (limitField.value.length > limitNum) {
				limitField.value = limitField.value.substring(0, limitNum);
			} else {
				limitCount.value = limitNum - limitField.value.length;
			}
		}
	</script>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$('.forgotusername').hide();
			$('.forgotbutton').hide();
			$('#form-certificate2').hide();
			$('#form-certificate3').hide();
			$('#addcertificate2').hide();

			$(".forgotpasswordshow").click(function() {
				$('.forgotusername').toggle();
				$('.forgotbutton').toggle();
			});

			$("#addcertificate1").click(function() {
				$('#form-certificate2').toggle();
				$('#addcertificate2').toggle();
			});
			$("#addcertificate2").click(function() {
				$('#form-certificate3').toggle();
			});

		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#addsch2').hide();
			$('#addsch3').hide();
			$('#addsch4').hide();
			$('#addsch5').hide();
			$('#addsch6').hide();
			$("#addbutton1").click(function() {
				$('#addsch2').show();
			});
			$("#addbutton2").click(function() {
				$('#addsch3').show();
			});
			$("#addbutton3").click(function() {
				$('#addsch4').show();
			});
			$("#addbutton4").click(function() {
				$('#addsch5').show();
			});
			$("#addbutton5").click(function() {
				$('#addsch6').show();
			});
		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#trainerregform')
									.validate(
											{
												rules : {
													formfirstname : {
														required : true,
														minlength : 3,
														alphaNum : true

													},
													formemail : {
														required : true,
														email : true
													},
													formexpertise1 : {
														required : true
													},
													formexperience : {
														required : true
													},
													formqualification : {
														required : true
													},
													formphone : {
														required : true,
														minlength : 10,
														maxlength : 10,
														onlyNum : true
													},
													formclasslevel1 : {
														required : true
													},
													formfrom1 : {
														timey : true,
														required : true,
														rangelength : [ 2, 6 ]
													},
													formto1 : {
														timey : true,
														required : true,
														rangelength : [ 2, 6 ]
													},
													'roles' : {
														required : true
													},
													formmonthlyfees1 : {
														required : true

													},
													formpassword : {
														required : true,
														minlength : 6
													},
													formcpassword : {
														required : true,
														equalTo : "#form-password"
													},
													formaboutself : {
														required : true,
														minlength : 50
													},
													//			formcertificate1 : {
													//				required : true
													//			},
													formimage : {
														required : true,
														extension : "png|jpeg|jpg",
														//	filesize : 1048576
														filesize : 204576
													}

												},
												messages : {
													formfirstname : {
														required : "Please Enter name",
														minlength : "Name should be at least 3 characters"
													},
													formemail : {
														required : "Please Enter Email",
														email : "The email should be in the format: abc@domain.tld"
													},
													formexpertise1 : {
														required : "Please enter Expertise"
													},
													formexperience : {
														required : "Please enter Experience"
													},
													formclasslevel1 : {
														required : "Please enter Classlevel"
													},
													formqualification : {
														required : "Please enter Qualification"
													},
													formphone : {
														required : "Please enter phone number",
														minlength : "Phone Number must be 10 numbers",
														maxlength : "Phone Number must be 10 numbers"
													},
													formfrom1 : {
														required : "please enter class start time",

													},
													formto1 : {
														required : "please enter class end time"
													},
													'roles' : {
														required : "Plz Select Atleast One Option"
													},
													formmonthlyfees1 : {
														required : "please enter monthly fees"

													},
													formpassword : {
														required : "please enter password",
														minlength : "Password min 6 characters"
													},
													formcpassword : {
														required : "please enter confirm password",
														equalTo : "password doesn match"
													},
													formaboutself : {
														required : "please enter about yourself",
														minlength : "Please enter atleast 50 chars"
													},
													formimage : {
														required : "File must be JPEG or PNG, less than 200Kb"
													},
												//			formcertificate1 : {
												//				required : "Please Upload your certificate"
												//			}

												}
											});
							$.validator.addMethod('filesize', function(value,
									element, param) {
								return this.optional(element)
										|| (element.files[0].size <= param)
							});
							$.validator.addMethod("alphaNum", function(value,
									element) {
								return this.optional(element)
										|| value == value
												.match(/^[a-zA-Z\s]*$/);
							}, "please enter a valid name");
							$.validator.addMethod("onlyNum", function(value,
									element) {
								return this.optional(element)
										|| value == value
												.match(/^[1-9]{1}[0-9]{9}$/);
							}, "Phone number must be 10 numbers");

						});
	</script>

	<!--       
<script>
       $(document).on("click", ".trainerregister", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            var fname=$('#form-first-name').val();
       alert(fname);
            var email=$('#form-email').val();
            var exp=$('#form-expertise').val();
            var image=$('#form-image').val();
            var mfees=$('#form-monthly-fees').val();
            var l1 = document.getElementById("flexCheckDefaultschms9to11");  
            var l2 = document.getElementById("flexCheckDefaultschms11to1");  
            var l3 = document.getElementById("flexCheckDefaultschaf5to7");  
            var l4 = document.getElementById("flexCheckDefaultschev7to9");  
                        
            var res=" ";   
            if (l1.checked == true){  
              var pl1 = document.getElementById("flexCheckDefaultschms9to11").value;  
              res = pl1 + ",";   
            }   
            else if (l2.checked == true){  
              var pl2 = document.getElementById("flexCheckDefaultschms11to1").value;  
              res = res + pl2 + ",";   
            }  
            else if (l3.checked == true){  
            document.write(res);  
              var pl3 = document.getElementById("flexCheckDefaultschaf5to7").value;  
              res = res + pl3 + ",";   
            }  
            else if (l4.checked == true){  
              var pl4 = document.getElementById("flexCheckDefaultschev7to9").value;  
              res = res + pl4 + ",";   
            }            
           else {  
            return document.getElementById("result").innerHTML = "You have not selected anything";  
            }  
            return document.getElementById("result").innerHTML = "You have selected " + res + " languages";  
            
       
       var cl1 = document.getElementById("flexCheckDefaultbegining");  
       var cl2 = document.getElementById("flexCheckDefaultintermediate");  
       var cl3 = document.getElementById("flexCheckDefaultadvance");  
       var cl4 = document.getElementById("flexCheckDefaultalllevel");  
                   
       var classres=" ";   
       if (cl1.checked == true){  
         var cpl1 = document.getElementById("flexCheckDefaultbegining").value;  
         classres = cpl1 + ",";   
       }   
       else if (cl2.checked == true){  
         var cpl2 = document.getElementById("flexCheckDefaultintermediate").value;  
         classres = classres + cpl2 + ",";   
       }  
       else if (cl3.checked == true){  
       document.write(classres);  
         var cpl3 = document.getElementById("flexCheckDefaultadvance").value;  
         classres = classres + cpl3 + ",";   
       }  
       else if (cl4.checked == true){  
         var cpl4 = document.getElementById("flexCheckDefaultalllevel").value;  
         classres = classres + cpl4 + ",";   
       }            
      else {  
       return document.getElementById("classresult").innerHTML = "You have not selected anything";  
       }  
       return document.getElementById("classresult").innerHTML = "You have selected " + classres + " languages";  
     
  
                $.post("TrainerRegisterServlet",
                		{
                	name : fname,
                	email: email,
                	expertise : exp,
                	monthlyfees : mfees,
                	schedule : res,
                	image : image,
                	classlevel : classres
                	}, 
                		function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	if(responseText == "Register Success"){
                		
                		$('#reqsentsuccmsg').text(responseText);
                	$("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
              	      $("#success-alert").slideUp(500);
                	});
              	    
                	}else{
                		
                		$('#reqsentfailmsg').text("Request Sent Failed");
                		$("#danger-alert").fadeTo(2000, 500).slideUp(500, function() {
                    	      $("#danger-alert").slideUp(500);
                		});
                	
                	}
               
                });
            });
        </script>    
        -->
	<!-- REGISTER PAGE END -->




	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top"> <i class="fa fa-chevron-up"></i>
	</a>


</body>
</html>
