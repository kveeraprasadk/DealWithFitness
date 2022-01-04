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
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script src="./js/jquery.min.js"></script>
<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/trainee-journey.js"></script>

<!-- JavaScript Libraries -->
<script src="./js/bootstrap.bundle.min.js" ></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/isotope/isotope.pkgd.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>


<!-- Added this for fixtating the header otherwise not needed -->
<script src="js/main.js"></script>
<script src="assets/js/scripts.js"></script>

<style>
.photo-trigger-button {
	opacity: 0;
	position: absolute;
	left: -100px;
}

.photo-trigger-button-label {
	position: absolute;
	top: 50%;
	left: 1rem;
	transform: translateY(-50%);
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
    margin-right: 5px;
    margin-left: 5px;
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
}
}
</style>
</head>

<body onload="journey.init()">
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
			<div class="section-header text-center" style="max-width: none">
				<h3 class="mb" style="text-align: left">Add New Story</h3>
				<form role="form" enctype="multipart/form-data"
					action="TraineeStoryServlet" method="post" id="trainerregform"
					name="trainerregform" class="registration-form"
					onsubmit="return journey.validateInputsOnSubmitEvent()">

					<input type="hidden" name="traineeId" id="traineeId" />
					<div class="flex pt mt col-6"
						style="min-width: 140px; box-sizing: border-box">
						<select class="form-control" id="journey-trainers-list"
							name="trainerId">
						</select>
					</div>
					<div class="form-group flex-column pt">
						<label for="exampleFormControlTextarea1" style="text-align: left">Provide
							your fitness journey not more than 7500 characters</label>
						<textarea class="form-control rounded-0" style="min-height: 300px"
							maxlength="7500" id="journey-story-text" name="story"></textarea>
					</div>
					<div class="flex-column flex-valign-start">
						<label class="label-plain" style="text-align: left">
							<b>Optional:</b>
							choose upto maximum 2 photographs with total size not exceeding
							512KB
						</label>
						<label style="font-size: 12px; color: blue">Supported
							formats are jpeg, jpg, png, gif, tif and tiff</label>
					</div>
					<div class="flex flex-wrap pb mb">
						<div class="col-12 col-md-6 mx-auto">
							<div
								class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
								style="">
								<input name="firstPhoto" id="firstPhoto" type="file"
									class="form-control border-0 photo-trigger-button"
									accept=".jpg, .png, .jpeg, .gif, .tif, .tiff">
								<label id="firstPhoto-lbl" for="firstPhoto"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="firstPhoto"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fa fa-cloud-upload mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Choose
											Photo</small>
									</label>
								</div>
							</div>
							<!-- Uploaded image area-->
							<div>
								<div class="image-area mt-4">
									<img id="firstPhoto-img" src="#" alt=""
										class="img-fluid rounded shadow-sm mx-auto d-block">
								</div>
							</div>
						</div>
						<div class="col-12 col-md-6 mx-auto">
							<div
								class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
								style="">
								<input name="secondPhoto" id="secondPhoto" type="file"
									class="form-control border-0 photo-trigger-button"
									accept=".jpg, .png, .jpeg, .gif, .tif, .tiff">
								<label id="secondPhoto-lbl" for="secondPhoto"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="secondPhoto"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fa fa-cloud-upload mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Choose
											Photo</small>
									</label>
								</div>
							</div>
							<!-- Uploaded image area-->
							<div>
								<div class="image-area mt-4">
									<img id="secondPhoto-img" src="#" alt=""
										class="img-fluid rounded shadow-sm mx-auto d-block">
								</div>
							</div>
						</div>
					</div>
					<div class="flex-column pt mt"
						style="border-top: 1px solid rgb(220, 220, 220)">
						<div class="flex-column">
							<h5 style="text-align: left">Story Compose & Review Process</h5>
							<ul style="color: red">
								<li style="text-align: left">Once you compose the story,
									please click on submit button which then goes through review
									process.</li>
								<li style="text-align: left">Deal with fitness
									Administrator will review your story and then approves it.</li>
								<li style="text-align: left">Once the story is approved it
									will be published and available for public consumption.</li>
							</ul>
						</div>
						<div class="flex flex-halign-end pt"
							style="border-top: 1px solid rgb(220, 220, 220)">
							<input type="submit" value="Submit" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>