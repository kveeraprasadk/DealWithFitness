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
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="css/all.min.css" rel="stylesheet"> -->
<link href="css/style.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Template Stylesheet -->

<script src="./dist/external/moment.min.js"></script>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.validate.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.validate.min.js"></script>
<script src="./js/popper.min.js"></script>
<script src="./js/platform.js" async defer></script>

<meta name="google-signin-client_id" content="GOOGLEID">
<!-- Add Google ID -->
<link rel="stylesheet" type="text/css" href="./css/common.css">

<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/home-trainers.js"></script>
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
<link rel="icon" href="img/yoga-icon1.jpg">

<!-- Comments -->
	<link rel="stylesheet" href="comment/fonts/icomoon/style.css">
    <link rel="stylesheet" href="comment/css/owl.carousel.min.css">
    <link rel="stylesheet" href="comment/css/bootstrap.min.css">    
    <link rel="stylesheet" href="comment/css/style.css">
    <script src="comment/js/jquery-3.3.1.min.js"></script>
    <script src="comment/js/popper.min.js"></script>
    <script src="comment/js/bootstrap.min.js"></script>
    <script src="comment/js/owl.carousel.min.js"></script>
    <script src="comment/js/main.js"></script>


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

<style type="text/css">
.class-wrap:hover {
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  
  animation-duration: 0.25s;
  border-left: 8px light grey;
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
}

.classexpertise {
    margin: 0px;
    position: absolute;
    bottom: 1.0rem;
    left: 0rem;
/*     background: #e0e32ec9;   */
    background: #e0e32efa;
    border-radius: 0.4rem;
    font-weight: 500;
    font-size: 1.2rem;
    line-height: 1.6rem;
    color: rgb(54, 54, 54);
    width: max-content;
    padding: 0.2rem 0.5rem 0.3rem;
    
}
.btntext{
text-align: left !important;
}
.cardcomment{
margin:3px;
}
.commentbox {
margin:10px;
}

.card-deck{
margin-top: 15px !important;
margin-bottom: 15px !important;
}
.headingtext{
color:#db5132e0;
font-size: 25px;
font-weight: 700;
margin-bottom: 20px;
}
@media (min-width: 576px){
.card-deck {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
    margin-right: -15px;
    margin-left: -15px;
    margin-top: 15px ;
	margin-bottom: 15px ;
}
}
@media screen and (min-width: 200px) and (max-width: 970px) {
  .backimage{
background-image: url('./img/footer-bg.png');
  background-position: center center;
  background-attachment: fixed;
  background-size: cover;
  background-repeat: no-repeat;
  height: 80%;
}
 
.headingtext{
color:#db5132e0;
font-size: 22px;
font-weight: 600;
margin-bottom: 20px;
margin-top: 260px;
}
.hero{
height:420px;
}
.texthide{
display: none;
}
.mobilealign{
margin-top: -20px;
margin-left: 240px;
}
.card-deck {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-flow: row wrap;
    flex-flow: row wrap;
    margin-right: -15px;
    margin-left: -15px;
}
.card{
margin-right: 3px;
margin-left: 3px;
border-radius: 10px;
}
.card-body {  
    padding: 0.5rem;
    }
    .mobilecard{
    margin-top: 20px;   
    }
    
 .quotes .box {
  position: relative;
  width: 100%; 
  background: white;
  overflow: hidden;
  transition: all 0.5s ease-in;
  z-index: 2;
  box-sizing: border-box;
  padding: 30px;
/*   box-shadow: -10px 25px 50px rgba(0, 0, 0, 0.3); */
}
}
</style>
<style type="text/css">
<!--Comments css -->
.commentbody {
  
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
  width: 100%;
  height: 50vh;
  min-height: 320px;
  background: white;
  overflow: hidden;
  transition: all 0.5s ease-in;
  z-index: 2;
  box-sizing: border-box;
  padding: 30px;
/*   box-shadow: -10px 25px 50px rgba(0, 0, 0, 0.3); */
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
/*   background: transparent; */
  pointer-events: none;
}

