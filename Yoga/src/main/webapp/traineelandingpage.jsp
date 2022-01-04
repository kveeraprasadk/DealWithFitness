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
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script src="./dist/external/moment.min.js"></script>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.validate.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.validate.min.js"></script>

<script src="./js/popper.min.js"></script>
<script src="./js/platform.js" async defer></script>

<meta name="google-signin-client_id" content="GOOGLEID">
<!-- Add Google ID -->
<!-- JavaScript Libraries -->
<!-- 	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script src="./js/bootstrap.bundle.min.js" ></script>
	
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="lib/isotope/isotope.pkgd.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

<link href="css/trainee.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/icons.css">

<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/traineee-bookings.js"></script>

<style type="text/css">
label {
	color: #FF0000 !important;
}
.card-deck {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
    margin-right: 250px;
    margin-left: 250px;
}
.card-deck .card {    
    border-radius: 15px;
}
@media screen and (min-width: 200px) and (max-width: 970px) {

.card-deck {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
    margin-right: 10px;
    margin-left: 10px;
    flex-direction: row;
}
.card-deck .card {   
    margin: 5px;
    border-radius: 15px;
    padding: 0.3px;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 0.5rem;
}

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
<script id="booking-fragment" type="plain/html"
	targetId="trainee-booking-container">
<div class="trainee-bookings-fragment wow fadeInUp" data-wow-delay="0.0s">
	<table> 
		<tbody>
			<tr>
				<td class="pr" align="left">Trainer Name</td>
				<td class="pl">{name}</td>
			</tr>
			<tr>
				<td class="pr" align="left">Trainer Email</td>
				<td class="pl">{email}</td>

			</tr>
			<tr>
				<td class="pr" align="left">Title</td>
				<td class="pl" style="color: #42be03"><b>{title}</b></td>
			</tr>
			<tr>
				<td class="pr" align="left">Location</td>
				<td class="pl" style="color:blue">
					<div class="flex flex-valign-center">
						<span class='calendar-font-icon ic-location-b pr' style='font-size: 16px;color: #0622ea'></span>
						<a href="{location}" style="color:blue !important; word-break: break-all">{location}</a>
					</div>
				</td>
			</tr>
			<tr>
				<td align="left" class="pr">Class Level</td>
				<td class="pl">{classLevel}</td>
			</tr>
			<tr align="left">
				<td align="left" class="pr">Fee</td>
				<td class="pl" style="color: black"><i class="fa fa-inr pr-sm" style="color: gray"> </i>{fee}</td>
			</tr>
			<tr>
				<td align="left" class="pr">Trainer Preference</td>
				<td class="pl">{trainerPreference}</td>
			</tr>
			<tr>
				<td align="left" class="pr">Expertise</td>
				<td class="pl">{expertise}</td>
			</tr>
			<tr>
				<td align="left" class="pr">Demo Class</td>
				<td class="pl">{demoPresent}</td>
			</tr>
			<tr>
				<td align="left" class="pr">Schedule</td>
				<td class="pl" style="color:blue;">
					<div class="flex flex-valign-center">
						<i class="fa fa-clock pr" style="color:gray"></i>
						<span style="word-break: break-all">{schedule}</span>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="pt flex flex-halign-end">
		<button class="btn btn-danger" seriesId="{id}" title="{title}" onclick="trainee.deleteScheduleEvent(event)">
			Cancel Training
		</button>
	</div>
</div>
</script>
</head>

<body onload="trainee.init()">
	<!-- These are trainer detail tmplates used by trainer.js to render the trainer related details -->
	<%
	int i = 0;
	%>
	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<!-- Nav Bar End -->
	<%@include file="./html/dialogs.html"%>
	<!-- Hero Start -->
	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainee's Zone</h2>
				</div>
				<div class="col-12">
					<div class="card-deck">
					<div class="card ">
						<div class="card-body text-center">
							<p class="card-text">
								<a href="traineelandingpage.jsp">
								<i class="fa fa-clock pr" style="font-size: 23px"></i>My Trainings</a>
							</p>
						</div>
					</div>
					<div class="card ">
						<div class="card-body text-center">
							<p class="card-text">
								<a href="./TraineeProfile">
								<i class="fa fa-file pr" style="font-size: 23px"></i>My Profile</a>
							</p>

						</div>
					</div>					
					</div> 
				</div>
			</div>
		</div>
	</div>
	<div class="class">
		<div class="container">
			<div class="flex-column" id="trainee-my-bookings">
				<div class="flex-column">
					<h3>My Trainings</h3>
					<span>You signed up for <b><span
							id="trainee-course-count"></span></b> training's
					</span>
				</div>
				<div class="hide mt pt pb " id="no-trainings-message">
					<h4 style="color: red">No Training's you signed up for!</h4>
					<a href="index.jsp" class="btn btn-info">Book Your Online
								Fitness Classes</a>
				</div>
				<div id="trainee-booking-container" class="flex flex-wrap mt pt pb">

				</div>
			</div>
			<div id="trainee-my-profile" class="hide">
				<h3>My Details</h3>
			</div>
		</div>
	</div>

	<!-- Hero End -->
	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	
</body>
</html>
