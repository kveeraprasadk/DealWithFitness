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
<script src="./dist/external/moment.min.js"></script>



<!-- Added this for fixating the header otherwise not needed -->
<script src="js/main.js"></script>
<script src="assets/js/scripts.js"></script>


<style type="text/css">
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
}
.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 0.5rem;
    font-size:12px;
}
}
</style>

<script id="view-stories-fragment" type="text/html"
	targetId="view-stories-container">
    <div class="flex-column mt pb story-fragment">
		<div class="flex flex-wrap flex-valign-center flex-halign-space-between">
			<span class="hightlighter-box-text user-name pt" title="{trainerName}">
				<span class="fa fa-user pr"></span>
				<span title="{trainerName}">{trainerName}</span>
			</span>
			<span style="font-size:12px; color:gray;" class="pt flex flex-valign-center">
				<span class="far fa-clock pr-sm pl-sm"></span> Submitted on {time}
			</span>
		</div>
		<div class="flex-column pt">
			<div class="static-text-container">
				<span style = "word-break: break-all; font-size:14px">{_story}</span>
				{moreElement}
			</div>
		</div>
		<div class="flex flex-wrap mb" id="img-container-{storyId}">
		</div>
		<div class="flex flex-wrap flex-halign-space-between flex-valign-center">
			<ul style="margin:0px;padding-left: 15px" class="pt">
				<li style="font-size: 14px; color: {approvalColor}">
					{approvalStatus}
				</li>
			</ul>	
			<div id="button-container-{storyId}">	</div>	
			<div class="flex pt">
				<button class='btn btn-primary hidebutton {showPhotosClass}' id='hidebutton-{storyId}' traineeId='{traineeId}' storyId='{storyId}' onclick='stories.hidePhotosEvent(event)'>Hide Photos</button>
				<button class="btn btn-primary showbutton {showPhotosClass}" id='showbutton-{storyId}' traineeId="{traineeId}" storyId="{storyId}" onclick="stories.showPhotosEvent(event)">
					Show Photos
				</button>
				
				<button class="btn btn-primary ml" storyId="{storyId}" onclick="stories.deleteStoryEvent(event)">
					Delete Story
				</button>
			</div>
		</div>
    </div>

</script>

</head>

<body onload="stories.init()">
	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<%@include file="./html/dialogs.html"%>
	<!-- Nav Bar End -->

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>My Fitness Journey</h2>
				</div>
				<div class="col-12">
					<div class="card-deck">
					<div class="card ">
						<div class="card-body text-center">
							<p class="card-text">
								<a href="testimonials.jsp"><i class="fa fa-heart pr" style="font-size: 23px"></i>Add Story</a>
							</p>
						</div>
					</div>
					<div class="card ">
						<div class="card-body text-center">
							<p class="card-text">
								<a href="viewtestimonials.jsp"><i class="fa fa-eye pr" style="font-size: 23px"></i>View Stories</a>
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
			<div class="section-header text-center"
				style="max-width: none; margin-bottom: 15px">
				<h3 style="text-align: left">View Stories</h3>
			</div>
			<div id="no-stories-message" class="hide" style="color: red">You have not added
				any stories so far, please use <b>Add Story</b> option to compose your
				fitness story
			</div>
			<div class="mt flex-column">
				<div id="view-stories-container" class="flex-column"></div>
			</div>
		</div>
	</div>
</body>
</html>