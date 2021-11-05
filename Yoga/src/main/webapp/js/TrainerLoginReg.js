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
												required : "Please Enter Username11",
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
