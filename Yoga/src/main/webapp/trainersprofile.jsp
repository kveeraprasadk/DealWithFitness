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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="profile/css/bootstrap.min.css">
<link rel="shortcut icon" href="profile/images/fav.jpg">
<link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css" href="profile/css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />

<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.validate.js"></script>
<script src="./js/jquery.validate.min.js"></script>
<script src="./js/bootstrap.bundle.min.js" ></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/popper.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->

<script src="lib/easing/easing.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/isotope/isotope.pkgd.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="js/TrainerProfile.js"></script>
<script src="profile/js/jquery-3.2.1.min.js"></script>
<script src="profile/js/popper.min.js"></script>
<script src="profile/js/bootstrap.min.js"></script>
<script src="profile/js/script.js"></script>
<script src="./dist/whoami.js"></script>

<script src="./dist/external/tui-code-snippet.min.js"></script>
<script src="./dist/external/moment.min.js"></script>
<script src="./dist/external/tui-calendar.min.js"></script>
<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/trainer-booking.js"></script>
<script src="./dist/trainee-journey.js"></script>

<link rel="stylesheet" type="text/css"
	href="./css/external/tui-date-picker.css">
<link rel="stylesheet" type="text/css"
	href="./css/external/tui-time-picker.css">
<link rel="stylesheet" type="text/css"
	href="./css/external/tui-calendar.min.css">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/bookings.css">
<link rel="stylesheet" type="text/css" href="./css/icons.css">
<link rel="stylesheet" type="text/css" href="./css/common.css">

<style>
.toggle.ios, .toggle-on.ios, .toggle-off.ios {
	border-radius: 20px;
}

.toggle.ios .toggle-handle {
	border-radius: 20px;
}

.unstyled-button {
	border: none;
	padding: 0;
	background: none;
}

.error {
	color: #FF0000 !important;
}

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
</style>
<style>
/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
.input-group-append
	{
	margin-left	: 550px;
}


