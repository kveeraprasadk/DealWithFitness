$(function() {

	$("#contactForm input, #contactForm textarea")
			.jqBootstrapValidation(
					{
						preventSubmit : true,
						submitError : function($form, event, errors) {
						},
						submitSuccess : function($form, event) {
							event.preventDefault();
							var name = $("input#name").val();
							var email = $("input#email").val();
							var subject = $("input#subject").val();

							var message = $("textarea#message").val();

							$this = $("#sendMessageButton");
							$this.prop("disabled", true);

							$
									.ajax({
										url : "ContactServlet",
										type : "POST",
										data : {
											name : name,
											email : email,
											subject : subject,
											message : message
										},
										cache : false,
										success : function() {
											alert("success");
											$('#success')
													.html(
															"<div class='alert alert-success'>");
											$('#success > .alert-success')
													.html(
															"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
													.append("</button>");
											$('#success > .alert-success')
													.append(
															"<strong>Feedback Sent </strong>");
											$('#success > .alert-success')
													.append('</div>');
											$('#contactForm').trigger("reset");
										},
										error : function() {
											$('#success')
													.html(
															"<div class='alert alert-danger'>");
											$('#success > .alert-danger')
													.html(
															"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
													.append("</button>");
											$('#success > .alert-danger')
													.append(
															$("<strong>")
																	.text(
																			"Sorry "
																					+ name
																					+ ", Feedback Sent failed. Please try again later!"));
											$('#success > .alert-danger')
													.append('</div>');
											$('#contactForm').trigger("reset");
										},
										complete : function() {
											setTimeout(function() {
												$this.prop("disabled", false);
											}, 1000);
										}
									});
						},
						filter : function() {
							return $(this).is(":visible");
						},
					});

	$("a[data-toggle=\"tab\"]").click(function(e) {
		e.preventDefault();
		$(this).tab("show");
	});
});

$('#name').focus(function() {
	$('#success').html('');
});

$(document).on("click", "#sendMessage", function() { // When HTML DOM "click"
														// event is invoked on
														// element with ID
														// "somebutton", execute
														// the following
														// function...

	var name = $('#name').val();
	var email = $('#email').val();
	var sub = $('#subject').val();
	var msg = $('#message').val();

	$.post("ContactServlet", {
		name : name,
		email : email,
		subject : sub,
		message : msg

	}, function(responseText) { // Execute Ajax GET request on URL of
								// "someservlet" and execute the following
								// function with Ajax response text...
		if (responseText == "Register Success") {

			$('#reqsentsuccmsg').text(responseText);
			$("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
				$("#success-alert").slideUp(500);
			});

		} else {

			$('#reqsentfailmsg').text("Request Sent Failed");
			$("#danger-alert").fadeTo(2000, 500).slideUp(500, function() {
				$("#danger-alert").slideUp(500);
			});

		}

	});
});
