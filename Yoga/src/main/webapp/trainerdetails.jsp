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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
<!-- jQuery library -->
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<script src="./dist/whoami.js"></script>
<script>
	function init() {
		whoami.detect();
	}
</script>

</head>

<body onload="init()">
	<!-- Nav Bar Start -->
	<div class="navbar navbar-expand-lg bg-dark navbar-dark">
		<div class="container-fluid">
			<span class="logo-text">DEALWITHFITNESS</span>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="fa fa-bars"
					style="color: gray; margin: 5px 0px 5px 5px"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-between"
				id="navbarCollapse">
				<div class="navbar-nav ml-auto">
					<a href="index.jsp" class="nav-item nav-link ">Home</a> <a
						id="trainer-hyperlink-element"
						href="javascript: whoami.redirectIfUserLoggedInOrElse('TrainerProfile', 'Trainer.jsp')"
						class="nav-item nav-link"> Trainer</a> <a href="./logoutservice"
						class="nav-item nav-link" id="user-logout-element"
						style="display: none">Logout</a>
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
					<h2>Trainers Profile</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#book1").hide();
					$("#book2").hide();
					$("#book3").hide();
					var globalarray = [];
					var arrLinks = [];
					arrLinks = JSON.parse(window.localStorage
							.getItem("globalarray"));
					/* console.log(arrLinks); */
					var i = 1;
					console.log("Start");
					console.log(arrLinks[0]);
					let details = JSON.parse(arrLinks[0]);
					console.log(details[0].name);
					$(".tname").html(details[0].name);
					$(".texperience").html(details[0].experience);
					$(".tqualification").html(details[0].qualification);
					$(".texpertise").html(details[0].expertise);
					$(".tmonthlyfees").html(details[0].monthlyfees);
					$(".tschedules").html(details[0].schedule);
					$(".tclasslevel").html(details[0].classlevel);
					$(".texpertise2").html(details[0].expertise2);
					$(".tmonthlyfees2").html(details[0].monthlyfees2);
					$(".tschedules2").html(details[0].schedule2);
					$(".tclasslevel2").html(details[0].classlevel2);
					$(".texpertise3").html(details[0].expertise3);
					$(".tmonthlyfees3").html(details[0].monthlyfees3);
					$(".tschedules3").html(details[0].schedule3);
					$(".tclasslevel3").html(details[0].classlevel3);
					$(".taboutyourself").html(details[0].aboutyourself);
					$(".tcertificate1filename").html(
							details[0].certificate1filename);
					$(".tcertificate2filename").html(
							details[0].certificate2filename);
					$(".tcertificate3filename").html(
							details[0].certificate3filename);

					const image = details[0].base64Image
					if (image) {
						$("#profile-image-element").attr("src",
								"data:image/*;base64," + image);
						setTimeout(() => {
							const width = $("#profile-image-element").width();
							console.log("Image width",width)
							if (width == 0) {
								console.log("Invalid image hence alternative is displayed")
								$("#profile-image-alternative").show();
							}
						}, 100);
					} else {
						console.log("No profile picture");
						$("#profile-image-element").show();
					}

					if (details[0].expertise.length > 5) {
						$("#book1").show();
					}
					if (details[0].expertise2.length > 5) {
						$("#book2").show();
					}
					if (details[0].expertise3.length > 5) {
						$("#book3").show();
					}
					/*    $.each(arrLinks, function(index, value){
					 $(".profile"+i).html(value);
					 console.log(".profile"+index);
					 }); */
				});
	</script>

	<!-- About Start -->
	<div class="container-fluid overcover">
		<div class="container profile-box">
			<div class="cover-image row">
				<!--           <img src="profile/images/bloogs-6.jpg" alt="">  -->
			</div>

			<div class="row">
				<div class="col-lg-8 col-md-7 detail-px no-padding">
					<div class="right">
						<a href="index.jsp"
							class="nav-item nav-link flex flex-valign-center flex-halign-end">
							<i class="fa fa-arrow-circle-left pr-sm" style="font-size: 18px"></i>
							<span style="font-size: 14px">BACK</span>
						</a>
					</div>
					<h3 class="mth3">Profile</h3>
					<div class="fx-ro">
						Name : <b><div class="tname"></div></b>
					</div>
					<div class="fx-ro">
						Experience : <b><div class="texperience"></div></b>
					</div>
					<div class="fx-ro">
						Qualification : <b><div class="tqualification"></div></b>
					</div>
					<div class="fx-ro">
						Expertise : <b><div class="texpertise"></div></b>
					</div>

					<h3>About Trainer</h3>
					<p>
						<b><div class="taboutyourself"></div></b>
					</p>

					<h3 class="mth3">Certificates</h3>

					<ul class="exrts">
						<li><div class="tcertificate1filename"></div></li>
						<li></li>
						<li><div class="tcertificate2filename"></div></li>
						<li></li>
						<li><div class="tcertificate3filename"></div></li>
						<li></li>
					</ul>

				</div>
				<div
					class="col-lg-4 col-md-5 leftgh  flex-column flex-halign-center flex-valign-center">
					<div class="bh-img">
						<img id="profile-image-element" alt="">
						<p id="profile-image-alternative" class="flex flex-halign-center"
							style="display: none">
							<i class="fa fa-user user-container"></i>
						</p>
					</div>
					<div class="name-det">
						<h2>
							<div class="tname"></div>
						</h2>

						<h3>Contact</h3>

						<p>
						<div class="tname"></div>
						<br>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
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