@media screen and (min-width: 200px) and (max-width: 970px) {
	.input-group-append {
		margin-left: 280px;
	} 
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



<script type="text/javascript">
	var calendarInitialized = false;

	function switchView(viewName) {
		$("#profile-container").css("display",
				viewName === "profile" ? "block" : "none");
		if (viewName === "calendar") {
			$("#calendar-container").css("display", "block");
			// Very first time do a lazy init
			if (!calendarInitialized) {
				trainerCalendar.init();
				calendarInitialized = true;
			}
		} else {
			$("#calendar-container").css("display", "none");
		}
	}

	function renderTrainerProfile() {
		switchView("calendar");
		journey.trainerinit();
		whoami.detect(()=> {
			const image = $("#trainer-profile-base64-encoded-element").val();
			if (image) {
				console.log("Profile picture present")
				$("#profile-image-element").attr("src",
						"data:image/*;base64," + image);
			} else {
				console.log("No profile picture");
			}		
		})
	}
</script>

</head>

<body onLoad="renderTrainerProfile()">

	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<%@include file="./html/dialogs.html"%>
	<%@include file="./html/trainer-profile-pic-update-modal.html"%>
	<!-- Nav Bar End -->

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Trainer's Zone</h2>
				</div>
				<div class="col-12">
				<div class="card-deck">
					<div class="card ">
						<div class="card-body text-center">
							<p class="card-text">
								<a href="javascript: switchView('calendar')" class="btn">
								<i class="fa fa-calendar-week pr"
						style="font-size: 23px"></i>My Trainings</a>
							</p>
						</div>
					</div>
					<div class="card ">
						<div class="card-body text-center">
							<p class="card-text">
								<a href="javascript: switchView('profile')"
						class="btn"><i class="fa fa-file pr" style="font-size: 23px"></i>My Profile</a>
							</p>

						</div>
					</div>
					</div> 
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Trainers calendar html inclusion -->
	<%@include file="./html/dialogs.html"%>
	<%@include file="./html/trainer-calender-booking.html"%>
	<%@include file="./html/recurrence-confirmation-dialog.html"%>

	<!-- About Start -->
	<div class="container-fluid overcover" id="profile-container"
		style="display: none">
		<div class="container profile-box">
			<div class="cover-image row"></div>
			<%
				ArrayList<TrainerDetailsVO> trainers = (ArrayList<TrainerDetailsVO>) request
						.getAttribute("TrainerProfileData");
			%>

			<%
				// Iterating through subjectList
				if (trainers != null && trainers.size() > 0) // Null check for the object
				{
					Iterator<TrainerDetailsVO> iterator = trainers.iterator(); // Iterator interface
					int inv = 0;
					for (TrainerDetailsVO trainerdetails : trainers) // iterate through all the data until the last record
					{
						//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
						inv++;
						//	System.out.println("My Investor: "+ trainerdetails.getName());
			%>
			<div class="row">
				<div class="col-lg-8 col-md-7 detail-px no-padding">
					<h3 class="mth3">Profile</h3>
					<div class="right">
						<button class="btn btn-info editprofileicon">
							<i class="fa fa-edit blue-color "></i> <span
								style="font-size: 14px">Edit Profile</span>
						</button>
					</div>
					<input type="hidden" id="trainer-profile-base64-encoded-element"
						value="<%=trainerdetails.getBase64Image()%>" />
					<form role="form" id="trainerprofileupdateform"
						name="trainerprofileupdateform" class="trainerprofileupdateform">
						<div class="fx-ro">
							<div class="dat col-lg-4">Trainer Email</div>
							<div class="dat col-lg-8">
								<b id="trainer-id"><%=trainerdetails.getEmail()%></b>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Trainer Name</div>
							<div class="dat col-lg-8">
								<input type="text" name="formname"
									class="form-name form-control" id="formname"
									value="<%=trainerdetails.getName()%>" required>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Experience</div>
							<div class="dat col-lg-8">
								<select name="formexperience" id="formexperience"
									class="form-control required" onfocus='this.size=5;'
									onblur='this.size=1;' onchange='this.size=1; this.blur();'
									required>
									<option value="<%=trainerdetails.getExperience()%>"><%=trainerdetails.getExperience()%></option>
									<option value="upto 2Yr">upto 2Yr</option>
									<option value="2 to 5Yrs">2 to 5Yrs</option>
									<option value="5 to 10Yrs">5 to 10Yrs</option>
									<option value="10 to 20Yrs">10 to 20Yrs</option>
									<option value="Above 20Yrs">Above 20Yrs</option>
								</select>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Qualification</div>
							<div class="dat col-lg-8">
								<input type="text" name="formqualification"
									class="form-qualification form-control" id="formqualification"
									value="<%=trainerdetails.getQualification()%>" required>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Phone Number</div>
							<div class="dat col-lg-8">
								<input type="text" name="formphone"
									class="form-phone form-control" id="formphone"
									value="<%=trainerdetails.getPhoneno()%>" required>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Expertise</div>
							<div class="dat col-lg-8">
								<select name="formexpertise" id="formexpertise"
									class="form-control required" required>
									<option value="<%=trainerdetails.getExpertise()%>"><%=trainerdetails.getExpertise()%></option>
									<optgroup label="Yoga">
										<option value="Yoga for health">Yoga for health</option>
										<option value="Weight Loss">Weight Loss</option>
										<option value="Kids Yoga">Kids Yoga</option>
										<option value="Pregnancy Yoga">Pregnancy Yoga</option>
										<option value="Meditation">Meditation</option>
									</optgroup>
									<optgroup label="Dance Group">
										<option value="Tomcat v7.0 Server at localhost">Dance</option>
										<option value="Zumba">Zumba</option>
									</optgroup>
									<option value="Weight / Body weight Workout">Weight /
										Body weight Workout</option>
									<option value="Nutrition">Nutrition</option>
								</select>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">About Trainer</div>
							<div class="dat col-lg-8">
								<textarea class="form-control" id="formaboutself"
									name="formaboutself" placeholder="About Yourself.." required><%=trainerdetails.getAboutyourself()%></textarea>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4"></div>
							<div class="dat col-lg-8">
								<button type="submit" class="btn btn-primary"
									name="updatebutton" id="updatebutton">
									<i class="fa fa-edit blue-color "></i>&nbsp Update
								</button>
							</div>
						</div>
					</form>
					<div id="updatesuccess"></div>
					<h3 class="mth3">Certificates</h3>
					<%
						if (trainerdetails.getCertificate1filename().length() > 3
										|| trainerdetails.getCertificate2filename().length() > 3
										|| trainerdetails.getCertificate3filename().length() > 3) {
					%>
					<%
						if (trainerdetails.getCertificate1filename().length() > 3) {
					%>
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<%=trainerdetails.getCertificate1filename()%>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-12">
								<!-- 							<button class="btn certificate1view btn-info ">View</button> -->
								<a class="downloadReport btn btn-warning" target="_blank"
									href="http://localhost:8080/Yoga/AdminCertificate1DownloadServlet?user=<%=trainerdetails.getEmail()%>,<%=trainerdetails.getCertificate1filename()%>"><i
									class="fa fa-download blue-color "></i>&nbspDownload</a>
								<button class="btn certificate1-update-btn btn-primary">
									<i class="fa fa-edit blue-color "></i>&nbsp Update
								</button>
							</div>
						</div>
						<form class="trainerprofilecertificate1update" role="form"
							enctype="multipart/form-data"
							action="TrainerProfileCertificates1UpdateServlet"
							id="trainerprofilecertificate1update"
							name="trainerprofilecertificate1update" method="post">
							<div class="row certificate1update hide">
								<div class="col-lg-8 col-md-8 col-sm-12">
									<div
										class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
										style="">
										<input name="form-certificate1-update"
											id="form-certificate1-update" type="file"
											class="form-control border-0 photo-trigger-button"> <label
											id="form-certificate1-update-lbl"
											for="form-certificate1-update"
											class="font-weight-light text-muted photo-trigger-button-label">Choose
											file</label>
										<div class="input-group-append">
											<label for="form-certificate1-update"
												class="btn btn-light m-0 rounded-pill px-4"> <i
												class="fas fa-image fa-lg mr-2 text-muted"></i> <small
												class="text-uppercase font-weight-bold text-muted">Browse</small>
											</label>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12">
									<button type="submit" class="btn cert1-upload-btn btn-info">
										<i class="fa fa-upload blue-color "></i>&nbsp Upload
									</button>
								</div>
							</div>
						</form>
					</div>
					<%
						}
					%>

					<%
						if (trainerdetails.getCertificate2filename().length() > 3) {
					%>
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<%=trainerdetails.getCertificate2filename()%>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">

								<!-- 							<button class="btn certificate1view btn-info ">View</button> -->
								<a class="downloadReport btn btn-warning" target="_blank"
									href="http://localhost:8080/Yoga/AdminCertificate2DownloadServlet?user=<%=trainerdetails.getEmail()%>,<%=trainerdetails.getCertificate2filename()%>"><i
									class="fa fa-download blue-color "></i>&nbspDownload</a>
								<button class="btn certificate2-update-btn btn-primary">
									<i class="fa fa-edit blue-color "></i>&nbsp Update
								</button>
							</div>
						</div>
						<form class="trainerprofilecertificate2update" role="form"
							enctype="multipart/form-data"
							action="TrainerProfileCertificates2UpdateServlet"
							id="trainerprofilecertificate2update"
							name="trainerprofilecertificate2update" method="post">
							<div class="row certificate2update hide">
								<div class="col-lg-8 col-md-8 col-sm-12">
									<div
										class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
										style="">
										<input name="form-certificate2-update"
											id="form-certificate2-update" type="file"
											class="form-control border-0 photo-trigger-button"> <label
											id="form-certificate2-update-lbl"
											for="form-certificate2-update"
											class="font-weight-light text-muted photo-trigger-button-label">Choose
											file</label>
										<div class="input-group-append">
											<label for="form-certificate2-update"
												class="btn btn-light m-0 rounded-pill px-4"> <i
												class="fas fa-image fa-lg mr-2 text-muted"></i> <small
												class="text-uppercase font-weight-bold text-muted">Browse</small>
											</label>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12">
									<button class="btn cert2-upload-btn btn-info">
										<i class="fa fa-upload blue-color "></i>&nbsp Upload
									</button>
								</div>
							</div>
						</form>
					</div>
					<%
						}
					%>

					<%
						if (trainerdetails.getCertificate3filename().length() > 3) {
					%>
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-12">
								<%=trainerdetails.getCertificate3filename()%>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12">

								<!-- 	<button class="btn certificate3view btn-info ">View</button> -->
								<a class="downloadReport btn btn-warning" target="_blank"
									href="http://localhost:8080/Yoga/AdminCertificate3DownloadServlet?user=<%=trainerdetails.getEmail()%>,<%=trainerdetails.getCertificate3filename()%>"><i
									class="fa fa-download blue-color "></i>&nbspDownload</a>
								<button type="submit"
									class="btn certificate3-update-btn btn-primary">
									<i class="fa fa-edit blue-color "></i>&nbsp Update
								</button>
							</div>
						</div>
						<form class="trainerprofilecertificate3update" role="form"
							enctype="multipart/form-data"
							action="TrainerProfileCertificates3UpdateServlet"
							id="trainerprofilecertificate3update"
							name="trainerprofilecertificate3update" method="post">
							<div class="row certificate3update hide">
								<div class="col-lg-8 col-md-8 col-sm-12">
									<div
										class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
										style="">
										<input name="form-certificate3-update"
											id="form-certificate3-update" type="file"
											class="form-control border-0 photo-trigger-button"> <label
											id="form-certificate3-update-lbl"
											for="form-certificate3-update"
											class="font-weight-light text-muted photo-trigger-button-label">Choose
											file</label>
										<div class="input-group-append">
											<label for="form-certificate3-update"
												class="btn btn-light m-0 rounded-pill px-4"> <i
												class="fas fa-image fa-lg mr-2 text-muted"></i> <small
												class="text-uppercase font-weight-bold text-muted">Browse</small>
											</label>
										</div>
									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-12">
									<button type="submit" class="btn cert3-upload-btn btn-info">
										<i class="fa fa-upload blue-color "></i>&nbsp Upload
									</button>
								</div>
							</div>
						</form>
					</div>
					<%
						}
					%>
					<div class="form-group">
						<div class="row">
							<button class="btn add-cert-field-btn ">
								<u>Add/Modify Certificates</u>
							</button>
						</div>
					</div>
					<div class="extra-add-certificates">
						<form class="trainerprofileextracertificates" role="form"
							enctype="multipart/form-data"
							action="TrainerProfileExtraCertificatesaddServlet"
							id="trainerprofileextracertificates"
							name="trainerprofileextracertificates" method="post">
							<div class="form-group">
								<strong>Upload Certificates</strong>
								<div class="row">
									<div class="col-9">
										<div
											class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
											style="">
											<input name="form-certificate1-extra"
												id="form-certificate1-extra" type="file"
												class="form-control border-0 photo-trigger-button">
											<label id="form-certificate1-extra-lbl"
												for="form-certificate1-extra"
												class="font-weight-light text-muted photo-trigger-button-label">Choose
												file</label>
											<div class="input-group-append">
												<label for="form-certificate1-extra"
													class="btn btn-light m-0 rounded-pill px-4"> <i
													class="fas fa-image fa-lg mr-2 text-muted"></i> <small
													class="text-uppercase font-weight-bold text-muted">Browse</small>
												</label>
											</div>
										</div>
									</div>
									<div class="col-3">
										<button type="button" id="addcertificate1"
											class="unstyled-button"
											style="background-color: grey; color: white; width: 40px; height: 40px; border-radius: 50%;">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button>

									</div>
								</div>
								<div class="row form-certificate2-field ">
									<div class="col-9">
										<div
											class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
											style="">
											<input name="form-certificate2-extra"
												id="form-certificate2-extra" type="file"
												class="form-control border-0 photo-trigger-button">
											<label id="form-certificate2-extra-lbl"
												for="form-certificate2-extra"
												class="font-weight-light text-muted photo-trigger-button-label">Choose
												file</label>
											<div class="input-group-append">
												<label for="form-certificate2-extra"
													class="btn btn-light m-0 rounded-pill px-4"> <i
													class="fas fa-image fa-lg mr-2 text-muted"></i> <small
													class="text-uppercase font-weight-bold text-muted">Browse</small>
												</label>
											</div>
										</div>
									</div>
									<div class="col-3">
										<button type="button" id="addcertificate2"
											class="unstyled-button"
											style="background-color: Grey; color: white; width: 40px; height: 40px; border-radius: 50%;">
											<i class="fa fa-plus" aria-hidden="true"></i>
										</button>
									</div>
								</div>
								<div class="row form-certificate3-field">
									<div class="col-9">
										<div
											class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
											style="">
											<input name="form-certificate3-extra"
												id="form-certificate3-extra" type="file"
												class="form-control border-0 photo-trigger-button">
											<label id="form-certificate3-extra-lbl"
												for="form-certificate3-extra"
												class="font-weight-light text-muted photo-trigger-button-label">Choose
												file</label>
											<div class="input-group-append">
												<label for="form-certificate3-extra"
													class="btn btn-light m-0 rounded-pill px-4"> <i
													class="fas fa-image fa-lg mr-2 text-muted"></i> <small
													class="text-uppercase font-weight-bold text-muted">Browse</small>
												</label>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<button type="submit"
										class="btn certificatesall-upload-btn btn-info">
										<i class="fa fa-upload blue-color "></i>&nbsp Upload
									</button>
								</div>
							</div>
						</form>
					</div>


					<%
						} else {
					%>
					<form class="trainerprofileaddcertificates" role="form"
						enctype="multipart/form-data"
						action="TrainerProfileCertificatesUpdateServlet"
						id="trainerprofileaddcertificates"
						name="trainerprofileaddcertificates" method="post">
						<div class="form-group">
							<strong>Upload Certificates</strong>

							<div class="row">
								<div class="col-9">
									<div
										class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
										style="">
										<input name="form-certificate1-add" id="form-certificate1-add"
											type="file"
											class="form-control border-0 photo-trigger-button"> <label
											id="form-certificate1-add-lbl" for="form-certificate1-add"
											class="font-weight-light text-muted photo-trigger-button-label">Choose
											file</label>
										<div class="input-group-append">
											<label for="form-certificate1-add"
												class="btn btn-light m-0 rounded-pill px-4"> <i
												class="fas fa-image fa-lg mr-2 text-muted"></i> <small
												class="text-uppercase font-weight-bold text-muted">Browse</small>
											</label>
										</div>
									</div>
								</div>
								<div class="col-3">
									<button type="button" id="addcertificate1"
										class="unstyled-button"
										style="background-color: grey; color: white; width: 40px; height: 40px; border-radius: 50%;">
										<i class="fa fa-plus" aria-hidden="true"></i>
									</button>

								</div>
							</div>
							<div class="row form-certificate2-field ">
								<div class="col-9">
									<div
										class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
										style="">
										<input name="form-certificate2-add" id="form-certificate2-add"
											type="file"
											class="form-control border-0 photo-trigger-button"> <label
											id="form-certificate2-add-lbl" for="form-certificate2-add"
											class="font-weight-light text-muted photo-trigger-button-label">Choose
											file</label>
										<div class="input-group-append">
											<label for="form-certificate2-add"
												class="btn btn-light m-0 rounded-pill px-4"> <i
												class="fas fa-image fa-lg mr-2 text-muted"></i> <small
												class="text-uppercase font-weight-bold text-muted">Browse</small>
											</label>
										</div>
									</div>
								</div>
								<div class="col-3">
									<button type="button" id="addcertificate2"
										class="unstyled-button"
										style="background-color: Grey; color: white; width: 40px; height: 40px; border-radius: 50%;">
										<i class="fa fa-plus" aria-hidden="true"></i>
									</button>
								</div>
							</div>
							<div class="row form-certificate3-field">
								<div class="col-9">
									<div
										class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"
										style="">
										<input name="form-certificate3-add" id="form-certificate3-add"
											type="file"
											class="form-control border-0 photo-trigger-button"> <label
											id="form-certificate3-add-lbl" for="form-certificate3-add"
											class="font-weight-light text-muted photo-trigger-button-label">Choose
											file</label>
										<div class="input-group-append">
											<label for="form-certificate3-add"
												class="btn btn-light m-0 rounded-pill px-4"> <i
												class="fas fa-image fa-lg mr-2 text-muted"></i> <small
												class="text-uppercase font-weight-bold text-muted">Browse</small>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<button type="submit"
									class="btn certificatesall-upload-btn btn-info">
									<i class="fa fa-upload blue-color "></i>&nbsp Upload
								</button>
							</div>
						</div>
					</form>
					<%
						}
					%>
				</div>

				<div
					class="col-lg-4 col-md-5 leftgh flex-column flex-halign-center flex-valign-center">

					<a onclick="document.getElementById('id01').style.display='block'"
						href="#" title="Profile Picture Update" data-toggle="popover"
						data-placement="bottom">
						<div class="bh-img">
							<img id="profile-image-element" alt="">
							<!-- 	<span class="glyphicon glyphicon-camera"></span>  -->
						</div>
					</a>




					<!-- 					<div id="id02" class="modal modal-new" > -->
					<!-- 						<form class="modal-content content-new" role="form" -->
					<!-- 							enctype="multipart/form-data" -->
					<!-- 							action="TrainerProfilePicUpdateServlet" -->
					<!-- 							id="trainerprofilepictureupdate" -->
					<!-- 							name="trainerprofilepictureupdate" method="post"> -->
					<!-- 							<div class="container"> -->
					<!-- 								<h3 class="text-center">Update Profile Picture</h3> -->
					<!-- 								<h6>Please Select Update Picture !</h6>	 -->

					<!-- 										<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style=""> -->
					<!-- 								<input name="formimage" id="formimage" type="file"  -->
					<!-- 									class="form-control border-0 photo-trigger-button" -->
					<!-- 									accept=".jpg, .png, .jpeg, .gif, .tif, .tiff" onchange="preview_image(event)"> -->
					<!-- 								<label id="formimage-lbl" for="formimage" -->
					<!-- 									class="font-weight-light text-muted photo-trigger-button-label">Choose -->
					<!-- 									file</label> -->
					<!-- 								<div class="input-group-append"> -->
					<!-- 									<label for="formimage" -->
					<!-- 										class="btn btn-light m-0 rounded-pill px-4 "> -->
					<!-- 										<i class="fas fa-image fa-lg mr-2 text-muted"></i> -->
					<!-- 										<small class="text-uppercase font-weight-bold text-muted">Browse</small> -->
					<!-- 									</label> -->
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 								<div class="bh-img " > -->
					<!-- 									<img id="output_image" class="text-center"/> -->
					<!-- 								</div> -->

					<!-- 								<br> -->
					<!-- 								<div class="clearfix"> -->
					<!-- 									<button type="button" -->
					<!-- 										onclick="document.getElementById('id01').style.display='none'" -->
					<!-- 										class="cancelbtn">Cancel</button> -->
					<!-- 									<button type="submit" -->
					<!-- 										onclick="document.getElementById('id01').style.display='none'" -->
					<!-- 										class="deletebtn">Save</button> -->
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 						</form> -->

					<!-- 					</div> -->
					<script type="text/javascript">
	$('.form-certificate2-field').hide();
	$('.form-certificate3-field').hide();
	$('.extra-add-certificates').hide();
	
	$(".certificate1-update-btn").click(function() {
		$('.certificate1update').toggle();	
		$('.cert1-upload-li').toggle();
	});
	$(".certificate2-update-btn").click(function() {
		$('.certificate2update').toggle();	
		
	});
	$(".certificate3-update-btn").click(function() {
		$('.certificate3update').toggle();	
	});
	$("#addcertificate1").click(function() {
		$('.form-certificate2-field').toggle();
		
	});
	$("#addcertificate2").click(function() {
		$('.form-certificate3-field').toggle();
	});
	$(".add-cert-field-btn").click(function() {
		$('.extra-add-certificates').toggle();	
		
	});
	</script>
					<script type="text/javascript">
$(document).ready(function() {
	console.log("page ready..");
	$("#trainerprofilepictureupdate").on('submit',function(event){
		event.preventDefault();
	//	var f=$(this).serialize();
	let f=new FormData(this);
		console.log(f);
		$.ajax({
			url: "TrainerProfilePicUpdateServlet",
			data : f,
			type : "POST",
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("success");
				if(data.trim() === 'Updated Successfully'){
					document.location.href = './TrainerProfile';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerProfile';
				}
			},
			error: function(data,textStatus,errorThrown){
				console.log(data);
				console.log("error");				
			},
			processData : false,
			contentType : false
		});
	});
});
</script>
					<script type="text/javascript">
$(document).ready(function() {	
	$("#trainerprofileaddcertificates").on('submit',function(event){
		event.preventDefault();
	//	var f=$(this).serialize();
	let f=new FormData(this);
		console.log(f);
		alert("certificate add");
		$.ajax({
			url: "TrainerProfileCertificatesUpdateServlet",
			data : f,
			type : "POST",
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("success");
				if(data.trim() === 'Updated Successfully'){
					document.location.href = './TrainerProfile';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerProfile';
				}
			},
			error: function(data,textStatus,errorThrown){
				console.log(data);
				console.log("error");				
			},
			processData : false,
			contentType : false
		}); 
	});
});
</script>
					<script type="text/javascript">
$(document).ready(function() {	
	$("#trainerprofileextracertificates").on('submit',function(event){
		event.preventDefault();
	//	var f=$(this).serialize();
	let f=new FormData(this);
		console.log(f);
		alert("certificate extra");
		$.ajax({
			url: "TrainerProfileExtraCertificatesaddServlet",
			data : f,
			type : "POST",
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("success");
				if(data.trim() === 'Updated Successfully'){
					document.location.href = './TrainerProfile';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerProfile';
				}
			},
			error: function(data,textStatus,errorThrown){
				console.log(data);
				console.log("error");				
			},
			processData : false,
			contentType : false
		}); 
	});
});
</script>
					<script type="text/javascript">
