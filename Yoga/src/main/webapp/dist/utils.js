function Utils() {
	const self = this;

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

	self.combineDateTime = function(dateInputId, timeInputId) {
		const dt = moment(document.getElementById(dateInputId).value).format("YYYY-MM-DD");
		const tm = document.getElementById(timeInputId).value;
		return moment(dt + "" + tm, "YYYY-MM-DD HH:mm").toDate();
	}

	self.formatDate = function(date) {
		var d = date.getDate();
		var m = date.getMonth() + 1;
		var y = date.getFullYear();
		return '' + y + '-' + (m <= 9 ? '0' + m : m) + '-' + (d <= 9 ? '0' + d : d);
	}

	self.formatTime = function(date) {
		return moment(date).format("HH:mm:ss");
	}

	self.fillTemplate = function(htmlTemplate, dataList) {
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
}

window.Utils = new Utils();

//window.onerror = error => alertDialog.show("Script Error", "Script execution failed with errors");