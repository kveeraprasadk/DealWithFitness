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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<link rel="shortcut icon" href="profile/images/fav.jpg">
<link rel="stylesheet" href="profile/css/bootstrap.min.css">
<link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css" href="profile/css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />

<!-- Template Stylesheet -->
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.validate.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.validate.min.js"></script>
	
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

	<script src="profile/js/jquery-3.2.1.min.js"></script>
	<script src="profile/js/popper.min.js"></script>
	<script src="profile/js/bootstrap.min.js"></script>
	<script src="profile/js/script.js"></script>

<link href="css/style.css" rel="stylesheet">
<script src="./dist/whoami.js"></script>
<script src="./dist/cities.js"></script>
<style type="text/css">
.unstyled-button {
	border: none;
	padding: 0;
	background: none;
}

.error {
	color: #FF0000 !important;
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

<body onLoad="LoadingTrainersProfileData()">
	<script type="text/javascript">
		function LoadingTrainersProfileData() {
			whoami.detect();
			$
					.ajax({
						type : 'GET',
						url : "${pageContext.request.contextPath}/TraineeProfileViewServlet",
					});
		}
	</script>

	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<!-- Nav Bar End -->


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
								<a href="javascript:">
								<i class="fa fa-file pr" style="font-size: 23px"></i>My Profile</a>
							</p>

						</div>
					</div>
					</div> 
				</div>
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
			<%
				ArrayList<TrainerDetailsVO> trainees = (ArrayList<TrainerDetailsVO>) request
						.getAttribute("traineeProfileData");
			%>


			<%
				// Iterating through subjectList
				if (trainees != null && trainees.size() > 0) // Null check for the object
				{
					Iterator<TrainerDetailsVO> iterator = trainees.iterator(); // Iterator interface
					int inv = 0;
					for (TrainerDetailsVO traineedetails : trainees) // iterate through all the data until the last record
					{
						//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
						inv++;
						//	System.out.println("My Investor: "+ traineedetails.getName());
			%>
			<div class="row">
				<div class="col-lg-8 col-md-7 detail-px no-padding">
					
						<h3 class="mth3">Profile</h3>
							<p><span style="background-color: #FFFF00"><strong>! Important :</strong> Please Update your profile with following
							fields for better services.</span></p>
							<div class="right">
								<button class="btn btn-info editprofileicon">
									<i class="fa fa-edit blue-color "></i> <span
										style="font-size: 14px">Edit Profile</span>
								</button>
							</div>
			<form role="form" name=traineeupdateform " id="traineeupdateform">
						<div class="fx-ro">
							<div class="dat col-lg-4">Trainee Email</div>
							<div class="dat col-lg-8">
							<b><%=traineedetails.getEmail()%></b>								
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Trainee Name</div>
							<div class="dat col-lg-8">
								<input type="text" name="formname"
									class="form-name form-control" id="form-name"
									value="<%=traineedetails.getName()%>" required>
							</div>
						</div>
						

						<div class="fx-ro">
							<div class="dat col-lg-4">DoB</div>
							<div class="dat col-lg-8">
								<input type="date" name="formdob" class="form-dob form-control"
									id="form-dob" value="<%=traineedetails.getDob()%>" required>
							</div>
						</div>

						<div class="fx-ro">
							<div class="dat col-lg-4">Expectation from Class</div>
							<div class="dat col-lg-8">
								<!-- 		<input type="text" name="form-target"
								class="form-target form-control" id="form-target"
								value="" required>    -->

								<textarea class="form-control" id="form-target"
									name="formtarget" placeholder="class target.."
									onKeyDown="limitText(this.form.formtarget,this.form.countdown,50);"
									onKeyUp="limitText(this.form.formtarget,this.form.countdown,50);"
									required><%=traineedetails.getTarget()%></textarea>
								<font size="2">(Maximum characters: 50) You have <input
									readonly type="text" class="projdesc unstyled-button"
									name="countdown" size="1" value="50"> characters left.
								</font>

							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Any Ailment</div>
							<div class="dat col-lg-8">
								<input type="text" name="formailment"
									class="form-ailment form-control" id="form-ailment"
									value="<%=traineedetails.getAnyailment()%>" required>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">Phone</div>
							<div class="dat col-lg-8">
								<input type="text" name="formphone"
									class="form-phone form-control" id="form-phone"
									value="<%=traineedetails.getPhone()%>" required>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">State</div>
							<div class="dat col-lg-8">
								<select id="form-state" name="formstate" class="form-control"
									required>
									<option value="<%=traineedetails.getState()%>"><%=traineedetails.getState()%></option>
									<option value="Andaman & Nicobar">Andaman & Nicobar</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chandigarh">Chandigarh</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Dadra & Nagar Haveli">Dadra & Nagar
										Haveli</option>
									<option value="Daman & Diu">Daman & Diu</option>
									<option value="Delhi">Delhi</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jammu & Kashmir">Jammu & Kashmir</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Lakshadweep">Lakshadweep</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Orissa">Orissa</option>
									<option value="Pondicherry">Pondicherry</option>
									<option value="Punjab">Punjab</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttaranchal">Uttaranchal</option>
									<option value="West Bengal">West Bengal</option>


								</select>
							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4">City</div>
							<div class="dat col-lg-8">
								<input type="text" name="formcity"
									class="form-city form-control" id="form-city"
									value="<%=traineedetails.getCity()%>" required>


							</div>
						</div>
						<div class="fx-ro">
							<div class="dat col-lg-4"></div>
							<div class="dat col-lg-8">
								<button type="submit" class="btn btn-primary"
									id="traineeprofileupdate" name="traineeprofileupdate"><i class="fa fa-edit blue-color "></i>&nbspUpdate</button>
														
							</div>
						</div>
						<div id="updatesuccess"></div>
					</form>

					<h3>Trainers</h3>
					<!--          <ptraineedetails.getAboutyourself() %></p>     -->



				</div>
				<div class="col-lg-4 col-md-5 leftgh flex-column flex-halign-center flex-valign-center">
					<div class="img-box">
					<i class="fa fa-user user-container"></i>
<!-- 						<img src="profile/images/gallery/gallery_12.jpg" alt=""> -->
					</div>
					
					
					<div class="name-det">


						<h2><%=traineedetails.getName()%></h2>

						<h3>Contact</h3>						

						<p><%=traineedetails.getEmail()%>
							<br>
						</p>
						<%
							}
							}
						%>

						<form id="traineeppchangepassword" name="traineeppchangepassword">
							<p>
								<button class="btn btn-info trainerchangepassword"><i class="fa fa-key" aria-hidden="true"></i>&nbspChange
									Password</button>
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
								<p>
								<button type="button" class="btn btn-primary"
									name="changepasswordbutton" id="changepasswordbutton">Change</button>
								</p>

							</div>
							<div id="success"></div>
						</form>
						<p>
							<a href="index.jsp" class="btn btn-info">Book Your Online
								Fitness Classes</a>
						</p>
					</div>


				</div>
			</div>



		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#traineeupdateform")
									.validate(
											{
												rules : {													
													formname : {
														required : true,
														minlength : 3,
														alphaNum : true
													},	
													formdob : {
														required : true,
														minAge : 5,
														maxAge : 70
													},
													formtarget : {
														required : true
													},
													formailment : {
														required : true
													},													
													formphone : {
														required : true,
														minlength : 10,
														maxlength : 10,
														onlyNum : true
													},	
													formstate : {
														required : true
													},
													formstate : {
														required : true
													}
												},
												messages : {													
													formname : {
														required : "Please Enter name",
														minlength : "Name should be at least 3 characters"
													},	
													formdob : {
														required : "Please enter you date of birth.",
														minAge : "You must be at least 5 years old!",
														maxAge : "You must be below 70 years old!"
													},
													formtarget : {
														required : "Please Enter your target"														
													},
													formailment : {
														required : "Please Enter you have any ailment"														
													},
													formphone : {
														required : "Please enter phone number",
														minlength : "Phone Numbera must be 10 numbers",
														maxlength : "Phone Number must be 10 numbers"
													},	
													formstate : {
														required : "Please select your state"														
													},
													formcity : {
														required : "Please enter your city"														
													}
												},
												submitHandler : function(form) {
													
													event.preventDefault();
													var name = $("#form-name")
															.val();
// 													var email = $("#form-email")
// 															.val();
													var dob = $("#form-dob").val();
													var target = $("#form-target")
															.val();
													var ailment = $("#form-ailment")
															.val();
													var phone = $("#form-phone")
															.val();
													var state = $("#form-state")
															.val();
													var city = $("#form-city")
															.val();

													$
															.ajax({
																url : "TraineeProfileDetailsUpdateServlet",
																type : "POST",
																data : {
																	name : name,
															//		email : email,
																	dob : dob,
																	target : target,
																	ailment : ailment,
																	phone : phone,
																	state : state,
																	city : city

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
																	document.location.href = './TraineeProfile';

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
							$.validator.addMethod(
											"minAge",
											function(value, element, min) {
												var today = new Date();
												var birthDate = new Date(value);
												var age = today.getFullYear()
														- birthDate
																.getFullYear();

												if (age > min + 1) {
													return true;
												}

												var m = today.getMonth()
														- birthDate.getMonth();

												if (m < 0
														|| (m === 0 && today
																.getDate() < birthDate
																.getDate())) {
													age--;
												}

												return age >= min;
											}, "You are not old enough!");

							$.validator.addMethod("maxAge",
									function(value, element, max) {
										var today1 = new Date();
										var birthDate1 = new Date(value);
										var age1 = today1.getFullYear()
												- birthDate1.getFullYear();

										if (age1 < max + 1) {
											return true;
										}

										var m = today1.getMonth()
												- birthDate1.getMonth();

										if (m < 0
												|| (m === 0 && birthDate1
														.getDate() < today1
														.getDate())) {
											age1--;
										}

										return age1 <= max;
									}, "You are too old enough!");
							
							$.validator.addMethod("onlyNum", function(value,
									element) {
								return this.optional(element)
										|| value == value
												.match(/^[1-9]{1}[0-9]{9}$/);
							}, "Phone number only numbers");
							$.validator.addMethod("alphaNum", function(value,element) {
								return this.optional(element)
										|| value == value
												.match(/^[a-zA-Z\s]*$/);
							}, "please enter a valid name");
						});
	</script>
	<script language="javascript" type="text/javascript">
		function limitText(limitField, limitCount, limitNum) {
			if (limitField.value.length > limitNum) {
				limitField.value = limitField.value.substring(0, limitNum);
			} else {
				limitCount.value = limitNum - limitField.value.length;
			}
		}
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#traineeppchangepassword").validate({
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
			$('.classlevelhide').hide();
			$('.schedulehide').hide();
			$('#traineeprofileupdate').hide();

			$(".trainerchangepassword").click(function() {
				$('#changepasswordhide').toggle();
			});
			$(".classhide").click(function() {
				$('.classlevelhide').show();
				$('.schedulehide').show();
			});
			$(".editprofileicon").click(function() {
				$('#traineeprofileupdate').toggle();
			});

		});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#traineeprofileupdate")
									.click(
											function() {

												

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
															url : "TraineesChangePasswordServlet",
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
