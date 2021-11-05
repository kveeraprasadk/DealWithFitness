/**
 * 
 */

		
	
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
														document.location.href = './TrainerProfile';
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
		

	