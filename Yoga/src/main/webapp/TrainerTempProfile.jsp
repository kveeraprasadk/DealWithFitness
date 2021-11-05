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
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
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
<style type="text/css">
.error {
	color: #FF0000 !important;
}
</style>
    </head>

    <body >
   
        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="index.jsp" class="navbar-brand">Dealwithfitness<span></span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                  <!--      <a href="index.jsp" class="nav-item nav-link ">Home</a>
                        <a href="About.jsp" class="nav-item nav-link">About</a>                        
                        <a href="Trainer.jsp" class="nav-item nav-link">Trainer</a>
                   -->       
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
                    <h3 class="mth3">Profile</h3>
                    <div class="right">
						<button class="btn btn-info editprofileicon">
							<i class="fa fa-edit blue-color " ></i>
							<span style="font-size: 14px">Edit Profile</span>
						</button>
					</div>
					<input type="hidden" id="trainer-profile-base64-encoded-element"
						value="${trainerprofilephoto }" />
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
                    
                    <ul class="exrts">
                        <li>${trainercertificatefileName1}</li>
                        <li></li>
                        <li>${trainercertificatefileName2}</li>
                        <li></li>
                        <li>${trainercertificatefileName3}</li>
                        <li></li>
                    </ul>
                    
                </div>
               <div
					class="col-lg-4 col-md-5 leftgh flex-column flex-halign-center flex-valign-center">

                    <div class="img-box">
                         <img src="profile/images/gallery/gallery_12.jpg" alt="">   
                    </div>
<!--                     <div class="bh-img"> -->
<!-- 							<img id="profile-image-element" alt=""> -->
<!-- 					</div> -->
                    <div class="name-det">                        
                   
                     <h2><div class="tname"></div></h2>
                     
                     <h3>Contact</h3>
                     
                     <p><b>${trainername}</b> <br>
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
