"use strict"

const REG_ERROR_MSG_ID = "reg-validation-error";
const LOGIN_ERROR_MSG_ID = "login-validation-error";

function Trainers() {
	self = this;
	self.selectedTrainerSeriesId = null;

	self.init = function() {
		progressBar.start();
		whoami.detect(() => {
			self.positionUserOptions();
			self.dispatch();
			self.attachLoginActions();
		})
		// Add timings options with timezone offset
		const timezoneOffset = "GMT" + self.clientTzOffset();
		$("#form-filter-misc").append("<option value='04:00:00 11:59'>Morning 04:00 AM to 11:59 AM " + timezoneOffset + "</option>");
		$("#form-filter-misc").append("<option value='12:00:00 16:59'>Afternoon 12:00 PM to 04:59 PM " + timezoneOffset + "</option>");
		$("#form-filter-misc").append("<option value='17:00:00 23:59'>Evening 05:00 PM to 11:59	PM " + timezoneOffset + "</option>");
		$("#form-filter-misc").append("<option value='00:00:00 03:59'>Night 12:00 AM to 03:59 AM " + timezoneOffset + "</option>");
	}

	self.positionUserOptions = function() {
		if (whoami.isTrainee() || !whoami.isUserLoggedIn()) {
			// If user logged in the only mybookings should be visible otherwise sign in and sign up
			if (whoami.isUserLoggedIn()) {
				$("#trainee-ac-bookings").css("display", "inline-block");
				$("#existing-trinee-signin").css("display", "none");
				$("#new-trainee-ac-create").css("display", "none");
			} else {
				$("#trainee-ac-bookings").css("display", "none");
				$("#existing-trinee-signin").css("display", "inline-block");
				$("#new-trainee-ac-create").css("display", "inline-block");
			}
		}
	}

	self.dispatch = function(queryRequest) {
		const requestPayload = {
			jsonResponse: true
		}

		if (queryRequest) {
			if (queryRequest.expertise) {
				requestPayload.filterByExpertise = queryRequest.expertise;
			}
			if (queryRequest.startTime) {
				requestPayload.startTime = queryRequest.startTime;
				requestPayload.endTime = queryRequest.endTime
				requestPayload.tzOffset = queryRequest.tzOffset
			}
			requestPayload.sort = queryRequest.sort;
		} else {
			requestPayload.sort = "desc";		// default when loaded first time by user
		}

		$.ajax({
			url: "TrainersListServlet",
			type: "GET",
			data: requestPayload,
			cache: false,
			success: function(data) {
				self.renderTrainers(data);
			},
			error: function(error, more) {
				console.error(error, more)
				alertDialog.show("Service Failure", "Failed to get trainers data ");
			},
			complete: () => progressBar.end()
		});
	}

	self.attachLoginActions = function() {
		$("#register-trainee-dialog-parent").keydown((e) => {
			if (e.keyCode == 13) {
				e.preventDefault();
				self.storeNewTraineeEvent();
			}
		});
		$("#trainee-login-container-parent").keydown((e) => {
			if (e.keyCode == 13) {
				e.preventDefault();
				self.loginEvent()
			}
		});
		$('#login-trainee-action').click(self.loginEvent);
	}

	self.validateLogin = function(emailId, pass) {
		if (emailId == null || emailId.trim().length == 0) {
			self.validationError(LOGIN_ERROR_MSG_ID, "Email id is mandatory");
			return false;
		} else if (!Utils.validateEmail(emailId)) {
			self.validationError(LOGIN_ERROR_MSG_ID, "Email id is invalid");
			return false;
		}
		if (pass == null || pass.trim().length == 0) {
			self.validationError(LOGIN_ERROR_MSG_ID, "Password is mandatory");
			return false;
		}
		return true;
	}

	self.loginEvent = function() {
		var emailId = $('#login-traineeemailid').val();
		var pass = $('#login-traineepassword').val();
		if (self.validateLogin(emailId, pass)) {
			// Validations are done push the payload to backend
			$.ajax({
				url: "TraineeClassLoginPayment",
				type: "GET",
				data: {
					email: emailId,
					password: pass
				},
				cache: false,
				success: function(data) {
					if (data == "Login Success") {
						if (self.selectedTrainerSeriesId) {
							whoami.bindUser(emailId);
							// as the login is successful hence redirect to trainee booking page
							self.submitTraineeBooking();
						} else {
							self.showMyBookingsEvent();
						}
					} else {
						alertDialog.show("Authentication Failed", data);
					}
				},
				error: function(data) {
					alertDialog.show("Service Failure", data.statusText);
				}
			});
		}
	}

	// Triggerd by book button in the trainers list
	self.bookScheduleEvent = function(event) {
		// Store the series id and trainer details before asking login
		const button = event.target;
		const trainerId = button.getAttribute("trainerId")
		const seriesId = button.getAttribute("seriesId")
		const title = button.getAttribute("title");

		if (button.getAttribute("attendee") === "show") {
			alertDialog.show("Information", "You are already attending this trianing.")
		} else {
			confirmDialog.show("Would you like to book training class \"" + title + "\"", () => {
				self.selectedTrainerSeriesId = {
					trainerId: trainerId,
					seriesId: seriesId
				}
				setTimeout(() => {
					if (whoami.isUserLoggedIn() && whoami.isTrainee()) {
						// User already logged in
						self.submitTraineeBooking();
					} else {
						self.showLoginDialogEvent();
					}

				}, 500);
			})
		}
	}

	self.sortTrainersList = function(event) {
		progressBar.start();
		let request = {};

		const timingsSelection = $("#form-filter-misc").val();
		const expertise = $("#form-expertise").val();

		if (timingsSelection != "all") {
			request = self.getTimings(timingsSelection);
		}

		if (expertise != "all") {
			request.expertise = expertise
		}

		request.sort = event.target.value;
		console.log("Querying: ", request);
		self.dispatch(request);
	}

	self.filterTrainers = function(event) {
		progressBar.start();
		let request = {};

		const timingsSelection = $("#form-filter-misc").val();
		if (timingsSelection != "all") {
			request = self.getTimings(timingsSelection);
		}

		if (event.target.value && event.target.value != "all") {
			request.expertise = event.target.value
		}
		request.sort = $("#form-sortby").val()

		self.dispatch(request);
		console.log("Querying: ", request);
	}

	self.filterByMisc = function(event) {
		progressBar.start();
		const expertise = $("#form-expertise").val();
		let request = {};

		if (event.target.value && event.target.value != "all") {
			request = self.getTimings(event.target.value);
		}

		if (expertise && expertise != "all") {
			request.expertise = expertise;
		}
		request.sort = $("#form-sortby").val()

		console.log("Querying: ", request);
		self.dispatch(request);
	}

	self.getTimings = function(value) {
		let offset = self.clientTzOffset();
		const values = value.split(" ");
		const startTime = moment("2021-01-01 " + values[0], "YYYY-MM-DD HH:mm:ss").format("YYYY-MM-DD HH:mm:00") + offset;
		const endTime = (moment("2021-01-01 " + values[1], "YYYY-MM-DD HH:mm:ss").format("YYYY-MM-DD HH:mm:00")) + offset;
		return {
			startTime: startTime,
			endTime: endTime,
			tzOffset: offset,
		};
	}

	self.clientTzOffset = function() {
		let offset = new Date().getTimezoneOffset();
		const timeInMins = Math.abs(offset);
		return (offset < 0 ? "+" : "-") + ("00" + Math.floor(timeInMins / 60)).slice(-2) + ":" + ("00" + (timeInMins % 60)).slice(-2);
	}

	self.renderTrainers = function(trainers) {
		const templeteForEmptySeries = document.getElementById("Trainer-details-template-empty");
		const templeteForSeries = document.getElementById("Trainer-details-template");
		const htmlSeriesTemplate = templeteForSeries.innerHTML;
		const parentId = templeteForSeries.getAttribute("targetId");
		const parentHtmlNode = $("#" + parentId);
		parentHtmlNode.html("");

		for (const series of trainers) {
			let childHtmlNode;
			const trainer = series.trainer;
			// If series id is there means then trainer will have series otherwise empty
			if (series.id) {
				series.attendeeClass = "hide";
				series.zeroAttendeesClass = "hide";
				if (series.attendees) {
					series.attendeeCount = series.attendees.length;
					series.zeroAttendeesClass = series.attendees.length > 0 ? "" : "hide";
					// If currently logged in user is part of scheduled training then show checkbox otherwise hide it
					if (series.attendees.includes(whoami.getUser())) {
						series.attendee = "show";
					}
				}
				// Convert the series information to a recurrence rule
				Utils.addRecurrenceRule(series);
				childHtmlNode = Utils.fillTemplate(htmlSeriesTemplate, [trainer, series]);
				parentHtmlNode.append(childHtmlNode);
			} else {
				childHtmlNode = Utils.fillTemplate(templeteForEmptySeries.innerHTML, [trainer]);
				parentHtmlNode.append(childHtmlNode);
			}
		}

		// This is to add listener to view profile button
		$(document).on(
			"click",
			".profiledata", //".home-trainer-list-a",
			function(event) {
				var useremail = $(this).val();
				$.get("TrainerDetailsView", {
					trainersemail: useremail
				}, function(responseText) {
					console.log(responseText);
					var globalarray = [];
					globalarray.push(responseText);
					window.localStorage.setItem("globalarray", JSON
						.stringify(globalarray));
					document.location.href = './trainerdetails.jsp';
				});
			});

	}

	self.submitTraineeBooking = function() {
		// if user is not logged in due to some reason call comes here then we show
		// login dialog as a response otherwise service takes the user to user landing page (booking page)
		if (whoami.isUserLoggedIn()) {
			if (self.selectedTrainerSeriesId) {
				document.location.href = './TraineecofirmTrainer?traineremailid='
					+ self.selectedTrainerSeriesId.trainerId
					+ '&seriesId='
					+ self.selectedTrainerSeriesId.seriesId +
					"&traineeEmailId=" + whoami.getUser();
			}
			$("#trainee-login-dialog").modal("hide");
		} else {
			// This scnerio should not happen, just for safer side we are handling this.
			self.showLoginDialogEvent();
		}
	}

	self.showMyBookingsEvent = function() {
		document.location.href = "traineelandingpage.jsp";
	}

	self.showLoginDialogEvent = function() {
		$("#login-traineeemailid").val("");
		$("#login-traineepassword").val("");
		$("#login-validation-error").hide();

		$("#trainee-login-dialog").modal("show");
		setTimeout(() => {
			$("#login-traineeemailid").focus()
		}, 500);
	}

	self.showRegisterDialogFromLoginEvent = function() {
		$("#trainee-login-dialog").modal("hide");
		setTimeout(() => {
			self.showRegisterDialogEvent();
		}, 500);
	}

	self.showRegisterDialogEvent = function() {
		$("#register-traineeFullname").val("");
		$("#register-traineeemailid").val("");
		$("#register-traineepassword").val("");
		$("#register-traineeconfirmpassword").val("");
		$("#register-traineephone").val("");
		// Hide the error message
		$("#reg-validation-error").hide();

		$("#register-trainee-dialog").modal("show");
		setTimeout(() => {
			$("#register-traineeFullname").focus()
		}, 500);
	}

	self.storeNewTraineeEvent = function() {
		if (self.validateRegistration()) {
			progressBar.start();
			$.ajax({
				url: "TraineeRegisterServlet",
				type: "POST",
				data: {
					name: $("#register-traineeFullname").val(),
					username: $("#register-traineeemailid").val(),
					password: $("#register-traineepassword").val(),
					mobileNumber: $("#register-traineephone").val()
				},
				cache: false,
				success: function(data) {
					console.log(data);
					if (data == "Email exists") {
						self.validationError(REG_ERROR_MSG_ID, "Trainee email: " + $("#register-traineeemailid").val()
							+ " already exists, please choose anyother email.", true);
						$("#register-traineeemailid").focus();
					} else {
						$("#register-trainee-dialog").modal("hide");
						setTimeout(() => {
							alertDialog.show("Confirmantion", "Account created successfully, please use Sign In to login into your account");
						}, 50)
					}
				},
				error: function(error, more) {
					console.error(error, more)
					alertDialog.show("Service Failure", "Failed to get trainers data ");
				},
				complete: () => progressBar.end()
			});

		}
	}

	self.validateRegistration = function() {
		const name = $("#register-traineeFullname").val();
		const email = $("#register-traineeemailid").val();
		const pass = $("#register-traineepassword").val();
		const cpass = $("#register-traineeconfirmpassword").val();
		const phone = $("#register-traineephone").val();

		if (name == null || name.trim().length == 0) {
			self.validationError(REG_ERROR_MSG_ID, "Trainee name is mandatory");
			$("#register-traineeFullname").focus();
			return false;
		}
		if (email == null || email.trim().length == 0) {
			self.validationError(REG_ERROR_MSG_ID, "Trainee Email id is mandatory");
			$("#register-traineeemailid").focus();
			return false;
		} else if (!Utils.validateEmail(email)) {
			self.validationError(REG_ERROR_MSG_ID, "Trainee Email id is invalid");
			$("#register-traineeemailid").focus();
			return false;
		}
		if (phone && phone.trim().length < 10) {
			self.validationError(REG_ERROR_MSG_ID, "Monile number should be atleast 10 digits");
			$("#register-traineephone").focus();
			return false;
		}
		if (pass == null || pass.trim().length == 0) {
			self.validationError(REG_ERROR_MSG_ID, "Password is mandatory");
			$("#register-traineepassword").focus();
			return false;
		} else if (pass && pass.trim().length < 6) {
			self.validationError(REG_ERROR_MSG_ID, "Password should be minmum of 6 digits");
			$("#register-traineepassword").focus();
			return false;
		}
		if (cpass == null || cpass.trim().length == 0) {
			self.validationError(REG_ERROR_MSG_ID, "Confirm password is mandatory");
			$("#register-traineeconfirmpassword").focus();
			return false;
		}
		if (pass != cpass) {
			self.validationError(REG_ERROR_MSG_ID, "Password and Confirm password not matching.");
			$("#register-traineepassword").focus();
			return false;
		}
		$("#reg-validation-error").hide();
		return true;
	}

	self.validationError = function(messageElementId, message) {
		$("#" + messageElementId).text(message);
		$("#" + messageElementId).show();
	}
}

window.trainers = new Trainers();