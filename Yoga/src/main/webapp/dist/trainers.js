/**
 * 
 */

function Trainers() {
	self = this;

	self.init = function() {
		progressBar.start();
		self.dispatch();
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
alert("trainer");
			},
			error: function(error, more) {
				console.error(error, more)
				alertDialog.show("Service Failure", "Failed to get trainers data ");
			},
			complete: () => progressBar.end()
		});
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
				dataNode = self.template(htmlSeriesTemplate, [trainer]);
				for (const series of trainer.series) {
					// Convert the series information to a recurrence rule
					self.addRecurrenceRule(series);
					dataNode = self.template(htmlSeriesTemplate, [trainer, series]);
					parent.append(dataNode);
				}
			} else {
				dataNode = self.template(templeteForEmptySeries.innerHTML, [trainer]);
				parent.append(dataNode);
			}

		}
		// This is to add listener to view profile button
		$(document).on(
			"click",
			".profiledata",
			function() {
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

	self.template = function(htmlTemplate, dataList) {
		return htmlTemplate.replace(
			/{([^{}]+)}/g, // or /{(\w*)}/g for "{this} instead of %this%"
			function(m, key) {
				for (const data of dataList) {
					if (data[key]) {
						return data[key];
					}
				}
				return "";
			}
		);
	}

	self.addRecurrenceRule = function(seriesDetails) {
		const start = moment(seriesDetails.startTime).format("MMMM DD, YYYY");
		const sTimeOnly = moment(seriesDetails.startTime).format("hh:mm A");
		const eTimeOnly = moment(seriesDetails.endTime).format("hh:mm A");
		const end = moment(seriesDetails.endByDate).format("MMMM DD, YYYY");
		if (seriesDetails.selectedDayNames && seriesDetails.selectedDayNames.length > 0) {
			seriesDetails.schedule = "Occurs every " + seriesDetails.selectedDayNames.join(", ") + " effective " + start +
				" until " + end + " from " + sTimeOnly + " to " + eTimeOnly;
		} else {
			seriesDetails.schedule = start + " " + sTimeOnly + " - " + eTimeOnly;
		}
	}
}



window.trainers = new Trainers();