<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>DEALWITHFITNESS</title>
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

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>

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


<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<style type="text/css">
label {
	color: #FF0000 !important;
}
</style>
</head>

<body>
	<!-- Top Bar Start -->
	<div class="top-bar d-md-block">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8">
					<!--              <div class="top-bar-left">
                            <div class="text">
                                <i class="far fa-clock"></i>
                                <h2>8:00 - 9:00</h2>
                                <p>Mon - Fri</p>
                            </div>
                            <div class="text">
                                <i class="fa fa-phone-alt"></i>
                                <h2>+123 456 7890</h2>
                                <p>For Appointment</p>
                            </div>
                        </div>    -->
				</div>
				<div class="col-md-4">
					<div class="top-bar-right">
						<div class="social">
							<a href=""><i class="fab fa-twitter"></i></a> <a href=""><i
								class="fab fa-facebook-f"></i></a> <a href=""><i
								class="fab fa-linkedin-in"></i></a> <a href=""><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar End -->

	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a href="index.jsp" class="navbar-brand">Dealwithfitness<span></span></a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav ml-auto">
					<a href="index.jsp" class="nav-item nav-link ">Home</a> <a
						href="About.jsp" class="nav-item nav-link ">About</a> 

					<!--              <a href="blog.jsp" class="nav-item nav-link" >Blog</a>   -->

					<a href="Trainer.jsp" class="nav-item nav-link active">Trainer</a>

				</div>
			</div>
		</div>
	</div>
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
																	if (data == "Login Success") {
																		document.location.href = './TrainerProfile';
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
				<div class="col-12">
					<a href="index.jsp">Home</a> <a href="">Trainer</a>
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
				<div class="row">
					<div class="col-sm-7 text">

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
								from us, any upcoming events in Yoga and special offers—if any,
								on our programs. You will have the right to have your details
								removed from our database at any point"</p>
						</div>
						<!--       <div class="top-big-link">
                            	<a class="btn btn-link-1" href="#">Button 1</a>
                            	<a class="btn btn-link-2" href="#">Button 2</a>
                            </div>       -->
					</div>
					<div class="col-sm-5 form-box ">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item" role="presentation"><a
								class="nav-link active" id="login-tab" data-toggle="tab"
								href="#login" role="tab" aria-controls="login"
								aria-selected="true">Login</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								id="register-tab" data-toggle="tab" href="#register" role="tab"
								aria-controls="register" aria-selected="false">Register</a></li>
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
										<button type="submit" class="btn trainerloginbutton"
											id="trainerloginbutton">Login</button>
									</form>
									<div id="regsuccess"></div>
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
											<select name="formexpertise1" id="form-expertise1"
												class="form-control required" onfocus='this.size=5;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Expertise</option>
												<option value="Yoga for health">Yoga for health</option>
												<option value="Weight Loss">Weight Loss</option>
												<option value="Kids Yoga">Kids Yoga</option>
												<option value="Pregnancy Yoga">Pregnancy Yoga</option>
												<option value="Meditation">Meditation</option>
											</select>
										</div>
										<!-- 
								<div class="form-group">
									<label for="form-schedule"><strong>Schedule
											Preference</strong></label><br>
									<div id="addsch1" class="form-group">
										<div class="form-group">
											<label class="sr-only" for="form-expertise1">Expertise-1</label>
											<select name="formexpertise1" id="form-expertise1"
												class="form-control required" onfocus='this.size=5;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Expertise-1</option>
												<option value="Yoga for health">Yoga for health</option>
												<option value="Weight Loss">Weight Loss</option>
												<option value="Kids Yoga">Kids Yoga</option>
												<option value="Pregnancy Yoga">Pregnancy Yoga</option>
												<option value="Meditation">Meditation</option>
											</select>
											
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-classlevel1">Classlevel-1</label>
											<select name="formclasslevel1" id="form-classlevel1"
												class="form-control required" onfocus='this.size=3;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Classlevel-1</option>
												<option value="Level 1 - Beginner Class">Level 1 -
													Beginner Class</option>
												<option value="Level 2 - Intermediate Class">Level
													2 - Intermediate Class</option>
												<option value="Level 3 - Advance Class">Level 3 -
													Advance Class</option>
											</select>
											
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-monthly-fees1">Monthly
												Fees</label> <select name="formmonthlyfees1" id="form-monthly-fees1"
												class="form-control required" onfocus='this.size=5;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">MonthlyFees-1</option>
												<option value="600/-">600/-</option>
												<option value="800/-">800/-</option>
												<option value="1000/-">1000/-</option>
												<option value="1200/-">1200/-</option>
												<option value="1400/-">1400/-</option>
												<option value="1600/-">1600/-</option>

												<option value="1800/-">1800/-</option>
												<option value="2000/-">2000/-</option>
												<option value="2200/-">2200/-</option>
												<option value="2400/-">2400/-</option>
												<option value="2600/-">2600/-</option>

												<option value="2800/-">2800/-</option>
												<option value="3000/-">3000/-</option>
												<option value="3200/-">3200/-</option>
												<option value="3400/-">3400/-</option>
												<option value="3600/-">3600/-</option>

												<option value="3800/-">3800/-</option>
												<option value="4000/-">4000/-</option>
												<option value="4200/-">4200/-</option>
												<option value="4400/-">4400/-</option>
												<option value="4600/-">4600/-</option>
												<option value="4800/-">4800/-</option>
												<option value="5000/-">5000/-</option>
											</select>
											
										</div>
										<input type="time" name="formfrom1" class="form-from1"
											id="form-from1" required> <input type="time"
											name="formto1" class="form-to1" id="form-to1" required>
										<button type="button" id="addbutton1">Add More</button>

									</div>
									<div id="addsch2" class="form-group">
										<div class="form-group">
											<label class="sr-only" for="form-expertise2">Expertise-2</label>
											<select name="formexpertise2" id="form-expertise2"
												class="form-control required" onfocus='this.size=5;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Expertise-2</option>
												<option value="Yoga for health">Yoga for health</option>
												<option value="Weight Loss">Weight Loss</option>
												<option value="Kids Yoga">Kids Yoga</option>
												<option value="Pregnancy Yoga">Pregnancy Yoga</option>
												<option value="Meditation">Meditation</option>
											</select>
											
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-classlevel2">Classlevel-2</label>
											<select name="formclasslevel2" id="form-classlevel2"
												class="form-control required" onfocus='this.size=3;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Classlevel-2</option>
												<option value="Level 1 - Beginner Class">Level 1 -
													Beginner Class</option>
												<option value="Level 2 - Intermediate Class">Level
													2 - Intermediate Class</option>
												<option value="Level 3 - Advance Class">Level 3 -
													Advance Class</option>
											</select>
											
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-monthly-fees2">Monthly
												Fees2</label> <select name="formmonthlyfees2"
												id="form-monthly-fees2" class="form-control required"
												onfocus='this.size=5;' onblur='this.size=1;'
												onchange='this.size=1; this.blur();' required>
												<option value="">MonthlyFees-2</option>
												<option value="600/-">600/-</option>
												<option value="800/-">800/-</option>
												<option value="1000/-">1000/-</option>
												<option value="1200/-">1200/-</option>
												<option value="1400/-">1400/-</option>
												<option value="1600/-">1600/-</option>

												<option value="1800/-">1800/-</option>
												<option value="2000/-">2000/-</option>
												<option value="2200/-">2200/-</option>
												<option value="2400/-">2400/-</option>
												<option value="2600/-">2600/-</option>

												<option value="2800/-">2800/-</option>
												<option value="3000/-">3000/-</option>
												<option value="3200/-">3200/-</option>
												<option value="3400/-">3400/-</option>
												<option value="3600/-">3600/-</option>

												<option value="3800/-">3800/-</option>
												<option value="4000/-">4000/-</option>
												<option value="4200/-">4200/-</option>
												<option value="4400/-">4400/-</option>
												<option value="4600/-">4600/-</option>
												<option value="4800/-">4800/-</option>
												<option value="5000/-">5000/-</option>
											</select>
											
										</div>
										<input type="time" name="form-from2" class="form-from2"
											id="form-from2"> <input type="time" name="form-to2"
											class="form-to2" id="form-to2">
										<button type="button" id="addbutton2">Add More</button>
									</div>
									<div id="addsch3" class="form-group">
										<div class="form-group">
											<label class="sr-only" for="form-expertise3">Expertise-3</label>
											<select name="formexpertise3" id="form-expertise3"
												class="form-control required" onfocus='this.size=5;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Expertise-3</option>
												<option value="Yoga for health">Yoga for health</option>
												<option value="Weight Loss">Weight Loss</option>
												<option value="Kids Yoga">Kids Yoga</option>
												<option value="Pregnancy Yoga">Pregnancy Yoga</option>
												<option value="Meditation">Meditation</option>
											</select>
											
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-classlevel3">Classlevel-3</label>
											<select name="formclasslevel3" id="form-classlevel3"
												class="form-control required" onfocus='this.size=3;'
												onblur='this.size=1;' onchange='this.size=1; this.blur();'
												required>
												<option value="">Classlevel-3</option>
												<option value="Level 1 - Beginner Class">Level 1 -
													Beginner Class</option>
												<option value="Level 2 - Intermediate Class">Level
													2 - Intermediate Class</option>
												<option value="Level 3 - Advance Class">Level 3 -
													Advance Class</option>
											</select>
											
										</div>
										<div class="form-group">
											<label class="sr-only" for="form-monthly-fees3">Monthly
												Fees3</label> <select name="formmonthlyfees3"
												id="form-monthly-fees3" class="form-control required"
												onfocus='this.size=5;' onblur='this.size=1;'
												onchange='this.size=1; this.blur();' required>
												<option value="">MonthlyFees-3</option>
												<option value="600/-">600/-</option>
												<option value="800/-">800/-</option>
												<option value="1000/-">1000/-</option>
												<option value="1200/-">1200/-</option>
												<option value="1400/-">1400/-</option>
												<option value="1600/-">1600/-</option>

												<option value="1800/-">1800/-</option>
												<option value="2000/-">2000/-</option>
												<option value="2200/-">2200/-</option>
												<option value="2400/-">2400/-</option>
												<option value="2600/-">2600/-</option>

												<option value="2800/-">2800/-</option>
												<option value="3000/-">3000/-</option>
												<option value="3200/-">3200/-</option>
												<option value="3400/-">3400/-</option>
												<option value="3600/-">3600/-</option>

												<option value="3800/-">3800/-</option>
												<option value="4000/-">4000/-</option>
												<option value="4200/-">4200/-</option>
												<option value="4400/-">4400/-</option>
												<option value="4600/-">4600/-</option>
												<option value="4800/-">4800/-</option>
												<option value="5000/-">5000/-</option>
											</select>
											
										</div>
										<input type="time" name="form-from3" class="form-from3"
											id="form-from3"> <input type="time" name="form-to3"
											class="form-to3" id="form-to3">
										     	<button type="button" id="addbutton3">Add More</button> 
										</div>


								</div>   -->
										<!--         <div class="form-group">
			                        	<label class="" for="form-schedule"><strong>Schedule Prefererence</strong></label><br>
			                        	<input type="checkbox" value="9:00 AM to 11:00 AM" id="flexCheckDefaultschms9to11" name="flexCheckDefaultschms9to11" class="form-schedule " >
			                        		<label class="form-check-label" for="flexCheckDefaultschms9to11">
    										Morning Session: 9:00 AM to 11:00 AM
  											</label><br>
  											<input type="checkbox" value="11:00 AM to 1:00 PM" id="flexCheckDefaultschms11to1" name="flexCheckDefaultschms11to1" class="form-schedule " >
			                        		<label class="form-check-label" for="flexCheckDefaultschms11to1">
    										Morning Session: 11:00 AM to 1:00 PM
  											</label><br>
  											<input type="checkbox" value="5:00 PM to 7:00 PM" id="flexCheckDefaultschaf5to7" name="flexCheckDefaultschaf5to7" class="form-schedule " >
			                        		<label class="form-check-label" for="flexCheckDefaultschaf5to7">
    										Evening Session: 5:00 PM to 7:00 PM
  											</label><br>
  											<input type="checkbox" value="7:00 PM to 9:00 PM" id="flexCheckDefaultschev7to9" name="flexCheckDefaultschev7to9" class="form-schedule " >
			                        		<label class="form-check-label" for="flexCheckDefaultschev7to9">    										
			                        		Evening Session: 7:00 PM to 9:00 PM
  											</label><br>
			                        </div>    
			                        <div class="form-group">
			                        	<label class="labelwhite" for="form-classlevel"><strong>Class Level</strong></label><br>
			                        	<input type="checkbox"  value="Beginner Class" id="flexCheckDefaultbegining" name="flexCheckDefaultbegining" class="form-begining roles" >
			                        		<label class="form-check-label labelwhite" for="flexCheckDefaultbegining">
    										Level 1 - Beginner Class
  											</label><br>
  											<input type="checkbox" value="Intermediate Class" id="flexCheckDefaultintermediate" name="flexCheckDefaultintermediate" class="form-intermediate roles" >
			                        		<label class="form-check-label labelwhite" for="flexCheckDefaultintermediate">
    										Level 2 - Intermediate Class
  											</label><br>
  											<input type="checkbox" value="Advance Class" id="flexCheckDefaultadvance" name="flexCheckDefaultadvance" class="form-advance roles" >
			                        		<label class="form-check-label labelwhite" for="flexCheckDefaultadvance">
    										Level 3 - Advance Class
  											</label><br>  										
			                        </div>    -->


										<div class="form-group">
											<label class="sr-only" for="form-aboutself"><strong>About
													Yourself</strong> </label>
											<textarea class="form-control" id="form-aboutself"
												name="formaboutself" placeholder="About Yourself.." required></textarea>

										</div>
										<div class="form-group">
											<label for="form-image"><strong>Profile
													Picture</strong></label> <input type="file" name="formimage"
												class="form-image form-control" id="form-image"
												accept="image/*" onchange="preview_image(event)" required>
											<img id="output_image" />
										</div>
										<div class="form-group">
											<label for="form-certificate"><strong>Upload
													Certificates</strong></label>
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
										<button type="submit" class="btn trainerregisterbutton"
											id="trainerregisterbutton">Register</button>
									</form>
								</div>
								<div id="success"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

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
	<script type="text/javascript">
		$(document).ready(function() {

			$('#form-certificate2').hide();
			$('#form-certificate3').hide();
			$('#addcertificate2').hide();

			$("#addcertificate1").click(function() {
				$('#form-certificate2').show();
				$('#addcertificate2').show();
			});
			$("#addcertificate2").click(function() {
				$('#form-certificate3').show();

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
													formaboutself : {
														required : true,
														minlength : 50
													},
													formimage : {
														required : true,
														extension : "png|jpeg|jpg",
														filesize : 1048576,
													},
													formcertificate1 : {
														required : true
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
													formfrom1 : {
														required : "please enter class start time"
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
													formaboutself : {
														required : "please enter about yourself",
														minlength : "Please enter atleast 50 chars"
													},
													formimage : {
														required : "File must be JPEG or PNG, less than 1MB"
													},
													formcertificate1 : {
														required : "Please Upload your certificate"
													}

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
										|| value == value.match(/^[a-zA-Z]*$/);
							}, "please enter a valid name");
							$.validator.addMethod("onlyNum",
									function(value, element) {
										return this.optional(element)
												|| value == value
														.match(/^[0-9]{10}*$/);
									}, "mobile number must be 10 digits");

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


	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	<!-- Javascript -->
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/retina-1.1.0.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
</body>
</html>
