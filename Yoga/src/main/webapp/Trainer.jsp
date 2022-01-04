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
<link href="css/bootstrap.min.css" rel="stylesheet">
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

<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.validate.js"></script>
<script src="./js/jquery.validate.min.js"></script>

<script src="./js/bootstrap.bundle.min.js" ></script>
	<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.8.0/dist/alpine.min.js"></script>
	
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
<script src="js/TrainerLoginReg.js"></script>
<script src="./dist/trainee-journey.js"></script>

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
.photo-trigger-button {
	opacity: 0;
	position: absolute;
	left: -100px;
}

.photo-trigger-button-label {
	position: absolute;
	top: 50%;
	left: 1rem;
	transform: translateY(-50%);
}
</style>
</head>

<body onload="journey.trainerinit()">
	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>

	<!-- Nav Bar End -->


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
										<div class="form-top-left">

										<h3>Forgot Password</h3>

									</div>
											<label class="sr-only" for="form-forgotusername">User
												Name</label> <input type="email" name="formforgotusername"
												placeholder="User Name..."
												class="form-forgotusername form-control"
												id="formforgotusername" required>
										</div>
										<div class="form-group">
											 <div class="progress forgot-progressbar">
    											<div class="progress-bar  progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
    											Sending</div>
  											</div>
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
										action="" method="post"
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
											<span style="font-size: 14px">Choose any Expertise to
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
													<option value="Dance">Dance</option>
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

<!-- 										<div class="form-group"> -->
<!-- 										<strong>Profile Picture</strong> -->
<!-- 							<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style=""> -->
<!-- 								<input name="formimage" id="formimage" type="file"  -->
<!-- 									class="form-control border-0 photo-trigger-button" -->
<!-- 									accept=".jpg, .png, .jpeg, .gif, .tif, .tiff" onchange="preview_image(event)"> -->
<!-- 								<label id="formimage-lbl" for="formimage" -->
<!-- 									class="font-weight-light text-muted photo-trigger-button-label">Choose -->
<!-- 									file</label> -->
<!-- 								<div class="input-group-append"> -->
<!-- 									<label for="formimage" -->
<!-- 										class="btn btn-light m-0 rounded-pill px-4"> -->
<!-- 										<i class="fas fa-image fa-lg mr-2 text-muted"></i> -->
<!-- 										<small class="text-uppercase font-weight-bold text-muted">Browse</small> -->
<!-- 									</label> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<img id="output_image" /> -->
<!-- 										</div>										 -->
																				
<!-- 										<div class="form-group"> -->
<!-- 											<strong>Upload Certificates</strong> -->
<!-- 											<div class="row"> -->
<!-- 												<div class="col-9"> -->
<!-- 								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style=""> -->
<!-- 								<input name="formcertificate1" id="formcertificate1" type="file"  -->
<!-- 									class="form-control border-0 photo-trigger-button"> -->
<!-- 								<label id="formcertificate1-lbl" for="formcertificate1" -->
<!-- 									class="font-weight-light text-muted photo-trigger-button-label">Choose -->
<!-- 									file</label> -->
<!-- 								<div class="input-group-append"> -->
<!-- 									<label for="formcertificate1" -->
<!-- 										class="btn btn-light m-0 rounded-pill px-4"> -->
<!-- 										<i class="fas fa-image fa-lg mr-2 text-muted"></i> -->
<!-- 										<small class="text-uppercase font-weight-bold text-muted">Browse</small> -->
<!-- 									</label> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 												</div> -->
<!-- 												<div class="col-3"> -->
<!-- 													<button type="button" id="addcertificate1" class="unstyled-button"  style="background-color:grey;color:white;width:40px; -->
<!-- 														height:40px;border-radius: 50%;"><i class="fa fa-plus" aria-hidden="true"></i></button>												 -->
														
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row form-certificate2-field"> -->
<!-- 												<div class="col-9"> -->
<!-- 								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style=""> -->
<!-- 								<input name="form-certificate2" id="form-certificate2" type="file"  -->
<!-- 									class="form-control border-0 photo-trigger-button"> -->
<!-- 								<label id="form-certificate2-lbl" for="form-certificate2" -->
<!-- 									class="font-weight-light text-muted photo-trigger-button-label">Choose -->
<!-- 									file</label> -->
<!-- 								<div class="input-group-append"> -->
<!-- 									<label for="form-certificate2" -->
<!-- 										class="btn btn-light m-0 rounded-pill px-4"> -->
<!-- 										<i class="fas fa-image fa-lg mr-2 text-muted"></i> -->
<!-- 										<small class="text-uppercase font-weight-bold text-muted">Browse</small> -->
<!-- 									</label> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 												</div> -->
<!-- 												<div class="col-3"> -->
<!-- 													<button type="button" id="addcertificate2" class="unstyled-button" style="background-color:Grey;color:white;width:40px; -->
<!-- 														height:40px;border-radius: 50%;"><i class="fa fa-plus" aria-hidden="true"></i></button> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<div class="row form-certificate3-field"> -->
<!-- 												<div class="col-9"> -->
<!-- 														<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style=""> -->
<!-- 								<input name="form-certificate3" id="form-certificate3" type="file"  -->
<!-- 									class="form-control border-0 photo-trigger-button"> -->
<!-- 								<label id="form-certificate3-lbl" for="form-certificate3" -->
<!-- 									class="font-weight-light text-muted photo-trigger-button-label">Choose -->
<!-- 									file</label> -->
<!-- 								<div class="input-group-append"> -->
<!-- 									<label for="form-certificate3" -->
<!-- 										class="btn btn-light m-0 rounded-pill px-4"> -->
<!-- 										<i class="fas fa-image fa-lg mr-2 text-muted"></i> -->
<!-- 										<small class="text-uppercase font-weight-bold text-muted">Browse</small> -->
<!-- 									</label> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div>										 -->
										<button type="submit"
											class="btn trainerregisterbutton btn-primary"
											id="trainerregisterbutton"  >
											<i class="fas fa-sign-in-alt ml-1"></i> &nbsp Register
										</button>
									</form>
								</div>
								<div id="regerror"></div>
								
								<h3 class="error-txt">
								<% if(request.getAttribute("success") != null){ %>
								<%= request.getAttribute("success") %>
								<%} %>
								</h3>
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
								information that supports you with the yoga practices learned

								from us, any upcoming events in Yoga and special offers €”if

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
			$('.form-certificate2-field').hide();
			$('.form-certificate3-field').hide();
			$('#addcertificate2').hide();

			$(".forgotpasswordshow").click(function() {
				$('.forgotusername').toggle();
				$('.forgotbutton').toggle();
			});

			$("#addcertificate1").click(function() {
				$('.form-certificate2-field').toggle();
				$('#addcertificate2').toggle();
			});
			$("#addcertificate2").click(function() {
				$('.form-certificate3-field').toggle();
			});

		});
	</script>
	<!-- REGISTER PAGE END -->




	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top"> <i class="fa fa-chevron-up"></i>
	</a>


</body>
</html>
