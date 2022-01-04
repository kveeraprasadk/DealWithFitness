/**
 * 
 */




$(document)
		.ready(
				function() {
					$('#trainerloginform')
							.validate(
									{
										rules : {
											username : {
												required : true,
												email : true
											},

											password : {
												required : true,
												minlength : 6
											}
										},
										messages : {
											username : {
												required : "Please Enter Username",
												email : "Please Enter Valid email"
											},
											password : {
												required : "Please Enter Password",
												minlength : "Please Enter Min 6 chars"
											}
										},

										submitHandler : function(form) {

											var username = $('#username').val();
											var password = $('#password').val();

											$
													.ajax({
														url : "TrainerLoginServlet",
														type : "GET",
														data : {
															username : username,
															password : password
														},
														cache : false,
														success : function(data) {
															console.log(data);
															if (data == "Login Success") {
																document.location.href = './TrainerProfile';
															} else if (data == "Trainer Temp Login Success") {
																document.location.href = './TrainerTempProfileshowing';

															} else {
																$('#regsuccess')
																		.html(
																				"<div class='alert alert-danger'>");
																$(
																		'#regsuccess > .alert-danger')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#regsuccess > .alert-danger')
																		.append(
																				$(
																						"<strong>")
																						.text(
																								data));
																$(
																		'#regsuccess > .alert-danger')
																		.append(
																				'</div>');
															}
														},
														error : function(data) {
															$('#regsuccess').html("<div class='alert alert-danger'>");
															$('#regsuccess > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																	.append("</button>");
															$('#regsuccess > .alert-danger')
																	.append($("<strong>").text(data));
															$('#regsuccess > .alert-danger').append('</div>');

														}

													});

											return false;
										}
									});
				});





$(document)
		.ready(
				function() {
					$('.forgot-progressbar').hide();
					$('#trainerforgotform')
							.validate(
									{

										rules : {
											formforgotusername : {
												required : true,
												email : true
											}

											
										},
										messages : {
											formforgotusername : {
												required : "Please Enter Username",
												email : "Please Enter Valid email"
											}
										},

										submitHandler : function(form) {

											var username = $(
													'#formforgotusername').val();
											$('.forgot-progressbar').show();
											$
													.ajax({
														url : "TrainerForgotPasswordServlet",
														type : "Post",
														data : {
															username : username
															
														},
														cache : false,
														success : function(
																data) {
															console
																	.log(data);
															$('.forgot-progressbar').hide();
															if (data == "NewPassword Sent") {
																
																$(
																		'#forgotsuccess')
																		.html(
																				"<div class='alert alert-success'>");
																$(
																		'#forgotsuccess > .alert-success')
																		.html(
																				"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																		.append(
																				"</button>");
																$(
																		'#forgotsuccess > .alert-success')
																		.append(
																				$(
																						"<strong>")
																						.text(
																								data));
																$(
																		'#forgotsuccess > .alert-success')
																		.append(
																				'</div>');
															}else if(data == "New Password Creation Failed" || "Plz enter Registered EmailId"){
																$(
																'#forgotsuccess')
																.html(
																		"<div class='alert alert-danger'>");
														$(
																'#forgotsuccess > .alert-danger')
																.html(
																		"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																.append(
																		"</button>");
														$(
																'#forgotsuccess > .alert-danger')
																.append(
																		$(
																				"<strong>")
																				.text(
																						data));
														$(
																'#forgotsuccess > .alert-danger')
																.append(
																		'</div>');

															}
														},
														error : function(
																data) {
															$(
																	'#forgotsuccess')
																	.html(
																			"<div class='alert alert-danger'>");
															$(
																	'#forgotsuccess > .alert-danger')
																	.html(
																			"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																	.append(
																			"</button>");
															$(
																	'#forgotsuccess > .alert-danger')
																	.append(
																			$(
																					"<strong>")
																					.text(
																							data));
															$(
																	'#forgotsuccess > .alert-danger')
																	.append(
																			'</div>');

														}

													});
											return false;
										}
									});
				});




$(document)
.ready(
		function() {
			
			$('#trainerregform')
					.validate(
							{

								rules : {
									formfirstname : {
										required : true,
										minlength : 3,
										alphaNum : true

									},
									formemail : {
										required : true,
										email : true
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
									formpassword : {
										required : true,
										minlength : 6
									},
									formcpassword : {
										required : true,
										equalTo : "#form-password"
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
									formemail : {
										required : "Please Enter Email",
										email : "The email should be in the format: abc@domain.tld"
									},
									formexpertise1 : {
										required : "Please select Expertise"
									},
									formexperience : {
										required : "Please select Experience"
									},
									formclasslevel1 : {
										required : "Please enter Classlevel"
									},
									formqualification : {
										required : "Please enter Qualification",
										minlength : "Qualification should be at least 2 characters"
									},
									formphone : {
										required : "Please enter phone number",
										minlength : "Phone Number must be 10 numbers",
										maxlength : "Phone Number must be 10 numbers"
									},									
									formpassword : {
										required : "please enter password",
										minlength : "Password min 6 characters"
									},
									formcpassword : {
										required : "please enter confirm password",
										equalTo : "password doesn match"
									},
									formaboutself : {
										required : "please enter about yourself",
										minlength : "Please enter atleast 50 chars"
									}

								},

								submitHandler : function(form) {

									var name = $('#form-first-name').val();
									var email = $('#form-email').val();
									var experience = $('#form-experience').val();
									var qualification = $('#form-qualification').val();
									var expertise = $('#form-expertise1').val();
									var phone = $('#form-phone').val();
									var password = $('#form-password').val();
									var about = $('#form-aboutself').val();
									
									$
											.ajax({
												url: "TrainerRegisterServlet",
												type : "Post",
												data : {
													name : name,
													email : email,
													experience : experience,
													qualification : qualification,
													expertise : expertise,
													phone : phone,
													password : password,
													about : about
													
												},
												cache : false,
												success: function(data,textStatus,jqXHR){
													console.log(data);
													console.log("success");
													if(data.trim() === 'Temporary Profile Created Successfully'){
														document.location.href = './TrainerTempProfile.jsp';					
													}else{
														alert("first enter");
														$('#regerror').html("<div class='alert alert-danger'>");
														$('#regerror > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
																						   .append("</button>");
														$('#regerror > .alert-danger').append($("<strong>").text(data));
														$('#regerror > .alert-danger').append('</div>');
														

													}
												},
												error: function(data,textStatus,errorThrown){
													console.log(data);
													console.log("error");				
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