$(document).ready(function() {	
	$("#trainerprofilecertificate1update").on('submit',function(event){
		event.preventDefault();
	//	var f=$(this).serialize();
	let f=new FormData(this);
		console.log(f);
		alert("certificate1 update");
		$.ajax({
			url: "TrainerProfileCertificates1UpdateServlet",
			data : f,
			type : "POST",
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("success");
				if(data.trim() === 'Updated Successfully'){
					document.location.href = './TrainerProfile';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerProfile';
				}
			},
			error: function(data,textStatus,errorThrown){
				console.log(data);
				console.log("error");				
			},
			processData : false,
			contentType : false
		}); 
	});
});
</script>
					<script type="text/javascript">
$(document).ready(function() {	
	$("#trainerprofilecertificate2update").on('submit',function(event){
		event.preventDefault();
	//	var f=$(this).serialize();
	let f=new FormData(this);
		console.log(f);
		alert("certificate2 update");
		$.ajax({
			url: "TrainerProfileCertificates2UpdateServlet",
			data : f,
			type : "POST",
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("success");
				if(data.trim() === 'Updated Successfully'){
					document.location.href = './TrainerProfile';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerProfile';
				}
			},
			error: function(data,textStatus,errorThrown){
				console.log(data);
				console.log("error");				
			},
			processData : false,
			contentType : false
		}); 
	});
});
</script>
					<script type="text/javascript">
