"use strict"

const DAY_NAMES = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
const CALENDAR_ID = "taining-calendar";
const TIME_SLOT_MIN = 30 * 60 * 1000;
const TIME_SLOT_MAX = 5 * 60 * 60 * 1000;
const SCREEN_MIN_WIDTH = 600;
const TIME_SLOT_MAX_MESSAGE = "Your training length goes over 5 hours, You need adjusting End Time to limit training length within 5 hours.";
const TIME_SLOT_MIN_MESSAGE = "Your training length is less than 30 minutes. Minimum duration should be more than 30 minutes.";

function TrainerCalender() {
	const self = this;
	self.trainerId;
	self.calendar;
	self.scheduleEndTimePicker;
	//	self.calendarStartTime;
	//	self.calendarEndTime;
	//	self.calendarEndBy;

	self.state = {
		seriesRecurringSchedules: [],
		scheduleIdToSeriesIdMap: [],
		seriesIdInEditMode: null,
		isEditingSeriesInRecurrence: false,
		seriesIdInDeleteMode: null
	}

	self.init = function() {
		// If there is a change in the window size then set the calendar size accordingly
		window.addEventListener("resize", self.onWindowResizeEvent);

		// Based on the resolution set the calendar view type
		const defaultView = window.innerWidth > 600 ? "week" : "day";
		$("#calendar-view-select").val(defaultView);

		self.trainerId = document.getElementById("trainer-id").innerText;

		self.calendar = new tui.Calendar("#tui-calendar-container", {
			calendars: [{
				id: CALENDAR_ID,
				name: "Trainers Calendar"
			}],
			defaultView: window.innerWidth > 600 ? "week" : "day",
			taskView: false,
			scheduleView: true,
			useCreationPopup: false,
			useDetailPopup: true,
			usageStatistics: false,
			isReadOnly: false,
			disableDblClick: false,
			disableClick: true,
			template: {
				allday: schedule => self.getTimeTemplate(schedule, true),
				time: schedule => self.getTimeTemplate(schedule, true)
			}
		})

		self.calendar.on({
			'beforeCreateSchedule': self.createNewScheduleCalendarEvent,
			'beforeUpdateSchedule': self.updateScheduleCalendarEvent,
			'beforeDeleteSchedule': self.deleteScheduleCalendarEvent
		});

		/*	self.calendarStartTime = new tui.DatePicker('#startTime-container', {
				timePicker: true,
				input: {
					element: '#starttime-datepicker-input',
					format: 'MMM dd, yyyy hh:mm A'
				}
			});
	
			self.calendarEndTime = new tui.DatePicker('#endTime-container', {
				timePicker: true,
				input: {
					element: '#endtime-datepicker-input',
					format: 'MMM dd, yyyy hh:mm A'
				}
			});
			*/

		/*self.calendarEndBy = new tui.DatePicker('#endby-container', {
			timePicker: false,
			input: {
				element: '#endby-datepicker-input',
				format: 'MMM dd, yyyy'
			}
		});*/

		$("#new-schedule-btn").click(function() {
			self.openScheduleDailog({
				mode: "new"
			});
		});

		// when new schedule dialog closes clear the edit series id 
		$("#calendar-new-schedule-dialog").on("hide.bs.modal", () => {
			self.state.seriesIdInEditMode = null
			self.state.isEditingSeriesInRecurrence = false;
			// Always collapse the recurrence panel, we can open when dialog activated again
			$("#recurrence-validation-alert").hide();
			$("#recurrence-schedule-enable").collapse("hide");
			$("#recurrence-option-toggle").text("Make Recurrence");
		});
		// when delete schedule confimation dialog closes clear the delete series id
		$("#recurrence-confirmation-dialog").on("hide.bs.modal", () => self.state.seriesIdInDeleteMode = null);

		self.setRenderRangeText();

		// For smoother transistion put the api call in setTimeout 
		// Get all schedules of the current trainer
		setTimeout(() => {
			self.fetchSchedulesFromBackend();
		}, 0);
	}

	self.fetchSchedulesFromBackend = function() {
		progressBar.start();
		$.ajax({
			url: "TrainerBookings",
			type: "GET",
			data: {
				trainerId: self.trainerId
			},
			cache: false,
			success: function(data) {
				// For a trainer we will have multiple series so iterate over each series and populate calendar
				for (const series of data) {
					self.state.seriesRecurringSchedules[series.id] = series;
					const uiSchedules = []
					for (const schedule of series.schedules) {
						uiSchedules.push({
							id: schedule.id,
							title: schedule.title,
							location: schedule.location,
							start: new Date(schedule.start),
							end: new Date(schedule.end),
							attendees: series.attendees ? series.attendees : [],
							isAllDay: false,
							category: 'time',
							bgColor: "#e1efff",
							dragBgColor: "#f6deb76b",
							borderColor: "#e1efff"
						});
						self.state.scheduleIdToSeriesIdMap[schedule.id] = series.id;
					}
					// Add recurrence rule to each schedule in the series
					self.addRecurrenceRule(series, uiSchedules);
					// Create schedules for this series in calendar ui
					self.calendar.createSchedules(uiSchedules);
					console.log(series.id, new Date(series.startTime), new Date(series.endTime), " -> ", uiSchedules.length);
				}
			},
			error: function(error) {
				console.error(error);
				alertDialog.show("Service Failure", "Failed to get schedules for trainer " + self.trainerId);
			},
			complete: () => progressBar.end()
		});
	}

	self.onWindowResizeEvent = function() {
		const view = window.innerWidth < 600 ? "day" : self.calendar.getViewName();
		if (view != self.calendar.getViewName()) {
			self.calendar.changeView(view);
			$("#calendar-view-select").val(view);
		}
	}

	self.changeViewEvent = function(event) {
		const viewName = $("#calendar-view-select").val();
		self.calendar.changeView(viewName);
		self.setRenderRangeText();
	}

	self.showRecurrenceEvent = function() {
		self.recurrenceDialogCollapsibleToggle(!self.state.isEditingSeriesInRecurrence);
	}

	// This is coming from calendar UI, when a time slot is clicked or tapped
	self.createNewScheduleCalendarEvent = function(scheduleData) {
		if (!scheduleData.isAllDay) {
			// Clear the dummy schedule is created when the user double clicks the calendar slot
			self.calendar.createSchedules([{}]);
			self.openScheduleDailog({
				mode: "new",
				title: scheduleData.title ? scheduleData.title : "",
				location: scheduleData.location ? scheduleData.location : "",
				startTime: new Date(scheduleData.start.getTime()),
				endTime: new Date(scheduleData.end.getTime()),
				endByDate: scheduleData.endByDate ? scheduleData.endByDate : null
			})
		} else {
			self.calendar.createSchedules([{}]);
		}
	}

	self.updateScheduleCalendarEvent = function(event) {
		// current updating schedule which is part of series schedule
		var schedule = event.schedule;
		if (event.changes) {
			if (event.changes.start) {
				alertDialog.show("Information", "If you want to choose diffrent dates for a schedule then choose Edit schedule option");
			} else {
				// this happen when calendar event is updated using schedule end time is dragged thru calendar UI
				const seriesId = self.state.scheduleIdToSeriesIdMap[schedule.id];
				const scheduleSeries = self.state.seriesRecurringSchedules[seriesId];

				let scheduleStartTime = null;
				for (const seriesSchedule of scheduleSeries.schedules) {
					if (schedule.id == seriesSchedule.id) {
						scheduleStartTime = new Date(schedule.start);
						break;
					}
				}
				const diff = event.changes.end.getTime() - scheduleStartTime.getTime();
				if (diff > TIME_SLOT_MAX) {
					alertDialog.show("Information", TIME_SLOT_MAX_MESSAGE);
					return;
				}
				let seriesEndTime = new Date(scheduleSeries.startTime + diff);

				const title = scheduleSeries.title;
				const location = scheduleSeries.location;
				const endByDate = scheduleSeries.endByDate ? new Date(scheduleSeries.endByDate) : null;
				const scheduleRequest = {
					title: title,
					location: location,
					startTime: new Date(scheduleSeries.startTime),
					endTime: seriesEndTime,
					endByDate: endByDate,
					dayNamesSelected: scheduleSeries.selectedDayNames,
					seriesTransitionFromId: seriesId,
					fee: scheduleSeries.fee,
					classLevel: scheduleSeries.classLevel,
					trainerPreference: scheduleSeries.trainerPreference
				}
				// pass seriesId as transistion id so that system delete the existing series and add new series
				self.addNewSeriesSchedules(scheduleRequest);
			}
		} else {
			// store which series is going be in edit mode
			self.state.seriesIdInEditMode = self.state.scheduleIdToSeriesIdMap[schedule.id];
			const scheduleSeries = self.state.seriesRecurringSchedules[self.state.seriesIdInEditMode]
			self.openScheduleDailog({
				mode: "edit",
				title: schedule.title ? schedule.title : "",
				location: schedule.location ? schedule.location : "",
				startTime: new Date(scheduleSeries.startTime),
				endTime: new Date(scheduleSeries.endTime),
				endByDate: scheduleSeries.endByDate ? new Date(scheduleSeries.endByDate) : null,
				selectedDayNames: scheduleSeries.selectedDayNames ? scheduleSeries.selectedDayNames : [],
				fee: scheduleSeries.fee,
				classLevel: scheduleSeries.classLevel,
				trainerPreference: scheduleSeries.trainerPreference
			});
		}
	}

	self.deleteSeriesDialogEvent = function() {
		const seriesId = self.state.seriesIdInDeleteMode.seriesId;
		const scheduleId = self.state.seriesIdInDeleteMode.scheduleId;
		// if only occurrenc suppose to be deleted then set the schedule id otherwise entire series will be deleted.
		const isDeleteThisOccurrence = document.getElementById("recurrence-dialog-delete-ocurrence").checked;
		// close the dialog
		$("#recurrence-confirmation-dialog").modal("hide");

		progressBar.start();
		// Make a call to backend and clear either current occurrence or entire series based on the user choice
		$.ajax({
			url: "TrainerBookings?seriesId=" + seriesId + "&trainerId=" + self.trainerId + (isDeleteThisOccurrence ? "&scheduleId=" + scheduleId : ""),
			type: "DELETE",
			cache: false,
			success: function() {
				self.deleteCalendarSchedules(isDeleteThisOccurrence, seriesId, scheduleId);
			},
			error: function() {
				alertDialog.show("Service Failure", "Failed to delete schedules");
			},
			complete: () => progressBar.end()
		});
	}

	// This event is triggerd from calendar UI
	self.deleteScheduleCalendarEvent = function(event) {
		var schedule = event.schedule;
		const seriesId = self.state.scheduleIdToSeriesIdMap[schedule.id];
		const title = self.state.seriesRecurringSchedules[seriesId].title;

		if (self.state.seriesRecurringSchedules[seriesId].schedules.length == 1) {
			confirmDialog.show("Would you like to delete this training schedule \"" + title + "\"?", () => {
				// user confirmed hence set the deleting schedules
				self.state.seriesIdInDeleteMode = {
					seriesId: self.state.scheduleIdToSeriesIdMap[schedule.id],
					scheduleId: schedule.id
				}
				progressBar.start();
				// only one occurrence present in series hence we need to delete the entire series otherwise if
				// we delete only schedule then series entries in db will be in limbo state.
				// So in affect if a series with single schedule deletion would be equal to deleting entries series
				$.ajax({
					url: "TrainerBookings?seriesId=" + seriesId + "&trainerId=" + self.trainerId,
					type: "DELETE",
					cache: false,
					success: function() {
						console.log("Schedule series:", seriesId, " has been deleted")
						self.calendar.deleteSchedule(schedule.id, "");
					},
					error: function() {
						alertDialog.show("Service Failure", "Failed to delete schedules");
					},
					complete: () => progressBar.end()
				});
			});
		} else {
			// user confirmed hence set the deleting schedules
			self.state.seriesIdInDeleteMode = {
				seriesId: self.state.scheduleIdToSeriesIdMap[schedule.id],
				scheduleId: schedule.id
			}
			$("#recurrence-dialog-message").text("Do you want to delete all occurrences of the recurrence schedule \"" + title + "\" or just this one?");
			document.getElementById("recurrence-dialog-delete-ocurrence").checked = true;
			$("#recurrence-confirmation-dialog").modal({ show: true });
		}
	}

	self.deleteCalendarSchedules = function(isDeleteThisOccurrence, seriesId, scheduleId) {
		// If we have to delete only current occurrence then reove it from calndear otherwise delete entire series
		if (isDeleteThisOccurrence) {
			const seriesSchedules = self.state.seriesRecurringSchedules[seriesId];
			for (let index = 0; index < seriesSchedules.schedules.length; index++) {
				if (seriesSchedules.schedules[index].id == scheduleId) {
					seriesSchedules.schedules.splice(index, 1);
					const remainingSchedulesLength = self.state.seriesRecurringSchedules[seriesId].schedules.length;
					console.log("Scheduled occurrence: ", scheduleId, " has been removed and remaing schedules:", remainingSchedulesLength);
					self.calendar.deleteSchedule(scheduleId, "");
					return;
				}
			}
			alertDialog.show("Service Failure", "Something went wrong while deleting the schedule");
		} else {
			self.clearSeries(seriesId)
		}
	}

	self.saveNewSheduleDialogKeyEvent = function(e) {
		if (e.keyCode === 13) {
			self.saveScheduleDialogEvent();
		}
	}

	// Save button in new schedule dialog will trigger this
	self.saveScheduleDialogEvent = function() {
		// Add new series schedules
		const title = document.getElementById("schedule-title").value;
		const location = document.getElementById("schedule-location").value;
		const fee = $("#series-schedule-fee").val();
		const classLevel = $("#calendar-class-level").val();
		const trainerPreference = $("#calendar-trainer-preference").val();
		const startTime = Utils.combineDateTime("startdate-datepicker-input", "starttime-timepicker-input");
		const endTime = Utils.combineDateTime("startdate-datepicker-input", "endtime-timepicker-input");
		
		// End by date is always end of day hence set the hours+mins+secs towards end of date
		let endByDate = null;
		let dayNamesSelected = [];
		if (self.state.isEditingSeriesInRecurrence) {
			endByDate = new Date($("#endby-datepicker-input").val());
			endByDate.setHours(23);
			endByDate.setMinutes(59);
			endByDate.setSeconds(59);

			for (const dayName of DAY_NAMES) {
				if (document.getElementById("schedule-every-action-" + dayName).checked) {
					dayNamesSelected.push(dayName)
				}
			}
		}

		if (self.validateSchedule(title, location, startTime, endTime, endByDate, dayNamesSelected)) {
			// If there is value in seriesIdInEditMode then series in edit mode 
			if (self.state.seriesIdInEditMode) {
				const seriesSchedules = self.state.seriesRecurringSchedules[self.state.seriesIdInEditMode];
				const qeryStatus = {
					seriesSchedules: seriesSchedules,
					title: title, location: location,
					startTime: startTime,
					endTime: endTime,
					endByDate: endByDate,
					dayNamesSelected: dayNamesSelected,
					fee: fee,
					classLevel: classLevel,
					trainerPreference: trainerPreference
				};
				// If there is any change in dates/recurrence then new schedules will be created othrewise if there are changes
				// to only title and location then update would happen
				const status = self.getSeriesUpdatableStatus(qeryStatus);
				// If the status is update means only title and/or location is modified otherwise 
				// any other field change require dropping old recurrence and create new recurrence series
				if (status === "Update") {
					self.updateSeriesSchedules(self.state.seriesIdInEditMode, title, location, fee, classLevel, trainerPreference);
				} else if (status === "New") {
					const scheduleRequest = {
						title: title,
						location: location,
						startTime: startTime,
						endTime: endTime,
						endByDate: endByDate,
						dayNamesSelected: dayNamesSelected,
						seriesTransitionFromId: self.state.seriesIdInEditMode,
						fee: fee,
						classLevel: classLevel,
						trainerPreference: trainerPreference
					}
					// If this event fired after start of edit mode then clear the series and add new series
					self.addNewSeriesSchedules(scheduleRequest);
				}
			} else {
				const scheduleRequest = {
					title: title,
					location: location,
					startTime: startTime,
					endTime: endTime,
					endByDate: endByDate,
					dayNamesSelected: dayNamesSelected,
					seriesTransitionFromId: self.state.seriesIdInEditMode,
					fee: fee,
					classLevel: classLevel,
					trainerPreference: trainerPreference
				}
				// If this event fired after start of edit mode then clear the series and add new series
				self.addNewSeriesSchedules(scheduleRequest);
			}

			// Close the dialog.
			$("#calendar-new-schedule-dialog").modal("hide");
		}
	}

	self.updateSeriesSchedules = function(seriesId, title, location, fee, classLevel, trainerPreference) {
		progressBar.start();
		// Store the schedules in database
		$.ajax({
			url: "TrainerBookings?edit=true",
			type: "POST",
			data: {
				trainerId: self.trainerId,
				seriesId: seriesId,
				title: title,
				location: location,
				fee: fee,
				classLevel: classLevel,
				trainerPreference: trainerPreference
			},
			cache: false,
			success: function() {
				const seriesSchedules = self.state.seriesRecurringSchedules[seriesId];
				seriesSchedules.title = title;
				seriesSchedules.location = location;
				seriesSchedules.fee = fee;
				seriesSchedules.classLevel = classLevel;
				seriesSchedules.trainerPreference = trainerPreference;

				for (const schedule of seriesSchedules.schedules) {
					self.calendar.updateSchedule(schedule.id, "", {
						title: title,
						location: location
					})
				}
				console.log("successfully updated schedules series: ", seriesId)
			},
			error: function() {
				alertDialog.show("Service Failure", "Failed to update schedules");
			},
			complete: () => progressBar.end()
		});
	}

	//	seriesTransitionFromId comes into picture when a series is edited then old series will be deleted and new series will be added
	self.addNewSeriesSchedules = function(request) {
		const { title, location, startTime, endTime, endByDate, dayNamesSelected, seriesTransitionFromId, fee, classLevel, trainerPreference } = request;
		// if the request has id value then use the same otherwise generate new one
		// Id will be passed during edit of the series otherwise will be empty
		let seriesIdentifier = seriesTransitionFromId ? seriesTransitionFromId : "series-" + Math.random();
		const slotDiffInMills = endTime.getTime() - startTime.getTime();
		const apiSchedules = []
		const uiSchedules = []
		// If end by date is not there means its not recurring hence choose end time as target
		const targetDate = endByDate ? endByDate : endTime;

		// Clear the transistion series first and then update the backend then add new schedules.
		if (seriesTransitionFromId) {
			self.clearSeries(seriesTransitionFromId);
			console.log("Old series from UI schedules has been cleared");
		}
		// Store the schedules so that we can delete/modify entire series when delete operation is performed on calendar
		// Similarly when time slot is moved/modified we can update all schedules present in that series		
		self.state.seriesRecurringSchedules[seriesIdentifier] = {
			id: seriesIdentifier,
			traineremail: self.trainerId,
			title: title,
			location: location,
			startTime: startTime.getTime(),
			endTime: endTime.getTime(),
			endByDate: endByDate ? endByDate.getTime() : null,
			fee: fee,
			classLevel: classLevel,
			trainerPreference: trainerPreference,
			selectedDayNames: dayNamesSelected,
			// Each schedule falls in this recurring series
			schedules: apiSchedules,
			// If the old ser
			seriesTransitionFromId: seriesTransitionFromId
		};

		if (endByDate) {
			for (let lpDate = new Date(startTime.getTime()); lpDate.getTime() < targetDate.getTime(); lpDate.setDate(lpDate.getDate() + 1)) {
				const lpDayName = DAY_NAMES[lpDate.getDay()];
				if (dayNamesSelected.includes(lpDayName)) {
					const targetEnd = new Date(lpDate.getTime());
					targetEnd.setMilliseconds(targetEnd.getMilliseconds() + slotDiffInMills)
					const schedule = {
						id: "schedule-" + (new Date()).getTime() + Math.random(),
						seriesId: seriesIdentifier,
						title: title,
						location: location,
						start: lpDate.getTime(),
						end: targetEnd.getTime(),
					};
					apiSchedules.push(schedule);
					uiSchedules.push({
						id: schedule.id,
						title: title,
						location: location,
						start: new Date(lpDate.getTime()),
						end: new Date(targetEnd.getTime()),
						isAllDay: false,
						category: 'time',
						bgColor: "#e1efff",
						dragBgColor: "#f6deb76b",
						borderColor: "#e1efff"
					})
					self.state.scheduleIdToSeriesIdMap[schedule.id] = seriesIdentifier;
				}
			}
			// Add recurrence rule which is used when a schedule is clicked
			self.addRecurrenceRule(self.state.seriesRecurringSchedules[seriesIdentifier], uiSchedules);
		} else {
			const schedule = {
				id: "schedule-" + (new Date()).getTime() + Math.random(),
				seriesId: seriesIdentifier,
				title: title,
				location: location,
				start: startTime.getTime(),
				end: endTime.getTime(),
			};
			apiSchedules.push(schedule);
			uiSchedules.push({
				id: schedule.id,
				title: title,
				location: location,
				start: new Date(startTime.getTime()),
				end: new Date(endTime.getTime()),
				isAllDay: false,
				category: 'time',
				bgColor: "#e1efff",
				dragBgColor: "#f6deb76b",
				borderColor: "#e1efff"
			});
			self.state.scheduleIdToSeriesIdMap[schedule.id] = seriesIdentifier;
		}

		// Store the series and its schedules
		self.storeSchedules(self.state.seriesRecurringSchedules[seriesIdentifier], uiSchedules, () => {
			console.log("series schedules has been updated in the backed with seriesId", seriesTransitionFromId);
		});
	}

	self.addRecurrenceRule = function(seriesDetails, uiSchedules) {
		// Update the recurrence rule per schedule
		if (uiSchedules.length > 1) {
			const start = moment(seriesDetails.startTime).format("MMMM DD, YYYY");
			const sTimeOnly = moment(seriesDetails.startTime).format("hh:mm A");
			const eTimeOnly = moment(seriesDetails.endTime).format("hh:mm A");
			const end = moment(seriesDetails.endByDate).format("MMMM DD, YYYY");
			const recurrenceRule = "Occurs every " + seriesDetails.selectedDayNames.join(", ") + " effective " + start +
				" until " + end + " from " + sTimeOnly + " to " + eTimeOnly;
			// Update each schedule in the series with recurrence rule
			for (const schedule of uiSchedules) {
				schedule.recurrenceRule = recurrenceRule;
			}
		}
	}

	self.storeSchedules = function(series, uiSchedules, onSuccessPreNotification) {
		progressBar.start();
		// Store the schedules in database
		const payload = JSON.stringify(series);
		$.ajax({
			url: "TrainerBookings",
			type: "POST",
			data: {
				schedules: payload
			},
			cache: false,
			success: function() {
				if (onSuccessPreNotification) {
					onSuccessPreNotification();
				}
				self.calendar.createSchedules(uiSchedules);
			},
			error: function() {
				alertDialog.show("Service Failure", "Failed to store new schedules");
			},
			complete: () => progressBar.end()
		});
	}

	self.openScheduleDailog = function(currentSchedule) {

		const title = currentSchedule.title ? currentSchedule.title : "";
		const location = currentSchedule.location ? currentSchedule.location : "";
		const start = currentSchedule.startTime ? currentSchedule.startTime : new Date();
		const end = currentSchedule.endTime ? currentSchedule.endTime : new Date();
		const endBy = currentSchedule.endByDate ? currentSchedule.endByDate : new Date();
		const fee = currentSchedule.fee;
		const classLevel = currentSchedule.classLevel;
		const trainerPreference = currentSchedule.trainerPreference;

		// if end time is not define then default add an hour
		if (!currentSchedule.endTime) {
			end.setHours(end.getHours() + 1);
		}
		if (!currentSchedule.endByDate) {
			endBy.setMonth(endBy.getMonth() + 3);
		}

		document.getElementById("schedule-title").value = title;
		document.getElementById("schedule-location").value = location;
		$("#series-schedule-fee").val(fee ? fee : 1000);
		$("#calendar-class-level").val(classLevel ? classLevel : "Beginner");
		$("#calendar-trainer-preference").val(trainerPreference ? trainerPreference : "All");

		// Set the values to the date and time components
		$("#startdate-datepicker-input").val(Utils.formatDate(start));
		$("#starttime-timepicker-input").val(Utils.formatTime(start));
		$("#endtime-timepicker-input").val(Utils.formatTime(end));
		$("#endby-datepicker-input").val(Utils.formatDate(endBy));

		// If thew new schdule series is created of edit schedule without recurrance then set the default dayname
		if (currentSchedule.mode === "new" || (currentSchedule.selectedDayNames && currentSchedule.selectedDayNames.length == 0)) {
			// select the checkbox for the start date weekday name
			const selectedDayName = DAY_NAMES[start.getDay()]
			for (const dayName of DAY_NAMES) {
				document.getElementById("schedule-every-action-" + dayName).checked = dayName === selectedDayName;
			}
		} else { // Edit mode
			for (const dayName of DAY_NAMES) {
				document.getElementById("schedule-every-action-" + dayName).checked = currentSchedule.selectedDayNames.includes(dayName);
			}
		}
		// as the start date is set update the start by read only field recurrence value
		self.updateStartBy();
		// show the dialog
		$("#calendar-new-schedule-dialog").modal({ show: true });
		if (currentSchedule.mode === "new") {
			self.recurrenceDialogCollapsibleToggle(false);
		} else if (currentSchedule.endByDate) {
			self.recurrenceDialogCollapsibleToggle(true);
		}
		setTimeout(() => {
			document.getElementById("schedule-title").focus();
		}, 500);
	}

	self.showValidationMessage = message => {
		$("#recurrence-dialog-alert-message").text(message);
		$("#recurrence-dialog-alert-instance").css("dsplay", "block");
	}

	self.showValidationMessage = function(message) {
		$("#recurrence-validation-message").text(message);
		$("#recurrence-validation-alert").show()
	};

	self.validateSchedule = function(title, location, startTime, endTime, endByDate, dayNamesSelected) {
		if (!title || title.trim().length == 0) {
			self.showValidationMessage("Title is mandatory");
			return false;
		}
		if (!location || location.trim().length == 0) {
			self.showValidationMessage("Location is mandatory");
			return false;
		}
		const today = new Date();
		today.setHours(0);
		today.setMinutes(0);
		today.setSeconds(0);
		today.setMilliseconds(0);

		if (startTime.getTime() < today.getTime()) {
			self.showValidationMessage("Start time should be same or more than Today.");
			return false;
		}
		if (endTime.getTime() < startTime.getTime()) {
			self.showValidationMessage("End time should be more than Start time");
			return false;
		}
		if ((endTime.getTime() - startTime.getTime()) > TIME_SLOT_MAX) {
			self.showValidationMessage(TIME_SLOT_MAX_MESSAGE)
			return false;
		}
		if ((endTime.getTime() - startTime.getTime()) < TIME_SLOT_MIN) {
			self.showValidationMessage(TIME_SLOT_MIN_MESSAGE)
			return false;
		}
		if (endByDate && endByDate.getTime() < endTime.getTime()) {
			self.showValidationMessage("End by date should always be more than end time")
			return false;
		}
		if (endByDate && dayNamesSelected.length === 0) {
			self.showValidationMessage("Recurrence pattern is not valid, choose atleast a day");
			return false;
		}

		return true;
	}

	// If title or location changed then series updatable otherwise it is not updatable
	self.getSeriesUpdatableStatus = function(query) {
		const { seriesSchedules, title, location, startTime, endTime, endByDate, dayNamesSelected, fee, classLevel, trainerPreference } = query;
		// Any change to recurrence then its a new schedule recurrence
		if (seriesSchedules.startTime != startTime.getTime() || seriesSchedules.endTime != endTime.getTime()) {
			return "New";
		}
		if ((seriesSchedules.endByDate && !endByDate) || (!seriesSchedules.endByDate && endByDate) ||
			(endByDate && seriesSchedules.endByDate && seriesSchedules.endByDate != endByDate.getTime())) {
			return "New";
		}
		let isDayNamesSame = seriesSchedules.selectedDayNames.length === dayNamesSelected.length &&
			dayNamesSelected.every(function(element) {
				return seriesSchedules.selectedDayNames.includes(element);
			});
		if (!isDayNamesSame) {
			return "New";
		} else if (title != seriesSchedules.title || location != seriesSchedules.location
			|| fee != seriesSchedules.fee || classLevel != seriesSchedules.classLevel || trainerPreference != seriesSchedules.trainerPreference) {
			return "Update"
		} else {
			// Nothing changed hence no action
			return "NoChange";
		}
	}

	self.clearSeries = function(seriesId) {
		const allSchedulesOfThisSeries = self.state.seriesRecurringSchedules[seriesId];
		// Go over each schedule and remove from calendar
		for (const schedule of allSchedulesOfThisSeries.schedules) {
			self.calendar.deleteSchedule(schedule.id, "");
		}
		// as the schedules are cleared hence remove the value
		self.state.seriesRecurringSchedules[seriesId] = undefined;
	}

	self.getTimeTemplate = function(schedule) {
		const viewName = self.calendar.getViewName();
		const locationIcon = schedule.location ? "<span class='calendar-font-icon ic-location-b pr-sm' style='font-size: 16px;color: #0563d7'></span>" : "";
		const recurrenceIcon = schedule.recurrenceRule ? "<span class='calendar-font-icon ic-repeat-b pr-sm' style='font-size:15px; color: #8d0583'></span>" : "";
		// Location would be added in daily and weekly calendar but not in monthly due time slot space constraints
		const location = schedule.location && viewName != "month" ? "<div class='schedule-location'><span>" + schedule.location + "</span></div>" : "";
		const html = "<div class='flex-column'>" +
			"<div class='flex'>" + recurrenceIcon + locationIcon + "<span class='schedule-title pr-sm'>" + schedule.title + "</span></div>" +
			location + "</div>"

		return html;
	}

	self.recurrenceDialogCollapsibleToggle = function(show) {
		if (show) {
			$("#recurrence-schedule-enable").collapse("show");
			self.state.isEditingSeriesInRecurrence = true;
			$("#recurrence-option-toggle").text("Cancel Recurrence");
		} else {
			$("#recurrence-schedule-enable").collapse("hide");
			self.state.isEditingSeriesInRecurrence = false;
			$("#recurrence-option-toggle").text("Make Recurrence");
		}
	}

	self.changeCalendarView = function(type) {
		self.calendar.changeView(type, true);
		self.setRenderRangeText();
	}

	self.setRenderRangeText = function() {
		//		const viewLabel = self.calendar.getViewName() === "day" ? "Daily" : "Weekly"
		//		document.getElementById("calendarStatus").innerText = viewLabel;

		var renderRange = document.getElementById('calendarRenderRange');
		const endFormat = self.calendar.getDateRangeStart().getMonth() == self.calendar.getDateRangeEnd().getMonth() ? "DD, YYYY" : "MMMM DD, YYYY";

		var html = [];
		if (self.calendar.getViewName() === 'day') {
			html.push(moment(self.calendar.getDateRangeStart().getTime()).format('MMMM DD, YYYY'));
		} else {
			html.push(moment(self.calendar.getDateRangeStart().getTime()).format('MMMM DD'));
			html.push(' - ');
			html.push(moment(self.calendar.getDateRangeEnd().getTime()).format(endFormat));
		}
		renderRange.innerHTML = html.join('');
	}


	self.currentCalendarDate = function(format) {
		var currentDate = moment([self.calendar.getDate().getFullYear(), self.calendar.getDate().getMonth(), self.calendar.getDate().getDate()]);
		return currentDate.format(format);
	}

	self.calendarNaviagte = function(nav) {
		if (nav === "next") {
			self.calendar.next();
		} else if (nav == "prev") {
			self.calendar.prev();
		} else {
			self.calendar.today();
		}
		self.setRenderRangeText();
	}

	self.updateStartBy = function() {
		setTimeout(() => {
			const startDateLbl = moment($("#startdate-datepicker-input").val()).format("MMMM DD, YYYY");
			document.getElementById("schedule-startby").innerText = startDateLbl;
		}, 100)
	}
}

window.trainerCalendar = new TrainerCalender();
