"use strict"

function TraineeBookings() {
	const self = this;
	self.whoami = new Whoami();

	self.init = function() {
		progressBar.start();
		// Check if user already logged in otherwise redirect to index.jsp where trinee can login
		self.whoami.detect(() => {
			if (self.whoami.isUserLoggedIn()) {
				self.dispatch();
			} else {
				document.location.href = "index.jsp";
			}
		});
	}
	
	self.switchView = function(view) {
		if(view == "bookings") {
			document.location.href = "traineelandingpage.jsp";
		} else {
			document.location.href = "TraineeProfile";
		}
		
	}

	self.dispatch = function() {
		$.ajax({
			url: "traineeBookings",
			type: "GET",
			data: {
				traineeId: self.whoami.getUser()
			},
			cache: false,
			success: function(data) {
				const template = document.getElementById("booking-fragment");
				const parentId = template.getAttribute("targetId");

				if (data && data.length > 0) {
					// Now add each training into container
					const parent = $("#" + parentId);
					$(parent).html("");
					const templateHtml = template.innerHTML;
					let traineeSchedules = 0;
					// We get triness trainings details by trainer that this trainee trained for
					for (const trainerDetails of data) {
						const scheduleSeries = trainerDetails.series;
						for (const traineeBookedSchedule of scheduleSeries) {
							Utils.addRecurrenceRule(traineeBookedSchedule);
							const bookingFragment = Utils.fillTemplate(templateHtml, [traineeBookedSchedule, trainerDetails]);
							parent.append(bookingFragment);
							traineeSchedules++;
						}
					}
					// Show number of training user signed up for
					$("#trainee-course-count").text(traineeSchedules);
				} else {
					$("#" + parentId).html("");
					$("#no-trainings-message").css("display", "block")
					$("#trainee-course-count").text(0);
				}
			},
			error: function(error, more) {
				console.error(error, more)
				alertDialog.show("Service Failure", "Failed to get trainers data ");
			},
			complete: () => progressBar.end()
		});
	}

	self.deleteScheduleEvent = function(event) {
		const seriesId = event.target.getAttribute("seriesId");
		const title = event.target.getAttribute("title")

		if (self.whoami.isUserLoggedIn()) {
			confirmDialog.show("Would you like to delete the training schedule \"" + title+"\"", () => {
				progressBar.start();
				if (self.whoami.isUserLoggedIn()) {
					$.ajax({
						url: "traineeBookings?traineeId=" + self.whoami.getUser() + "&seriesId=" + seriesId,
						type: "DELETE",
						cache: false,
						success: function() {
							console.log("Schedule deleted");
							self.dispatch();
						},
						error: function(error, more) {
							console.error(error, more)
							alertDialog.show("Service Failure", "Failed to delete trainee schedule ");
						},
						complete: () => progressBar.end()
					});
				}
			})
		} else {
			// Not logged in send to index page
			document.location.href = "index.jsp";
		}
	}
}

window.trainee = new TraineeBookings();