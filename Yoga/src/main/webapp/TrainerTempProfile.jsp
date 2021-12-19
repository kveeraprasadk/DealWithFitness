<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.*" %>
<%@page import="main.model.TrainerDetailsVO" %>
<%@ page isELIgnored="false" %>
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
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
		
		 <link rel="shortcut icon" href="profile/images/fav.jpg">
    <link rel="stylesheet" href="profile/css/bootstrap.min.css">
    <link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="profile/css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <!-- jQuery library -->
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"
	defer></script>   
	<!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
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
  <script src="./dist/whoami.js"></script>     
        <!-- Template Stylesheet -->
<script src="./dist/external/tui-code-snippet.min.js"></script>
<script src="./dist/external/moment.min.js"></script>
<script src="./dist/external/tui-calendar.min.js"></script>
<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/trainer-booking.js"></script>

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
<link href="css/common.css" rel="stylesheet">

        <script type="text/javascript">
	var calendarInitialized = false;	

	function renderTrainerProfile() {
		
		whoami.detect(()=> {
			const image = $("#trainer-profile-base64-encoded-element").val();
			if (image) {
				console.log("Profile picture present")
				$("#profile-image-element").attr("src",
						"data:image/*;base64," + image);
			} else {
				$('.trainer-default-profile').show();
				$("#profile-image-element").hide();
				console.log("No profile picture");
			}		
		})
	}
</script>


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
/* The Modal (background) */
.modal-new {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 395px;
  top: 90px;
  width: 40%; /* Full width */
  height: 90%; /* Full height */

  padding-top: 50px;
}
/* Modal Content/Box */
.content-new {
 /* background-color: #828282;  */
    background-color: #d9edf7;
  margin: 2% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888; 
  width: 80%; /* Full width */
  height: 90%; /* Full height */
}
/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
	float: left;
	width: 50%;
}

/* Add a color to the cancel button */
.cancelbtn {
	background-color: #ccc;
	color: black;
}

/* Add a color to the delete button */
.deletebtn {
/*	background-color: #f44336; */
	background-color: 	#4169E1;
}



/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The Modal Close Button (x) */
.close {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: red;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

.unstyled-button {
	border: none;
	padding: 0;
	background: none;
}
/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .deletebtn {
		width: 100%;
	}
}
</style>
    </head>

    <body onLoad="renderTrainerProfile()">
   
        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="index.jsp" class="navbar-brand">Dealwithfitness<span></span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                 
                         <a href="./TrainerLogoutServlet" class="nav-item nav-link">Logout</a>
                        
                        
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
<!--                     <div class="col-12"> -->
                       
