<%@page import="main.common.AppUtils"%>
<%@page import="main.common.AppConstants"%>
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

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
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
<link rel="stylesheet" type="text/css" href="./css/common.css">

<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/home-trainers.js"></script>
<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
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
<link rel="icon" href="img/yoga-icon1.jpg">

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

<body onload="trainers.init()">
	<!-- These are trainer detail tmplates used by trainer.js to render the trainer related details -->
	<%
	int i = 0;
	%>
	<script type="text/html" id="Trainer-details-template"
		targetId="trainers-list-container">
	    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
		    <div class="class-wrap">
		        <div class="class-text flex-column flex-valign-center trainer-schedules">
			        <div class="class-teacher">
						<span class="far fa-check-circle flex flex-valign-center {attendeeSubscribedClass} trainee-selected" style="margin-left:10px"></span>
		            	<span class="flex-grow trainer-name">{name}</span>
						<span class="attendee-count-parent {zeroAttendeesClass} flex" title="Total {attendeeCount} Attendees">
							<span class="fas fa-users" style="font-size:24px;">
								<span class="attendee-count">{attendeeCount}</span>
							</span>
						</span>
						<button class="btn profiledata home-trainer-list-a fas fa-external-link-alt" value="{email}"
								style="border-radius: 50%; background: #cce0fc;" title="View Trainer Profile">
						</button>
		        	</div>
					<div style=" width:100%;" class="flex-column flex-valign-center flex-grow trainer-details-card-inner-container {demoClass}">
						<div class="flex-column flex-valign-center flex-grow">
							<h4>{expertise}</h4>
							<span class="pb" style="color: green">{title}</span>
			            	<span class="flex flex-valign-center pb"><span class="mr">Level:</span> <h2 style="margin: 0px" class="ml">{classLevel}</h2></span>
			            	<div class="class-meta flex" style="color: #050df6; align-items: flex-start">
								<span class="pl" style="text-align:center">
									<i class="far fa-clock pr-sm" style="font-size: 18px;color:gray"></i>
									{schedule}
								</span>
			            	</div>
			             	<div class="class-meta pt pb">
			               		<Strong>Fee per Month : <span class="pr-sm">&#x20B9;</span>{fee}</Strong>
			            	</div>
		            	</div>
			             <div class="class-meta">
							<button class="btn btn-primary bookbutton" trainerId="{email}" seriesId="{id}" 
								data-toggle="modal" title="{title}" attendee="{attendeeClass}" 
								onclick="trainers.bookScheduleEvent(event)">
								Book
							</button>
			            </div>
					</div>
		        </div>
		    </div>
		</div>
	</script>
	<!--If trainer is not providing any trainings then this template will be rendered -->
	<script type="text/html" id="Trainer-details-template-empty"
		targetId="trainers-list-container">
	    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
		    <div class="class-wrap class-text flex-column">
	            <div class="class-teacher">
		            <span class="flex-grow trainer-name">{name}</span>
					<a style="height: 32px;width: 32px" title="View Trainer Profile">
						<button class="btn profiledata home-trainer-list-a fas fa-external-link-alt" value="{email}" style="font-size:18px">
						</button>
					</a>
	        	</div>
		    	<div class="flex-column flex-valign-center trainer-details-card-inner-container flex-grow">
					<h4>{expertise}</h4>
					<span style="color:red; padding: 10px" class="flex flex-valign-center">
						<span class="fa fa-info-circle pr-sm" style="font-size:20px"></span>Trainings are not scheduled yet.
					</span>
		        </div>
		    </div>
		</div>
	</script>
	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<!-- Nav Bar End -->
	<%@include file="./html/dialogs.html"%>
	<%@include file="./html/trainee-login-dialog.html"%>
	<%@include file="./html/register-trainee-dialog.html"%>
	<!-- Hero Start -->
	<div class="hero" style="background-color: #dae2e642">
		<center></center>
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-sm-12 col-md-12 col-lg-6">
					<div class="hero-text">
						<h1>Book Your Online Fitness Classes Now</h1>
						<span>How much importance you give to yourself. Invest in
							self.</span>
						<span style="font-size: 14px; color: #1000ff">Don't wish
							for it, work for it.</span>
					</div>
					<div class="pl pt">
						<button class="btn btn-primary bookbutton mr hide"
							id="existing-trinee-signin"
							onclick="trainers.showLoginDialogEvent()">Sign In</button>
						<button class="btn btn-success bookbutton hide"
							onclick="trainers.showRegisterDialogEvent()"
							id="new-trainee-ac-create">New Trainee Account</button>
						<button class="btn btn-primary bookbutton hide"
							onclick="trainers.showMyBookingsEvent()" id="trainee-ac-bookings">My
							Trainings</button>
					</div>
				</div>
				<div class="col-md-6 d-md-block">
					<div class="hero-image">
						<img src="img/hero.png" alt="Hero Image">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="class">
		<div class="container">
			<div class="section-header text-center" style="max-width: none">
				<h3
					style="color: #03287a; font-size: 18px; letter-spacing: 1px; text-transform: uppercase;">Find
					Your Fitness Guru</h3>
				<div
					class="flex flex-wrap flex-valign-center flex-halign-center pb filter-container">
					<div class="flex-column mt mr ml  flex-grow">
						<span style="font-size: 14px; text-align: left" class="pb-sm">Expertise
							of your choice</span>
						<select name="form-expertise" id="form-expertise"
							class="form-control required flex-grow"
							onchange='trainers.filterTrainers(event)' style="width: auto">
							<option value="all">All Expertise</option>
							<optgroup label="Yoga">
								<option value="Yoga for health">Yoga for health</option>
								<option value="Weight Loss">Weight Loss</option>
								<option value="Kids Yoga">Kids Yoga</option>
								<option value="Pregnancy Yoga">Pregnancy Yoga</option>
								<option value="Meditation">Meditation</option>
							</optgroup>
							<optgroup label="Dance">
								<option value="Dance">Dance</option>
								<option value="Zumba">Zumba</option>
							</optgroup>
							<option value="Weight / Body weight Workout">Weight /
								Body weight Workout</option>
							<option value="Nutrition">Nutrition</option>
						</select>
					</div>
					<div class="flex-column mt mr ml  flex-grow">
						<span style="font-size: 14px; text-align: left" class="pb-sm">Your
							preferred timings</span>
						<select name="form-sort" id="form-filter-misc"
							class="form-control required flex-grow"
							onchange='trainers.filterByMisc(event)' " style="width: auto">
							<option value="all">All Timings</option>
							<option value="04:00:00 11:59">Morning 04:00 AM to 11:59
								AM</option>
							<option value="12:00:00 16:59">Afternoon 12:00 PM to
								04:59 PM</option>
							<option value="17:00:00 23:59">Evening 05:00 PM to 11:59
								PM</option>
							<option value="00:00:00 03:59">Night 12:00 AM to 03:59
								AM</option>
						</select>
					</div>
					<div class="flex-column mt mr ml flex-grow">
						<span style="font-size: 14px; text-align: left" class="pb-sm">Sort
							by</span>
						<select name="form-sort" id="form-sortby"
							onchange='trainers.sortTrainersList(event)'
							class="form-control required flex-grow" style="width: auto">
							<option value="asc">Fee Lowest to Highest</option>
							<option value="desc" selected>Fee Highest to Lowest</option>
						</select>
					</div>
					<div class="hero-btn"></div>
				</div>
				<div id="trainers-list-container" class="flex flex-wrap"></div>
			</div>
		</div>
		<!-- Hero End -->
	</div>
	<!-- Service Start -->
	<div class="service" style="background: white">
		<div class="container">
			<div class="section-header text-center wow zoomIn"
				data-wow-delay="0.1s">
				<p>What we do</p>
				<h2>Yoga For Health</h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.0s">
					<div class="service-item">
						<div class="service-icon">
							<i class="flaticon-workout"></i>
						</div>
						<h3>Heal emotions</h3>
						<p>Practicing yoga can help the body more flexible and avoid
							further injuries or fracture in the bone. So, this exercise will
							help to optimize the muscle capability and help to avoid muscle
							pain too. Yoga could help reduce many types of chronic pain.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
					<div class="service-item active">
						<div class="service-icon">
							<i class="flaticon-workout-1"></i>
						</div>
						<h3>Body Refreshes</h3>
						<p>Yoga will help to get a better body balance. Mostly we are
							having difficulties with the balance due to any lack in the back
							brain. So, it can stimulate a good body balancing system and
							avoid frequent sickness or nausea.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
					<div class="service-item">
						<div class="service-icon">
							<i class="flaticon-workout-2"></i>
						</div>
						<h3>Mind & Serenity</h3>
						<p>Yoga can help us to feel relax. So, this activity can help
							to manage a better mind and thinking. Yoga is one of the best
							solutions for stress relief. Yoga could be a useful adjunct
							therapy to help reduce migraine(headache) frequency.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
					<div class="service-item">
						<div class="service-icon">
							<i class="flaticon-workout-3"></i>
						</div>
						<h3>Enjoy Your life</h3>
						<p>Yoga could improve quality of life and may be used as an
							adjunct therapy for some conditions. Yoga helps for inner peace,
							improves immunity and increase energy.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.8s">
					<div class="service-item">
						<div class="service-icon">
							<i class="flaticon-workout-4"></i>
						</div>
						<h3>Body & Spirituality</h3>
						<p>Yoga improves the body coordination. It is good to let we
							perform various coordination between our body parts. It can
							optimize the coordination between mind and body reflects.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="1s">
					<div class="service-item">
						<div class="service-icon">
							<i class="flaticon-yoga-pose"></i>
						</div>
						<h3>Body & Mind</h3>
						<p>
							Practicing Yoga helps develop the body and mind, yet is not a
							substitute for medicine. It is essential to learn and practice
							yoga under the supervision of a trained Yoga teacher.
							<!--  Yoga may help enhance sleep quality because of its effects on melatonin and its impact on several common contributors to sleep problems. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->

	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top">
		<i class="fa fa-chevron-up"></i>
	</a>

	
</body>
</html>
