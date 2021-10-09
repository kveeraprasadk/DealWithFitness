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

	self.dispatch = function(filterByExpertise) {
		const requestPayload = {
			jsonResponse: true
		}
		if (filterByExpertise) {
			requestPayload.filterByExpertise = filterByExpertise;
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

	self.loginEvent = function() {
		var emailId = $('#login-traineeemailid').val();
		var pass = $('#login-traineepassword').val();
		if (emailId == null || emailId.trim().length == 0) {
			self.validationError(LOGIN_ERROR_MSG_ID, "Email is mandatory");
			return;
		}
		if (pass == null || pass.trim().length == 0) {
			self.validationError(LOGIN_ERROR_MSG_ID, "Password is mandatory");
			return;
		}
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
				if (whoami.isUserLoggedIn() && whoami.isTrainee()) {
					// User already logged in
					self.submitTraineeBooking();
				} else {
					self.showLoginDialogEvent();
				}

			})
		}
	}

	self.filterTrainers = function(event) {
		progressBar.start();
		if (event.target.value && event.target.value != "all") {
			self.dispatch(event.target.value);
		} else {
			self.dispatch();
		}
	}

	self.renderTrainers = function(trainers) {
		const templeteForEmptySeries = document.getElementById("Trainer-details-template-empty");
		const templeteForSeries = document.getElementById("Trainer-details-template");
		const htmlSeriesTemplate = templeteForSeries.innerHTML;
		const parentId = templeteForSeries.getAttribute("targetId");
		const parent = $("#" + parentId);
		parent.html("");

		for (const trainer of trainers) {
			let dataNode;
			if (trainer.series && trainer.series.length > 0) {
				dataNode = Utils.fillTemplate(htmlSeriesTemplate, [trainer]);
				for (const series of trainer.series) {
					series.attendee = "hide";
					series.zeroAttendeesClass = "hide";
					if (series.attendees) {
						series.attendeeCount = series.attendees.length;
						series.zeroAttendeesClass = series.attendees.length > 0 ? "": "hide";
						// If currently logged in user is part of scheduled training then show checkbox otherwise hide it
						if (series.attendees.includes(whoami.getUser())) {
							series.attendee = "show";
						}
					}
					// Convert the series information to a recurrence rule
					Utils.addRecurrenceRule(series);
					dataNode = Utils.fillTemplate(htmlSeriesTemplate, [trainer, series]);
					parent.append(dataNode);
				}
			} else {
				dataNode = Utils.fillTemplate(templeteForEmptySeries.innerHTML, [trainer]);
				parent.append(dataNode);
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
			self.validationError(REG_ERROR_MSG_ID, "Trainee Email is mandatory");
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