<!--                         <a href="">Trainers Profile</a> -->
<!--                     </div> -->
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- About Start -->
        <div class="container-fluid overcover">
        <div class="container profile-box">
           <div class="cover-image row">
      <!--           <img src="profile/images/bloogs-6.jpg" alt="">  --> 
           </div>
            
			
			
            <div class="row">
                <div class="col-lg-8 col-md-7 detail-px no-padding">
                   
                   <p><span style="background-color: #FFFF00"><strong>! Important :</strong> This is one time profile login. Just now you register to DealWithFitness, Admin will provide your Access ID's as soon as possible.</span></p>
                   <p><span style="background-color: #FFFF00">1. Please Upload your profile picture.</span></p>
                   <p><span style="background-color: #FFFF00">2. Please Upload your Yoga related certificates.</span></p>
                    <h3 class="mth3">Profile</h3>
                    <div class="right">
						<button class="btn btn-primary editprofileicon">
							<i class="fa fa-edit blue-color " ></i>
							<span style="font-size: 14px">Edit Profile</span>
						</button>
					</div>
					<input type="hidden" id="trainer-profile-base64-encoded-element"
						value="${trainerprofilepic }" />
						
					<form role="form" id="trainerprofileupdateform" name="trainerprofileupdateform" class="trainerprofileupdateform">
					<div class="fx-ro">
						<div class="dat col-lg-4">Trainer Email</div>
						<div class="dat col-lg-8">
							<b>${traineremail}</b>
						</div>
					</div>
                    <div class="fx-ro">
						<div class="dat col-lg-4">Trainer Name</div>
						<div class="dat col-lg-8">
						<input type="text" name="formname"
									class="form-name form-control" id="formname"
									value="${trainername}" required>
						</div>
					</div>
                    <div class="fx-ro">
						<div class="dat col-lg-4">Experience</div>
						<div class="dat col-lg-8">
							<select name="formexperience" id="formexperience"
									class="form-control required" onfocus='this.size=5;'
									onblur='this.size=1;' onchange='this.size=1; this.blur();'
									required>
									<option value="${trainerexperience}">${trainerexperience}</option>
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
									value="${trainerqualification}" required>							
						</div>
					</div>
                    <div class="fx-ro">
						<div class="dat col-lg-4">Phone Number</div>
						<div class="dat col-lg-8">
							<input type="text" name="formphone"
									class="form-phone form-control" id="formphone"
									value="${trainerphone}" required>							
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4">Expertise</div>
						<div class="dat col-lg-8">
							<select name="formexpertise" id="formexpertise"
									class="form-control required" 
									required>
												<option value="${trainerexpertise}">${trainerexpertise}</option>
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
												<option value="Weight / Body weight Workout">Weight
													/ Body weight Workout</option>
												<option value="Nutrition">Nutrition</option>
								</select>						
						</div>
					</div>	
                    <div class="fx-ro">
						<div class="dat col-lg-4">About Trainer</div>
						<div class="dat col-lg-8">
							<textarea class="form-control" id="formaboutself"
									name="formaboutself" placeholder="About Yourself.." required>${traineraboutme}</textarea>							
						</div>
					</div>
					<div class="fx-ro">
						<div class="dat col-lg-4"></div>
						<div class="dat col-lg-8">
							<button type="submit" class="btn btn-primary"
									name="updatebutton" id="updatebutton"><i class="fa fa-edit blue-color " ></i>&nbsp Update</button>
						</div>
					</div>
					</form>
					<div id="updatesuccess"></div>
                   
                    
                    <h3 class="mth3">Certificates</h3>
                    <%
			ArrayList<TrainerDetailsVO> trainers = (ArrayList<TrainerDetailsVO>) request.getAttribute("TrainerProfileData");
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
							<a class="downloadReport btn btn-warning" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate1DownloadServlet?user=<%=trainerdetails.getEmail() %>,<%=trainerdetails.getCertificate1filename() %>"><i class="fa fa-download blue-color " ></i>&nbspDownload</a>
							<button class="btn certificate1-update-btn btn-primary"><i class="fa fa-edit blue-color " ></i>&nbsp Update</button>
                    </div>
                    </div>
                    <div class="row certificate1update hide">
						<div class="col-lg-8 col-md-8 col-sm-12">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="formcertificate1" id="formcertificate1" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="formcertificate1-lbl" for="formcertificate1"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="formcertificate1"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
						</div>
					    <div class="col-lg-4 col-md-4 col-sm-12">
							<button class="btn cert1-upload-btn btn-info"><i class="fa fa-upload blue-color " ></i>&nbsp Upload</button>	
						</div>
					</div> 
					         
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
							<a class="downloadReport btn btn-warning" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate2DownloadServlet?user=<%=trainerdetails.getEmail() %>,<%=trainerdetails.getCertificate2filename() %>"><i class="fa fa-download blue-color " ></i>&nbspDownload</a>
							<button class="btn certificate2-update-btn btn-primary"><i class="fa fa-edit blue-color " ></i>&nbsp Update</button>
                    </div>
                    </div>
                    <div class="row certificate2update hide">
						<div class="col-lg-8 col-md-8 col-sm-12">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="form-certificate2" id="form-certificate2" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="form-certificate2-lbl" for="form-certificate2"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="form-certificate2"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
						</div>
					    <div class="col-lg-4 col-md-4 col-sm-12">
							<button class="btn cert2-upload-btn btn-info"><i class="fa fa-upload blue-color " ></i>&nbsp Upload</button>	
						</div>
					</div>           
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
							<a class="downloadReport btn btn-warning" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate3DownloadServlet?user=<%=trainerdetails.getEmail() %>,<%=trainerdetails.getCertificate3filename() %>"><i class="fa fa-download blue-color " ></i>&nbspDownload</a>
							<button class="btn certificate3-update-btn btn-primary"><i class="fa fa-edit blue-color " ></i>&nbsp Update</button>
                    </div>
                    </div>                   	
                   
                    <div class="row certificate3update hide">
						<div class="col-lg-8 col-md-8 col-sm-12">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="form-certificate3" id="form-certificate3" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="form-certificate3-lbl" for="form-certificate3"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="form-certificate3"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
						</div>
					    <div class="col-lg-4 col-md-4 col-sm-12">
							<button class="btn cert3-upload-btn btn-info"><i class="fa fa-upload blue-color " ></i>&nbsp Upload</button>	
						</div>
					</div>           
                 </div>
                  <%
					}
					%> 
                 <div class="form-group">
                 <div class="row">
					<button class="btn add-cert-field-btn "><u>Add/Modify Certificates</u></button>
					</div> 
                 </div>
                 <div class="extra-add-certificates">
                 <div class="form-group">
											<strong>Upload Certificates</strong>
											<div class="row">
												<div class="col-9">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="formcertificate1" id="formcertificate1" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="formcertificate1-lbl" for="formcertificate1"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="formcertificate1"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
												</div>
												<div class="col-3">
													<button type="button" id="addcertificate1" class="unstyled-button"  style="background-color:grey;color:white;width:40px;
 														height:40px;border-radius: 50%;"><i class="fa fa-plus" aria-hidden="true"></i></button>												 
														
												</div>
											</div>
											<div class="row form-certificate2-field ">
												<div class="col-9">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="form-certificate2" id="form-certificate2" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="form-certificate2-lbl" for="form-certificate2"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="form-certificate2"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
												</div>
												<div class="col-3">
													<button type="button" id="addcertificate2" class="unstyled-button" style="background-color:Grey;color:white;width:40px;
														height:40px;border-radius: 50%;"><i class="fa fa-plus" aria-hidden="true"></i></button> 
												</div>
											</div>
											<div class="row form-certificate3-field">
												<div class="col-9">
														<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="form-certificate3" id="form-certificate3" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="form-certificate3-lbl" for="form-certificate3"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="form-certificate3"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
												</div>
											</div>
											<div class="row">
											<button class="btn certificatesall-upload-btn btn-info"><i class="fa fa-upload blue-color " ></i>&nbsp Upload</button>
											</div>
										</div>					
                 </div>
                  			
                    
              
                <%} }else{ %>
                										<div class="form-group">
											<strong>Upload Certificates</strong>
											<div class="row">
												<div class="col-9">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="formcertificate1" id="formcertificate1" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="formcertificate1-lbl" for="formcertificate1"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="formcertificate1"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
												</div>
												<div class="col-3">
													<button type="button" id="addcertificate1" class="unstyled-button"  style="background-color:grey;color:white;width:40px;
 														height:40px;border-radius: 50%;"><i class="fa fa-plus" aria-hidden="true"></i></button>												 
														
												</div>
											</div>
											<div class="row form-certificate2-field ">
												<div class="col-9">
								<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="form-certificate2" id="form-certificate2" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="form-certificate2-lbl" for="form-certificate2"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="form-certificate2"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
												</div>
												<div class="col-3">
													<button type="button" id="addcertificate2" class="unstyled-button" style="background-color:Grey;color:white;width:40px;
														height:40px;border-radius: 50%;"><i class="fa fa-plus" aria-hidden="true"></i></button> 
												</div>
											</div>
											<div class="row form-certificate3-field">
												<div class="col-9">
														<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="form-certificate3" id="form-certificate3" type="file" 
									class="form-control border-0 photo-trigger-button">
								<label id="form-certificate3-lbl" for="form-certificate3"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="form-certificate3"
										class="btn btn-light m-0 rounded-pill px-4">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
												</div>
											</div>
											<div class="row">
											<button class="btn certificatesall-upload-btn btn-info"><i class="fa fa-upload blue-color " ></i>&nbsp Upload</button>
											</div>
										</div>										
                <%} %>
                </div>
               <div
					class="col-lg-4 col-md-5 leftgh flex-column flex-halign-center flex-valign-center">

