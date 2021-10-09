<%@page import="main.common.AppUtils"%>
<%@page import="main.common.AppConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script src="./dist/external/moment.min.js"></script>
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
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<meta name="google-signin-client_id" content="GOOGLEID">
<!-- Add Google ID -->

<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/traineee-bookings.js"></script>

<style type="text/css">
label {
	color: #FF0000 !important;
}

@media ( max-width : 575.98px) {
	input[type=email], input[type=password] {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.top-bar .top-bar-right {
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
}
</style>
</head>

<body onload="trainee.init()">
	<!-- These are trainer detail tmplates used by trainer.js to render the trainer related details -->
	<%
	int i = 0;
	%>
	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand">DEALWITHFITNESS <span></span></a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav ml-auto">
					<a href="index.jsp" class="nav-item nav-link active">Home</a> <a
						href="About.jsp" class="nav-item nav-link">About</a> <a
						href="Trainer.jsp" class="nav-item nav-link">Trainer</a> <a
						href="./logoutservice" class="nav-item nav-link"
						id="user-logout-element" style="display: none">Logout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Nav Bar End -->
	<%@include file="./html/dialogs.html"%>
	<%@include file="./html/trainee-login-dialog.html"%>
	<%@include file="./html/register-trainee-dialog.html"%>
	<!-- Hero Start -->
	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainee's Profile</h2>
				</div>
				<div class="col-12">
					<a href="javascript: switchView('calendar')">My Bookings </a> <a
						href="">My Profile</a>
				</div>
			</div>
		</div>
	</div>

	<div id="trainee-booking-container" class="flex flex-wrap"></div>
	<!-- Hero End -->

	<!-- Footer Start -->
	<div class="footer wow fadeIn" data-wow-delay="0.3s">
		<div class="container-fluid">
			<div class="container">
				<div class="footer-info">
					<a class="footer-logo">DealWithFitness<span></span></a>
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
</body>
</html>
