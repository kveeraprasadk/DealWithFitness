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
<link rel="stylesheet" type="text/css" href="./css/NewStyle.css">

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
	<script src="https://tympanus.net/Tutorials/ShapeHoverEffectSVG/js/snap.svg-min.js"></script>
	<!-- Template Javascript -->
	<script src="js/main.js"></script>
	<script src="js/NewStyle.js"></script>
<link rel="icon" href="img/yoga-icon1.jpg">

<style type="text/css">
label {
	color: #FF0000 !important;
}
.classbg{
background-color: #ffc107a3 !important;
}
.btn-primary {
    color: #fff;
    background-color: #0495c9;
    border-color: #357ebd; /*set the color you want here*/
}
.powerhover:hover, .powerhover:focus, .powerhover:active, .powerhover.active, .open>.dropdown-toggle.btn-primary {
    color: #fff;
    background-color: #00002e;
    border-color: #285e8e; /*set the color you want here*/
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
<style>
/* expertise(style-1) */
  
  .purchase {
    border-top:11px solid #E85700;
    text-align:center;
  }

  .purchase-trigger {
    border:1px solid #E85700;
    border-radius:50px;
    font-size:26px;
    display:inline-block;
    cursor:pointer;
    position:relative;
  }
  
  .purchase-trigger * {
    -webkit-transition: 0.3s cubic-bezier(0.540, 1.410, 0.540, 0.870);
    -moz-transition: 0.3s cubic-bezier(0.540, 1.410, 0.540, 0.870);
    -o-transition: 0.3s cubic-bezier(0.540, 1.410, 0.540, 0.870);
    transition: 0.3s cubic-bezier(0.540, 1.410, 0.540, 0.870);
    
    -webkit-transition: 0.4s cubic-bezier(0.165, 0.925, 0.510, 1.005);
    -moz-transition: 0.4s cubic-bezier(0.165, 0.925, 0.510, 1.005);
    -o-transition: 0.4s cubic-bezier(0.165, 0.925, 0.510, 1.005);
    transition: 0.4s cubic-bezier(0.165, 0.925, 0.510, 1.005);
    
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  .purchase-trigger span {
    padding:17px 80px;  
    color:#E85700;
    width:246px;
    display: inline-block;
  }
  .purchase-trigger .bubble {
    position:absolute;
    background:#E85700;
    top:0;
    border-radius:50px;
    left:0;
    height:74px;
    width: 246px;
    z-index:-1;
  }
  .purchase-trigger.right .bubble {
    margin-left:246px;  
  }
  
  .purchase-trigger:not(.right) .annual {
    color:#fff;
  }
  .purchase-trigger.right .monthly {
    color:#fff;
  }
  
  .purchase ul {
    display:table;
    margin:70px auto 0;
    width:100%;
    max-width:1100px;
  }
  .purchase li {
    display:table-cell;
    width:33.333%;
    padding:43px 0 0;
    -webkit-transition: 0;
    -webkit-transition: all 0.25s, color 0s !important;
    -moz-transition: all 0.25s, color 0s !important;
    -o-transition: all 0.25s, color 0s !important;
    transition: all 0.25s, color 0s !important;
    position:relative;
    z-index:0;
    border:1px solid #BBB;
  }
  
  .purchase li:first-child {
    position:relative;
    right:-1px; 
  }
  .purchase li:last-child {
    position:relative;
    left:-1px;  
  }  
  .purchase li:hover {
    box-shadow: 0 13px 48px rgba(0, 0, 0, 0.2);
    z-index:1;
    color:#fff;
    background:#E85700;
    border-color:#E85700;
    -webkit-transform:scale(1.05);
  }
  
  .purchase li * {
    -webkit-transition: 0 !important;
    -moz-transition: 0 !important;
    -o-transition: 0 !important;
    transition: 0 !important;
  }
  
  .purchase li:hover * {
    color:#fff !important;
    border-color:rgba(255, 255, 255, 0.27) !important;
  }
  
  .purchase li strong {
    font-size:19px;
    text-transform:uppercase;
    font-family: AvenirLTStd-Heavy;
    color:#2F3740;
    letter-spacing:2.4px;
    line-height:45px;
    font-weight:400;
    margin-bottom: 25px;
    display: inline-block;
  }
  
  .purchase ul .purchase-description {
    display:block;
    font-size:19px;
    line-height:30px;
  }
  
  .purchase .purchase-price {
    font-size:84px;
    letter-spacing:2px;
    padding-top:20px;
    display:block;
    font-weight:400;
    padding-bottom:12px;
  }
  .purchase .purchase-button {
    text-transform:uppercase;
    font-size:19px;
    text-transform:uppercase;
    font-family: AvenirLTStd-Heavy;
    color:#2F3740;
    text-decoration:none;
    line-height:1;
    padding:28px 0 24px;
    border-top:1px solid #bbb;
    width:100%;
    display:inline-block;
    margin-top:6px;
    display:block;
  }
  .purchase li:hover .purchase-button {
    
    -webkit-transition: 0;
    -moz-transition: 0;
    -o-transition: 0;
    transition: 0;
  }  
  
  .purchase ul a:hover {
    color:#E85700;
  }

.purchase ul a, .purchase ul a:hover .purchase-price, .purchase ul a:hover .purchase-description {
color: #6C6C6C;
  text-decoration:none;
}
designmodo.com/media="all"
.purchase li * {
-webkit-transition: 0 !important;
-moz-transition: 0 !important;
-o-transition: 0 !important;
transition: 0 !important;
}
</style>
<style type="text/css">
<!--Comments css -->
.commentbody {
  font-family: 'Poppins', sans-serif;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.quotes {
  width: 80vw;
  min-height: 400px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  z-index: 2;
}

.quotes .box {
  position: relative;
  width: 25vw;
  height: 50vh;
  min-height: 320px;
  background: #f2f2f2;
  overflow: hidden;
  transition: all 0.5s ease-in;
  z-index: 2;
  box-sizing: border-box;
  padding: 30px;
  box-shadow: -10px 25px 50px rgba(0, 0, 0, 0.3);
}

.quotes .box::before {
  content: '\201C';
  position: absolute;
  top: -20px;
  left: 5px;
  width: 100%;
  height: 100%;
  font-size: 120px;
  opacity: 0.2;
  background: transparent;
  pointer-events: none;
}

.quotes .box::after {
  content: '\201D';
  position: absolute;
  bottom: -10%;
  right: 5%;
  font-size: 120px;
  opacity: 0.2;
  background: transparent;
  filter: invert(1);
  pointer-events: none;
}

.quotes .box p {
  margin: 0;
  padding: 10px;
  font-size: 1.2rem;
}

.quotes .box h2 {
  position: absolute;
  margin: 0;
  padding: 0;
  bottom: 10%;
  right: 10%;
  font-size: 1.5rem;
}

.quotes .box:hover {
  color: #f2f2f2;
  box-shadow: 20px 50px 100px rgba(0, 0, 0, 0.5);
}

.quotes .bg {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  opacity: 0;
  transition: all 0.5s ease-in;
  pointer-events: none;
  width: 100%;
  height: 200%;
  overflow: hidden;
}

.quotes .box.box1:hover,
.quotes .box.box1:hover~.bg {
  opacity: 1;
  background: #e2a9e5;
background: -moz-linear-gradient(-45deg, #e2a9e5 15%, #2b94e5 100%);
background: -webkit-linear-gradient(-45deg, #e2a9e5 15%,#2b94e5 100%);
background: linear-gradient(135deg, #e2a9e5 15%,#2b94e5 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e2a9e5', endColorstr='#2b94e5',GradientType=1 );
}

.quotes .box.box2:hover,
.quotes .box.box2:hover~.bg {
  opacity: 1;
  background: #632c65;
background: -moz-linear-gradient(-45deg, #632c65 15%, #56a5e2 100%);
background: -webkit-linear-gradient(-45deg, #632c65 15%,#56a5e2 100%);
background: linear-gradient(135deg, #632c65 15%,#56a5e2 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#632c65', endColorstr='#56a5e2',GradientType=1 );
}

.quotes .box.box3:hover,
.quotes .box.box3:hover~.bg {
  opacity: 1;
  background: #4b384c;
background: -moz-linear-gradient(-45deg, #4b384c 15%, #da5de2 100%);
background: -webkit-linear-gradient(-45deg, #4b384c 15%,#da5de2 100%);
background: linear-gradient(135deg, #4b384c 15%,#da5de2 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4b384c', endColorstr='#da5de2',GradientType=1 );
}
</style>
</head>

<body onload="trainers.init()">
	<!-- These are trainer detail templates used by trainer.js to render the trainer related details -->
	<%
	int i = 0;
	%>
	<script type="text/html" id="Trainer-details-template"
		targetId="trainers-list-container">
	    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
		    <div class="class-wrap">
		        <div class="class-text flex-column flex-valign-center trainer-schedules" >
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
					<div style=" width:100%;" class="flex-column flex-valign-center flex-grow trainer-details-card-inner-container {demoClass} classbg" >
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
	<%@include file="./html/trainee-forgot-password-dialog.html"%>
	<!-- Hero Start -->
	<div class="hero" style="background-color: #8f00ff">
		<center></center>
		<div class="container-fluid">
			<div class="row align-items-center">
				<div class="col-sm-12 col-md-12 col-lg-6">
					<div class="hero-text">
						<h1 style="color:#db5132e0">Book Your Online Fitness Classes Now</h1>
						<span style="color:#570000"><strong>How much importance you give to yourself. Invest in
							self.</strong></span>
<!-- 						<span style="font-size: 14px; color: #1000ff">Don't wish -->
<!-- 							for it, work for it.</span> -->
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
	<!-- Hero End -->
	
	<!-- Expertise New Start -->
	<section class="purchase" id="buy-now" style="background: #ebfbc7">
    <div class="container"><br>
    <div class="section-header text-center wow zoomIn"
				data-wow-delay="0.1s">
<!-- 				<p>Dealwithfitness </p> -->
				<h2 style="color:#0000a8; text-transform: uppercase;">Fitness Expertise(style-1)</h2>
			</div>
                <ul class="wow fadeInDown" data-wow-delay="0.3s">
                            <li>
                    <a href="">
                        <strong style="color:#862323;">Yoga for Health</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
            
                            <li>
                    <a href="">
                         <strong style="color:#862323;">Weight Loss</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
            
                            <li>
                    <a href="">
                         <strong style="color:#862323;">Kids Yoga</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
                    </ul>
                    
                    <ul class=" wow fadeInDown" data-wow-delay="0.5s">
                            <li>
                    <a href="">
                         <strong style="color:#862323;">Pregnancy Yoga</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
            
                            <li>
                    <a href="">
                         <strong style="color:#862323;">Meditation</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
            
                            <li>
                    <a href="">
                         <strong style="color:#862323;">Dance</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
                    </ul>
                    
                    <ul class="wow fadeInDown" data-wow-delay="0.7s">
                            <li>
                    <a href="">
                         <strong style="color:#862323;">Zumba</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
            
                            <li>
                    <a href="">
                        <strong style="color:#862323;">Weight/Body Weight workout</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
            
                            <li>
                    <a href="">
                        <strong style="color:#862323;">Nutrition</strong>
                        <span class="purchase-description">Classes : 30</span> 
                        <span class="purchase-description">Trainers : 20</span> 
                        <span class="purchase-description">Trainees : 150</span>
<!--                         <big class="purchase-price">$149</big> -->
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
                        <span class="purchase-button">Book Now</span>
                    </a>
                </li>
                    </ul>
    </div>
</section>
	<!-- Expertise New End -->
	
	
	<!-- Expertise Start -->
	<div class="service " style="background: #ebfbc7">
		<div class="container">
			<div class="section-header text-center wow zoomIn"
				data-wow-delay="0.1s">
<!-- 				<p>Dealwithfitness </p> -->
				<h2 style="color:#0000a8; text-transform: uppercase;">Fitness Expertises(style-2)</h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.0s" >
					<div class="service-item powerhover" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Yoga for Health</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Weight Loss</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Kids Yoga</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Pregnancy Yoga</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.8s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Meditation</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="1s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Dance</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="1.2s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Zumba</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="1.4s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Weight/Body Weight Workout</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="1.6s">
					<div class="service-item" style="background-color:#97d4f2;color:#0000a8;border-radius: 50%;">
						<div class="class-img"> 
                            <img src="img/yoga-icon123.png" alt="Image">  
                        </div>
						<h3 style="color:#862323;">Nutrition</h3>
						<p>Classes : <strong>30</strong></p>
						<p>Trainers : <strong>20</strong></p>
						<p>Trainees : <strong>150</strong></p>
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- Expertise End -->
	
	<div class="class" style="background: #000080">
		<div class="container">
			<div class="section-header text-center" style="max-width: none">
				<h3	style="color: white; font-size: 40px; letter-spacing: 1px; text-transform: uppercase;"><strong>Find
					Your Fitness Guru</strong></h3>
				<div class="flex flex-wrap flex-valign-center flex-halign-center pb filter-container" style="background: #97d4f2">
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
	
	
	<!-- Comments Start -->
	<div class="commentbody">
	<div class="section-header text-center wow zoomIn"
				data-wow-delay="0.1s">
<!-- 				<p>Dealwithfitness </p> -->
				<h2 style="color:#0000a8; text-transform: uppercase;">Feedbacks</h2>
			</div>
  <div class="quotes">
    <div class="card">
      <div class="box box1">
        <p>The first step toward success is taken when you refuse to be a captive of the environment in which you first find yourself. </p>
        <h2>Mark Caine</h2>
      </div>
      <div class="bg"></div>
    </div>
    <div class="card">
      <div class="box box2">
        <p>Your smile will give you a positive countenance that will make people feel comfortable around you. </p>
        <h2>Les Brown</h2>
      </div>
      <div class="bg"></div>
    </div>
    <div class="card">
      <div class="box box3">
        <p>Before anything else, preparation is the key to success. </p>
        <h2>Alexander Graham Bell</h2>
      </div>
      <div class="bg"></div>
    </div>
  </div>
  </div>
	<!-- Comments End -->

	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top">
		<i class="fa fa-chevron-up"></i>
	</a>

	
</body>
</html>