<!--                     <div class="img-box"> -->
<!--                          <img src="profile/images/gallery/gallery_12.jpg" alt="">    -->
<!--                     </div> -->
                    <a onclick="document.getElementById('id01').style.display='block'"
						href="#" title="Profile Picture Update" data-toggle="popover"
						data-placement="bottom">
                    <div class="bh-img">                    		
							<img id="profile-image-element" alt="">
							<i class="fa fa-user user-container trainer-default-profile hide"></i>
					</div>
					</a>
					
					<div id="id01" class="modal modal-new">
<!-- 						<span onclick="document.getElementById('id01').style.display='none'" -->
<!-- 							class="close" title="Close Modal">×</span> -->

						<form class="modal-content content-new" role="form"
							enctype="multipart/form-data"
							action="TrainerProfilePicUpdateServlet"
							id="trainerprofilepictureupdate"
							name="trainerprofilepictureupdate" method="post">
							<div class="container">
								<h3 class="text-center">Update Profile Picture</h3>
								<h6>Please Select Update Picture !</h6>
								
<!-- 									<input type="file" name="formimage" -->
<!-- 										class="form-image form-control" id="form-image" -->
<!-- 										accept="image/*" onchange="preview_image(event)"> -->
										<div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm"	style="">
								<input name="formimage" id="formimage" type="file" 
									class="form-control border-0 photo-trigger-button"
									accept=".jpg, .png, .jpeg, .gif, .tif, .tiff" onchange="preview_image(event)">
								<label id="formimage-lbl" for="formimage"
									class="font-weight-light text-muted photo-trigger-button-label">Choose
									file</label>
								<div class="input-group-append">
									<label for="formimage"
										class="btn btn-light m-0 rounded-pill px-4 ">
										<i class="fas fa-image fa-lg mr-2 text-muted"></i>
										<small class="text-uppercase font-weight-bold text-muted">Browse</small>
									</label>
								</div>
							</div>
								<div class="bh-img " >
									<img id="output_image" class="text-center"/>
								</div>
								
								<br>
								<div class="clearfix">
									<button type="button"
										onclick="document.getElementById('id01').style.display='none'"
										class="cancelbtn">Cancel</button>
									<button type="submit"
										onclick="document.getElementById('id01').style.display='none'"
										class="deletebtn">Save</button>
								</div>
							</div>
						</form>						
					</div>
					
					
                    <div class="name-det">                        
                   
                     <h2><div class="tname">
                     ${trainername}
                     </div></h2>
                     
                     <h3>Contact</h3>
                     
                     <p> 
                     <b>${traineremail}</b>
                     </p>
                     
                   
						<form id="trainerppchangepassword" name="trainerppchangepassword">
							<p>
								<button class="btn btn-info trainerchangepassword"><i class="fa fa-key" aria-hidden="true"></i>&nbspChange Password</button>
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
								<button type="button" class="btn btn-primary"  name="changepasswordbutton"
									id="changepasswordbutton">Change</button>

							</div>
							<div id="success"></div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
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
					document.location.href = './TrainerTempProfileView';
					
				}else{
					console.log(data); 
					document.location.href = './TrainerTempProfileView';
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
	$(document).ready(function() {
		
		$('#trainerprofileupdateform').validate(
						{
							rules : {
								formname : {
									required : true,
									minlength : 3,
									alphaNum : true
								},														
								formexpertise1 : {
									required : true
								},
								formexperience : {
									required : true
								},
								formqualification : {
									required : true,
									minlength : 2,
									alphaNum : true
								},
								formphone : {
									required : true,
									minlength : 10,
									maxlength : 10,
									onlyNum : true
								},													
								formaboutself : {
									required : true,
									minlength : 50
								}
							},
							messages : {
								formfirstname : {
									required : "Please Enter name",
									minlength : "Name should be at least 3 characters"
								},														
								formexpertise1 : {
									required : "Please select Expertise"
								},
								formexperience : {
									required : "Please select Experience"
								},													
								formqualification : {
									required : "Please enter Qualification",
									minlength : "Qualification should be at least 2 characters"
								},
								formphone : {
									required : "Please enter phone number",
									minlength : "Phone Numbera must be 10 numbers",
									maxlength : "Phone Number must be 10 numbers"
								},													
								'roles' : {
									required : "Plz Select Atleast One Option"
								},													
								formaboutself : {
									required : "please enter about yourself",
									minlength : "Please enter atleast 50 chars"
								}
							},
							
							submitHandler : function(form) {
								var name = $("#formname")
								.val();
						var exper = $(
								"#formexperience")
								.val();
						var qua = $(
								"#formqualification")
								.val();
						var phone = $("#formphone")
								.val();

						var exp = $("#formexpertise")
								.val();

						var message = $(
								"#formaboutself")
								.val();
						$
						.ajax({
							url : "TrainerProfileDetailsUpdateServlet",
							type : "POST",
							data : {
								name : name,
								experience : exper,
								qualification : qua,
								phone : phone,
								expertise : exp,
								aboutyourself : message
							},
							cache : false,

							success : function(
									data) {

								$(
										'#updatesuccess')
										.html(
												"<div class='alert alert-success'>");
								$(
										'#updatesuccess > .alert-success')
										.html(
												"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
										.append(
												"</button>");
								$(
										'#updatesuccess > .alert-success')
										.append(
												"<strong>"
														+ data
														+ ". </strong>");
								$(
										'#updatesuccess > .alert-success')
										.append(
												'</div>');
								$(
										'#editprofilehide')
										.hide();
								document.location.href = './TrainerTempProfileshowing';
							},
							error : function() {
								$(
										'#updatesuccess')
										.html(
												"<div class='alert alert-danger'>");
								$(
										'#updatesuccess > .alert-danger')
										.html(
												"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
										.append(
												"</button>");
								$(
										'#updatesuccess > .alert-danger')
										.append(
												$(
														"<strong>")
														.text(
																"Sorry "
																		+ name
																		+ ", update failed. Please try again later!"));
								$(
										'#updatesuccess > .alert-danger')
										.append(
												'</div>');

							}

						});
						return false;
							}		
							
							
						});
		
		$.validator.addMethod("alphaNum", function(value,element) {
			return this.optional(element)
					|| value == value
							.match(/^[a-zA-Z\s]*$/);
		}, "please enter a valid name");
		$.validator.addMethod("onlyNum", function(value,
				element) {
			return this.optional(element)
					|| value == value
							.match(/^[1-9]{1}[0-9]{9}$/);
		}, "Phone number must be 10 numbers");

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
															url : "TrainerTempChangePassword",
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

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        
    </body>
</html>
