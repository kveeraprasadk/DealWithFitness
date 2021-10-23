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
<link rel="icon" href="img/yoga-icon1.jpg">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>

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



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>=
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
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
	<!-- Javascript -->
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/retina-1.1.0.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
<style type="text/css">
ol.tips {
  list-style-type: lower-alpha;  
  margin-left: -20px;
}
label {
	color: #FF0000 !important;
}
</style>
</head>

<body>
	

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
					
					<a href="Trainer.jsp" class="nav-item nav-link">Trainer</a> 
				</div>
			</div>
		</div>
	</div>
	<!-- Nav Bar End -->


<script type="text/javascript">
$(document).ready(function(){
$("#changepasswordform").validate({
 rules: {
      
		username:{
			required: true,
			email: true
		},
      newpassword: {
        required: true, 
        minlength: 6
      },
	  cpassword:{
	  required: true,
	  equalTo:"#newpassword"
	  }
    },
    messages : {
    	
    username:{
    	required: "please enter username",
    	email : "Please Enter Valid email"
    },
      newpassword: {
        required: "please enter password",
        minlength: "Password should be at least 6 characters"
      },
	  conformpassword: {
		required: "please enter confirm password",
		equalTo: "password doesn match"
	  }
    }
  });
 
  
});
</script>  
	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainer Change Password</h2>
				</div>
				
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- LOGIN PAGE START -->
	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-7 text">
						
						<div class="description">
						<h4 style="text-align: left" >Secure password tips:	</h4>
							<ul style="color: red">
								<li style="text-align: left">Use at least 6 characters, a combination of numbers and letters is best.</li>
								<li style="text-align: left">Do not use the same password you have used with us previously.</li>
								<li style="text-align: left">Do not use dictionary words, your name, e-mail address, mobile phone number or other personal information that can be easily obtained.</li>
								<li style="text-align: left">Do not use the same password for multiple online accounts.</li>
							</ul>

						</div>
						<!--       <div class="top-big-link">
                            	<a class="btn btn-link-1" href="#">Button 1</a>
                            	<a class="btn btn-link-2" href="#">Button 2</a>
                            </div>       -->
					</div>
					<div class="col-sm-5 form-box ">

						<div class="form-top">
							<div class="form-top-left">
								<h3>Change Password </h3>

							</div>

							<div class="form-top-divider"></div>
						</div>
						<div class="form-bottom">
							<form role="form" id="changepasswordform" name="changepasswordform"
								class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">User Name</label> <input
										type="email" name="form-username" placeholder="User Name..."
										class="form-username form-control" id="form-username" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-newpassword">Password</label> <input
										type="password" name="form-newpassword" placeholder="New Password..."
										class="form-newpassword form-control" id="form-newpassword" required>
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-cpassword">Password</label> <input
										type="password" name="form-cpassword" placeholder="Confirm Password..."
										class="form-cpassword form-control" id="form-cpassword" required>
								</div>
								<button type="submit" class="btn-primary changepasswordbutton"
									id="changepasswordbutton">Change</button>
							</form>
						</div>


						<div id="success"></div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#changepasswordbutton")
									.click(
											function() {

												event.preventDefault();
												var username = $(
														'#form-username').val();
												var password = $(
														'#form-newpassword').val();

												$
														.ajax({
															url : "AdminLoginServlet",
															type : "GET",
															data : {
																username : username,
																password : password
															},
															cache : false,
															success : function(
																	data) {
																if (data == "Login Success") {
																	document.location.href = './AdminPageView';
																} else {
																	$(
																			'#success')
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
																									data));
																	$(
																			'#success > .alert-danger')
																			.append(
																					'</div>');
																}
															},
															error : function(
																	data) {
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
																								data));
																$(
																		'#success > .alert-danger')
																		.append(
																				'</div>');

															}

														});

											});
						});
	</script>
<!-- LOGIN PAGE END -->




	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	
</body>
</html>
