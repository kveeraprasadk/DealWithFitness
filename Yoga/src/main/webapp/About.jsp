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
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="./dist/whoami.js"></script>

<!-- JavaScript Libraries -->
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
<script>
	function init() {
		whoami.detect();
	}
</script>
</head>

<body onload="init()">
	<!-- Top Bar Start -->
	<!-- Top Bar End -->

	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<!-- Nav Bar End -->


	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>About Us</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->


	<!-- About Start -->
	<div class="about wow fadeInUp" data-wow-delay="0.1s"
		style="background: white">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-5 col-md-6">
					<div class="about-img">
						<img src="img/about.png" alt="Image">
					</div>
				</div>
				<div class="col-lg-7 col-md-6">
					<div class="section-header text-left">
						<p>Learn About Us</p>
						<h2>Welcome to Deal With Fitness</h2>
					</div>
					<div class="about-text">
						<p>Health is supposed to be the only companion staying with
							you till you die. Staying fit keeps you really alive while you
							are alive.</p>
						<p>Yoga is an ancient practice focusing on breathing,
							flexibility and strength to boost mental and wellbeing.</p>
						<a class="btn" href="">Learn More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->


	<!-- Contact Start -->
	<div class="contact">
		<div class="container">
			<div class="section-header text-center wow zoomIn"
				data-wow-delay="0.1s">
				<p>Get In Touch</p>
				<h2>For Any Query</h2>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="col-md-4 contact-item wow zoomIn"
							data-wow-delay="0.2s"></div>
						<div class="col-md-4 contact-item wow zoomIn"
							data-wow-delay="0.4s">
							<i class="far fa-envelope"></i>
							<div class="contact-text">
								<h2>Email</h2>
								<p>dealwithfitness64@gmail.com</p>
							</div>
						</div>
						<div class="col-md-4 contact-item wow zoomIn"
							data-wow-delay="0.6s"></div>
					</div>
				</div>
				<div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
					<div class="contact-form">
						<div id="success"></div>
						<form name="sentMessage" id="contactForm" novalidate="novalidate">
							<div class="control-group">
								<input type="text" class="form-control" id="name"
									placeholder="Your Name" required="required"
									data-validation-required-message="Please enter your name" />
								<p class="help-block text-danger"></p>
							</div>
							<div class="control-group">
								<input type="email" class="form-control" id="email"
									placeholder="Your Email" required="required"
									data-validation-required-message="Please enter your email" />
								<p class="help-block text-danger"></p>
							</div>
							<div class="control-group">
								<input type="text" class="form-control" id="subject"
									placeholder="Subject" required="required"
									data-validation-required-message="Please enter a subject" />
								<p class="help-block text-danger"></p>
							</div>
							<div class="control-group">
								<textarea class="form-control" id="message"
									placeholder="Message" required="required"
									data-validation-required-message="Please enter your message"></textarea>
								<p class="help-block text-danger"></p>
							</div>
							<div>
								<button class="btn" type="submit" id="sendMessage">Send
									Message</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact End -->


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

</body>
</html>
