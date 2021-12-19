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
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/trainee-journey.js"></script>

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

<!-- Added this for fixating the header otherwise not needed -->
<script src="js/main.js"></script>
<script src="assets/js/scripts.js"></script>

<!-- Comments -->
<!-- <link rel="stylesheet" href="comment/fonts/icomoon/style.css"> -->
    <link rel="stylesheet" href="comment/css/owl.carousel.min.css">
<!--     <link rel="stylesheet" href="comment/css/bootstrap.min.css">     -->
    <link rel="stylesheet" href="comment/css/style.css">
    <script src="comment/js/jquery-3.3.1.min.js"></script>
    <script src="comment/js/popper.min.js"></script>
    <script src="comment/js/bootstrap.min.js"></script>
    <script src="comment/js/owl.carousel.min.js"></script>
    <script src="comment/js/main.js"></script>
<script>
	function init() {
	
		$
		.ajax({
			type : 'GET',
			url : "${pageContext.request.contextPath}/FeedbackCommentsViewServlet",
		});
	}
$(document).ready(function(){	
$('.forgot-progressbar').hide();
		});
</script>
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
  width: 25vw;
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
@media screen and (min-width: 200px) and (max-width: 970px) {
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

</head>

<body onload="init()">
	<!-- Top Bar Start -->
	<!-- Top Bar End -->

	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<%@include file="./html/dialogs.html"%>
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
						<form  name="sentMessage" id="contactForm" >
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
								<input type="number" class="form-control" id="phonenumber" 
									placeholder="Your Phone Number" required="required"
									data-validation-required-message="Please enter your phone number" />
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
							<div class="control-group">
									<div class="progress forgot-progressbar">
    											<div class="progress-bar  progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
    											Sending</div>
  									</div>
							</div><br>
							<div class="control-group">
								<button class="btn btn-primary" type="submit" id="sendMessage">Send
									Message</button>
							</div>
						</form>
					</div>
				</div>				
			</div>			
		</div>
	</div>
	<!-- Contact End -->
	
	
	<!-- Comments Start -->
	<div class="content commentbody">
    
    <div class="container ">
      <div class="row mb-5 ">
        <div class="col-12 text-center">
          <h2 class="my-5">Feedbacks</h2>
        </div>
      </div>
    </div>


    <div class="site-section bg-left-half mb-5">
      <div class="container owl-2-style">      

        <div class="owl-carousel owl-2 quotes">
<%
				ArrayList<TrainerDetailsVO> comments1 = (ArrayList<TrainerDetailsVO>) request
						.getAttribute("CommentListData");
			%>


			<%
				// Iterating through subjectList
				if (comments1 != null && comments1.size() > 0) // Null check for the object
				{
					Iterator<TrainerDetailsVO> iterator1 = comments1.iterator(); // Iterator interface
					int inv1 = 0;
					for (TrainerDetailsVO commentdetails1 : comments1) // iterate through all the data until the last record
					{
						//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
						inv1++;
						//	System.out.println("My Investor: "+ traineedetails.getName());
			%>

          <div class="card">
          <div class="box box1">
<!--             <img src="images/person_1_sm.jpg" alt="Image" class="img-fluid"> -->
            <h3><%=commentdetails1.getName()%></h3>
            <p><%=commentdetails1.getComment()%></p>
            <p class="text-right"><%=commentdetails1.getDefdays()%></p>
          </div>
          <div class="bg"></div>
    	  </div>     
		<%
							}
							}
						%>
        </div>
		
      </div>
    </div>

  </div>
    
	<!-- Comments End -->
	
	<!-- Feedback view Start -->
	<div class="about wow fadeInUp" data-wow-delay="0.1s"
		style="background: white">
		<div class="container">
			<div class="row align-items-center">
				<h4>Feedbacks</h4>
				<table class="table table-bordered">
				<tr>
				<th>Name</th>
				<th>Subject</th>
				<th>Comment</th>
				<th>Time</th>
				</tr>
				<%
				ArrayList<TrainerDetailsVO> comments = (ArrayList<TrainerDetailsVO>) request
						.getAttribute("CommentListData");
			%>


			<%
				// Iterating through subjectList
				if (comments != null && comments.size() > 0) // Null check for the object
				{
					Iterator<TrainerDetailsVO> iterator = comments.iterator(); // Iterator interface
					int inv = 0;
					for (TrainerDetailsVO commentdetails : comments) // iterate through all the data until the last record
					{
						//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
						inv++;
						//	System.out.println("My Investor: "+ traineedetails.getName());
			%>
						<tr>
						<td><%=commentdetails.getName()%></td>
						<td><%=commentdetails.getSubject()%></td>
						<td><%=commentdetails.getComment()%></td>
						<td><%=commentdetails.getCreatetime()%></td>
						</tr>
			
			<%
							}
							}
						%>
				
				</table>				
			</div>
		</div>
	</div>
	<!-- About End -->


	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

</body>
</html>