.quotes .box::after {
  content: '\201D';
  position: absolute;
  bottom: -10%;
  right: 5%;
  font-size: 120px;
  opacity: 0.2;
/*   background: transparent; */
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

/* .quotes .box:hover { */
/*   color: #f2f2f2; */
/*   box-shadow: 20px 50px 100px rgba(0, 0, 0, 0.5); */
/* } */

.quotes .bg {
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  opacity: 0;
  transition: all 0.5s ease-in;
  pointer-events: none;
  width: 100%;
  height: 100%;
  overflow: hidden;
}

/* .quotes .box.box1:hover, */
/* .quotes .box.box1:hover~.bg { */
/*   opacity: 1; */
/* /*   background: #e2a9e5; */ */
/* /* background: -moz-linear-gradient(-45deg, #e2a9e5 15%, #2b94e5 100%); */ */
/* /* background: -webkit-linear-gradient(-45deg, #e2a9e5 15%,#2b94e5 100%); */ */
/* /* background: linear-gradient(135deg, #e2a9e5 15%,#2b94e5 100%); */ */
/* filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e2a9e5', endColorstr='#2b94e5',GradientType=1 ); */
/* } */

/* .quotes .box.box2:hover, */
/* .quotes .box.box2:hover~.bg { */
/*   opacity: 1; */
/*   background: #632c65; */
/* background: -moz-linear-gradient(-45deg, #632c65 15%, #56a5e2 100%); */
/* background: -webkit-linear-gradient(-45deg, #632c65 15%,#56a5e2 100%); */
/* background: linear-gradient(135deg, #632c65 15%,#56a5e2 100%); */
/* filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#632c65', endColorstr='#56a5e2',GradientType=1 ); */
/* } */

/* .quotes .box.box3:hover, */
/* .quotes .box.box3:hover~.bg { */
/*   opacity: 1; */
/*   background: #4b384c; */
/* background: -moz-linear-gradient(-45deg, #4b384c 15%, #da5de2 100%); */
/* background: -webkit-linear-gradient(-45deg, #4b384c 15%,#da5de2 100%); */
/* background: linear-gradient(135deg, #4b384c 15%,#da5de2 100%); */
/* filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4b384c', endColorstr='#da5de2',GradientType=1 ); */
/* } */
</style>
<script type="text/javascript">
	
	function renderTrainerProfile() {
		trainers.init();
	
			
			const image = $("#trainer-profile-base64-encoded-element").val();			
			if (image) {
				console.log("Profile picture present")
				$("#profile-image-element").attr("src",
						"data:image/*;base64," + image);
			} else {
				console.log("No profile picture");
			}				
		
	}
</script>


</head>

<body onload="renderTrainerProfile()">
	<!-- These are trainer detail templates used by trainer.js to render the trainer related details -->
	<%
	int i = 0;
	%>
	
	<script type="text/html" id="Trainer-details-template"
		targetId="trainers-list-container-image">
	    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp " data-wow-delay="0.0s">
		    <div class="class-wrap">				 
		        	<div class="class-text flex-column flex-valign-center trainer-schedules" >
						
						<div class="class-img">
							<img src="data:image;base64,{base64Image}" alt="">										
                 		</div>
						<p class="classexpertise">{expertise}</p>
						<div class="class-teacher">
						<span class="far fa-check-circle flex flex-valign-center {attendeeSubscribedClass} trainee-selected" style="margin-left:10px"></span>
		            	<button class="btn profiledata"  value="{email}" title="View Trainer Profile">
						<span class="flex-grow trainer-name" >{name}</span>						
						</button>
		        	</div>
					
					<button class="btn profiledata" style="background-color: #dae2e642;"  value="{email}" title="View Trainer Profile">
					<div style=" width:100%;" class="flex-column  flex-grow trainer-details-card-inner-container {demoClass}" >
						<div class="flex-column flex-grow">	
			            	<div class="class-meta flex" style="color: #050df6;">
								<span class="pl" style="text-align:left; font-size: 1rem;color:gray; padding-right:30px;">									
									{expertise}                                                    
								</span>
								<span  style="font-size: 1rem;color:gray;flex: 1; text-align: right; white-space: nowrap;">
								<span class="pr-sm">&#x20B9;</span>{fee}/Month
								</span>
			            	</div>
						</div>							
					</div>
					
					<div style=" width:100%;" class="flex-column  flex-grow trainer-details-card-inner-container {demoClass}" >
						<div class="flex-column flex-grow">	
							<div class="class-meta flex" style="color: #050df6;">
								<span class="pl" style="text-align:left; font-size: 1rem;color:gray; padding-right:30px;">
									
									{schedule}&nbsp({duration})                                                    
								</span>
								<span class="pr" style="text-align:right; font-size: 1rem;color:gray; ">
									{classdays}                                                  
								</span>
			            	</div>										             	
		            	</div>
					</div>					
					</button>
					<div style=" width:100%;" class="flex-column flex-valign-center flex-grow trainer-details-card-inner-container" >
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
	<script type="text/html" id="Trainer-details-template-empty"
		targetId="trainers-list-container">
	    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp " data-wow-delay="0.0s">
		    <div class="class-wrap">				 
		        	<div class="class-text flex-column flex-valign-center trainer-schedules" >
						
						<div class="class-img">
							<img src="data:image;base64,{base64Image}" alt="">										
                 		</div>
						<p class="classexpertise">{expertise}</p>
						<div class="class-teacher">
						
		            	<button class="btn profiledata"  value="{email}" title="View Trainer Profile">
						<span class="flex-grow trainer-name" >{name}</span>						
						</button>
		        	</div>
					
					<button class="btn profiledata" style="background-color: #dae2e642;"  value="{email}" title="View Trainer Profile">
					<div style=" width:100%;" class="flex-column  flex-grow trainer-details-card-inner-container {demoClass}" >
						<div class="flex-column flex-grow">	
			            	<div class="class-meta flex" style="color: #050df6;">
								<span class="pl" style="text-align:left; font-size: 1rem;color:gray; padding-right:30px;">									
									{expertise}                                                    
								</span>								
			            	</div>
						</div>							
					</div>									
					</button>
					<div class="flex-column flex-valign-center trainer-details-card-inner-container flex-grow"> 
					
 					<span style="color:red; padding: 10px" class="flex flex-valign-center"> 
 						<span class="fa fa-info-circle pr-sm" style="font-size:20px"></span>Trainings are not scheduled yet. 
 					</span> 
		        </div> 
		        </div>
		    </div>
		
		</div>
	</script>
	<!--If trainer is not providing any trainings then this template will be rendered -->
<!-- 	<script type="text/html" id="Trainer-details-template-empty" -->
<!-- 		targetId="trainers-list-container"> -->
<!-- 	    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp box" data-wow-delay="0.0s"> -->
<!-- 		    <div class="class-wrap class-text flex-column"> -->
<!-- 	            <div class="class-teacher"> -->
<!-- 		            <span class="flex-grow trainer-name" style="font-size:1.2rem;"><strong>{name}</strong></span> -->
<!-- 					<a style="height: 32px;width: 32px" title="View Trainer Profile"> -->
<!-- 						<button class="btn profiledata home-trainer-list-a fas fa-external-link-alt" value="{email}" style="font-size:18px"> -->
<!-- 						</button> -->
<!-- 					</a> -->
<!-- 	        	</div> -->
<!-- 		    	<div class="flex-column flex-valign-center trainer-details-card-inner-container flex-grow"> -->
<!-- 					<h4>{expertise}</h4> -->
<!-- 					<span style="color:red; padding: 10px" class="flex flex-valign-center"> -->
<!-- 						<span class="fa fa-info-circle pr-sm" style="font-size:20px"></span>Trainings are not scheduled yet. -->
<!-- 					</span> -->
<!-- 		        </div> -->
<!-- 		    </div> -->
<!-- 		</div> -->
<!-- 	</script> -->
	<!--This template will be providing all comments data -->
	<script type="text/html" id="Comments-details-template"
		targetId="comments-list-index">
		
 <div class="col-lg-12 col-md-12 col-sm-12 class-item filter-1 wow fadeInUp box" >
<div class="container-fluid">
          	<div class="card cardcomment">
          		<div class="box commentbox">
<!--             	<img src="images/person_1_sm.jpg" alt="Image" class="img-fluid"> -->
            		<h3>{name}</h3>
            		<p>" {comment} "</p>
            		<p class="text-right">{defdays}</p>
          		</div>
          	<div class="bg"></div>
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
	<%@include file="./html/Trainee-Phone-Number-Dialog.html"%>
	
	
	<!-- Hero Start -->	
	<div class="hero backimage" style="background-color: #dae2e642" >
		<center></center>
		<div class="container-fluid ">
			<div class="row align-items-center">
				<div class="col-sm-12 col-md-12 col-lg-6">
					<div class="hero-text">
						<div class="headingtext texthide" >Book Your Online Fitness Classes Now</div>
						<span class="texthide" style="color:#570000"><strong>How much importance you give to yourself. Invest in
							self.</strong></span>
						<span class="texthide" style="font-size: 14px; color: #1000ff"><strong>Don't wish
							for it, work for it.</strong></span>
					</div>		 
										
					<div class="pl pt ">				
<!-- 					<button class="btn btn-danger ppp" onclick='trainers.filterTrainers(event)' value="Yoga">Yoga</button> -->
<!-- 					<button class="btn btn-info ppp" onclick='trainers.filterTrainers(event)' value="Weight / Body weight Workout">Workout</button> -->
<!-- 					<button class="btn btn-warning ppp" onclick='trainers.filterTrainers(event)' value="Dance">Dance</button> -->
<!-- 					<button class="btn btn-success ppp" onclick='trainers.filterTrainers(event)' value="Nutrition">Nutrition</button> -->
					<input type="hidden" id="form-filter-misc" value="all" />
					<input type="hidden" id="form-sortby" value="asc" />
					</div>
					<div class="pl pt mobilealign">
<!-- 						<button class="btn btn-primary ppp form-filter-expertise" onclick='trainers.filterTrainers(event)' value="all">Get Your Demo Class</button> -->
						<button class="btn btn-primary bookbutton mr hide"
							id="existing-trinee-signin"
							onclick="trainers.showLoginDialogEvent()">Sign In</button>
<!-- 						<button class="btn btn-success bookbutton hide" -->
<!-- 							onclick="trainers.showRegisterDialogEvent()" -->
<!-- 							id="new-trainee-ac-create">New Trainee Account</button> -->
						<button class="btn btn-primary bookbutton hide"
							onclick="trainers.showMyBookingsEvent()" id="trainee-ac-bookings">My
							Trainings</button>
							
					</div>
				</div>
				<div class="col-md-6 col-sm-12 ">
					<div class="hero-image">
						<img src="img/hero.png" alt="Hero Image">
					</div>	
				</div>				
			</div>	
				
		</div>		
	</div>
	<!-- Hero End -->
	
	<!-- cards start -->

	<div class="container mobilecard">
	<div class="container-fluid">
			 
    <div class="card-deck">
    <div class="card ">
      <div class="card-body text-center">
        <p class="card-text">
        <button class="ppp" style="border:none; background:white;" onclick='trainers.filterTrainers(event)' value="Yoga">Yoga</button>
        </p>
        
      </div>
    </div>
    <div class="card ">
      <div class="card-body text-center">
        <p class="card-text">
       <button class="ppp" style="border:none; background:white;" onclick='trainers.filterTrainers(event)' value="Weight / Body weight Workout">Workout</button>
        </p>
      </div>
    </div>
    <div class="card ">
      <div class="card-body text-center">
        <p class="card-text">
       <button class="ppp" style="border:none; background:white;" onclick='trainers.filterTrainers(event)' value="Dance">Dance</button>
        </p>
      </div>
    </div>
    <div class="card ">
      <div class="card-body text-center">
        <p class="card-text">
        <button class="ppp" style="border:none; background:white;" onclick='trainers.filterTrainers(event)' value="Nutrition">Nutrition</button>
        </p>
      </div>
    </div>  
  </div>
  <div class="card-deck justify-content-center">
  <div class="card ">
      <div class="card-body text-center">
        <p class="card-text">
        <button class="" style="border:none; background:white;" onclick='trainers.filterTrainers(event)' value="all">Get Your Demo Class</button>
        </p>
      </div>
    </div>  
  </div>
</div>
    </div>
	<!-- cards end -->
	
<script type="text/javascript">	
	$(".ppp").click(function() {
    $('html,body').animate({
        scrollTop: $(".viru").offset().top},
        'slow');
});
	</script>
	<!-- Schedules image Start -->	
	<div class="class viru" style="background: white" >
		<div class="container">
			<div class="section-header text-center" style="max-width: none">
				<h2	style="color:#0000a8; letter-spacing: 1px; text-transform: uppercase;"><strong>Find
					Your Fitness Guru</strong></h2>
<!-- 				<div class="flex flex-wrap flex-valign-center flex-halign-center pb filter-container" style="background: #97d4f2"> -->
<!-- 					<div class="flex-column mt mr ml  flex-grow"> -->
<!-- 						<span style="font-size: 14px; text-align: left" class="pb-sm">Expertise -->
<!-- 							of your choice</span> -->
<!-- 						<select name="form-expertise" id="form-expertise" -->
<!-- 							class="form-control required flex-grow" -->
<!-- 							onchange='trainers.filterTrainers(event)' style="width: auto"> -->
<!-- 							<option value="all">All Expertise</option> -->
<!-- 							<optgroup label="Yoga"> -->
<!-- 								<option value="Yoga for health">Yoga for health</option> -->
<!-- 								<option value="Weight Loss">Weight Loss</option> -->
<!-- 								<option value="Kids Yoga">Kids Yoga</option> -->
<!-- 								<option value="Pregnancy Yoga">Pregnancy Yoga</option> -->
<!-- 								<option value="Meditation">Meditation</option> -->
<!-- 							</optgroup> -->
<!-- 							<optgroup label="Dance"> -->
<!-- 								<option value="Dance">Dance</option> -->
<!-- 								<option value="Zumba">Zumba</option> -->
<!-- 							</optgroup> -->
<!-- 							<option value="Weight / Body weight Workout">Weight / -->
<!-- 								Body weight Workout</option> -->
<!-- 							<option value="Nutrition">Nutrition</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="flex-column mt mr ml  flex-grow"> -->
<!-- 						<span style="font-size: 14px; text-align: left" class="pb-sm">Your -->
<!-- 							preferred timings</span> -->
<!-- 						<select name="form-sort" id="form-filter-misc" -->
<!-- 							class="form-control required flex-grow" -->
<!-- 							onchange='trainers.filterByMisc(event)' " style="width: auto"> -->
<!-- 							<option value="all">All Timings</option> -->
<!-- 							<option value="04:00:00 11:59">Morning 04:00 AM to 11:59 -->
<!-- 								AM</option> -->
<!-- 							<option value="12:00:00 16:59">Afternoon 12:00 PM to -->
<!-- 								04:59 PM</option> -->
<!-- 							<option value="17:00:00 23:59">Evening 05:00 PM to 11:59 -->
<!-- 								PM</option> -->
<!-- 							<option value="00:00:00 03:59">Night 12:00 AM to 03:59 -->
<!-- 								AM</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="flex-column mt mr ml flex-grow"> -->
<!-- 						<span style="font-size: 14px; text-align: left" class="pb-sm">Sort -->
<!-- 							by</span> -->
<!-- 						<select name="form-sort" id="form-sortby" -->
<!-- 							onchange='trainers.sortTrainersList(event)' -->
<!-- 							class="form-control required flex-grow" style="width: auto"> -->
<!-- 							<option value="asc">Fee Lowest to Highest</option> -->
<!-- 							<option value="desc" selected>Fee Highest to Lowest</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 					<div class="hero-btn"></div> -->
<!-- 				</div> -->
				 <div id="trainers-list-container-image" class="flex flex-wrap"></div>
			</div>
		</div>
	</div>
	<!-- Schedules image End -->	
	<!-- comments script Start -->	
	<div class="content commentbody">
		<div class="container ">
      <div class="section-header text-center" style="max-width: none">
				<h2	style="color:#0000a8; letter-spacing: 1px; text-transform: uppercase;"><strong>
				Feedback</strong></h2>
      </div>
    </div>
    <div id="comments-list-index" class="flex flex-wrap"></div>
<!--     <div class="site-section bg-left-half mb-5"> -->
<!--       <div class="container owl-2-style">       -->

<!--         <div class="owl-carousel owl-2 quotes"> -->
			
<!-- 			</div> -->
<!--     </div> -->

<!--   </div> -->
	</div>
	<!-- comments script End -->	
	
	
	
	
	
	
	

	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top">
		<i class="fa fa-chevron-up"></i>
	</a>


</body>
</html>