$(document).ready(function() {	
	$("#trainerprofilecertificate3update").on('submit',function(event){
		event.preventDefault();
	//	var f=$(this).serialize();
	let f=new FormData(this);
		console.log(f);
		alert("certificate 3 update");
		$.ajax({
			url: "TrainerProfileCertificates3UpdateServlet",
			data : f,
			type : "POST",
			success: function(data,textStatus,jqXHR){
				console.log(data);
				console.log("success");
				if(data.trim() === 'Updated Successfully'){
					document.location.href = './TrainerProfile';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerProfile';
				}
			},
			error: function(data,textStatus,errorThrown){
				console.log(data);
				console.log("error");				
			},
			processData : false,
			contentType : false
		}); 
	});
});
</script>

					<script type='text/javascript'>
		function preview_image(event) {
			var reader = new FileReader();
			reader.onload = function() {
				var output = document.getElementById('output_image');
				output.src = reader.result;
			}
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
					<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

					<div class="name-det">
						<h2><%=trainerdetails.getName()%></h2>
						<h3>Contact</h3>

						<p><%=trainerdetails.getEmail()%>
							<br>
						</p>
						<%
							}
							}
						%>
						<form id="trainerppchangepassword" name="trainerppchangepassword">
							<p>
								<button class="btn btn-info trainerchangepassword">
									<i class="fa fa-key" aria-hidden="true"></i>&nbspChange
									Password
								</button>
							</p>
							<div id="changepasswordhide">
								<p>
									<input type="password" name="formcurrentpassword"
										placeholder="Current Password.."
										class="form-currentpassword form-control"
										id="formcurrentpassword" required>
								</p>

								<p>
									<input type="password" name="formnewpassword"
										placeholder="New Password.."
										class="form-newpassword form-control" id="formnewpassword"
										required>
								</p>

								<p>
									<input type="password" name="formconfirmpassword"
										placeholder="Confirm Password.."
										class="form-confirmpassword form-control"
										id="formconfirmpassword" required>
								</p>
								<button type="button" class="btn btn-primary"
									name="changepasswordbutton" id="changepasswordbutton">Change</button>

							</div>
							<div id="success"></div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#trainerppchangepassword").validate({
				rules : {
					formcurrentpassword : {
						required : true,
						minlength : 6
					},

					formnewpassword : {
						required : true,
						minlength : 6
					},
					formconfirmpassword : {
						required : true,
						equalTo : "#formnewpassword"
					}
				},
				messages : {
					formcurrentpassword : {
						required : "please enter password",
						minlength : "Password min 6 characters"
					},
					formnewpassword : {
						required : "please enter password",
						minlength : "Password min 6 characters"
					},
					formconfirmpassword : {
						required : "please enter confirm password",
						equalTo : "password doesn match"
					}
				}
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#editprofilehide').hide();
			$('#changepasswordhide').hide();
			$('#updatebutton').hide();
			$('#formimage').hide();

			$(".trainereditprofile").click(function() {
				$('#editprofilehide').toggle();
			});
			$(".trainerchangepassword").click(function() {
				$('#changepasswordhide').toggle();
			});
			$(".editprofileicon").click(function() {
				$('#updatebutton').toggle();
			});
		});
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#changepasswordbutton")
									.click(
											function() {

												event.preventDefault();
												var currentpass = $(
														'#formcurrentpassword')
														.val();
												var newpass = $(
														'#formnewpassword')
														.val();
												var confirmpass = $(
														'#formconfirmpassword')
														.val();

												$
														.ajax({
															url : "TrainersChangePasswordServlet",
															type : "POST",
															data : {
																currentpassword : currentpass,
																newpassword : newpass,
																confirmpassword : confirmpass
															},
															cache : false,

															success : function(
																	data) {

																$('#success')
																		.html(
																				"<div class='alert alert-success'>");
																$(
																		'#success > .alert-success')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#success > .alert-success')
																		.append(
																				"<strong>"
																						+ data
																						+ ". </strong>");
																$(
																		'#success > .alert-success')
																		.append(
																				'</div>');
																$(
																		'#changepasswordhide')
																		.hide();
															},
															error : function() {
																$('#success')
																		.html(
																				"<div class='alert alert-danger'>");
																$(
																		'#success > .alert-danger')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#success > .alert-danger')
																		.append(
																				$(
																						"<strong>")
																						.text(
																								"Sorry "
																										+ name
																										+ ", update failed. Please try again later!"));
																$(
																		'#success > .alert-danger')
																		.append(
																				'</div>');

															}

														});

											});
						});
	</script>

	<!-- About End -->

	<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->

	<a href="#" class="back-to-top"> <i class="fa fa-chevron-up"></i>
	</a>



</body>
</html>
