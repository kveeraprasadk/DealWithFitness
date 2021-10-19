const SUPPORTED_IMAGE_FORMATES = ["jpg", "png", "jpeg", "gif", "tif", "tiff"];
const SUPPORTED_IMAGE_FORMATES_STRING = ["jpg", "png", "jpeg", "gif", "tif", "tiff"].join(", ");

function Journey() {
	const self = this;

	self.init = function() {
		whoami.detect(() => {
			self.associateEvents();
			progressBar.start();
			$.ajax({
				url: "traineeBookings",
				type: "GET",
				data: {
					traineeId: whoami.getUser(),
					uniqueTrainers: true
				},
				cache: false,
				success: function(data) {
					const select = $("#journey-trainers-list");
					select.append("<option value=''>Choose a trainer</option>");
					for (const trainerDetails of data) {
						select.append("<option value='" + trainerDetails.email + "'>" + trainerDetails.name + "</option>")
					}

				},
				error: function(error) {
					console.error(error);
					alertDialog.show("Service Failure", "Failed to get schedules for trainer " + whoami.getUser());
				},
				complete: () => progressBar.end()
			});
		})
	}

	self.isSupportedFiles = function(fileName) {
		for (const ext of SUPPORTED_IMAGE_FORMATES) {
			if (fileName.endsWith(ext)) {
				return true;
			}
		}
	}

	self.clearFileSelection = function(inputType) {
		inputType.value = "";
		// for safari hack to clear file
		inputType.type = "";
		inputType.type = "file";
	}

	self.associateEvents = function() {
		var inputs = document.getElementsByClassName('photo-trigger-button');
		for (const inp of inputs) {
			self.clearFileSelection(inp);
		}
		
		$(inputs).on('change', (event) => {
			const input = event.target;
			const fileName = input.files[0].name;
			
			if (!self.isSupportedFiles(fileName)) {
				alertDialog.show("Validation Error", "Please choose supported image formats " + SUPPORTED_IMAGE_FORMATES_STRING);
				self.clearFileSelection();
			} else {
				if (input.files && input.files[0]) {
					document.getElementById(input.id + "-lbl").innerText = fileName;
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#" + input.id + "-img").attr('src', e.target.result);
					};
					reader.readAsDataURL(input.files[0]);
				}
			}
		});
	}

	self.validateInputsOnSubmitEvent = function() {
		const trainerId = $("#journey-trainers-list").val();
		const firstPhotoPath = $("#firstPhoto").val();
		const secondPhotoPath = $("#secondPhoto").val();
		const journeyStory = $("#journey-story-text").val();

		if (Utils.isBlank(trainerId)) {
			alertDialog.show("Validation error", "Please choose a Trianer as it is mandatory.");
			return false;
		} else if (Utils.isBlank(journeyStory) || journeyStory.trim().length < 100) {
			alertDialog.show("Validation error", "Your fitness journey details should be atleast 100 characters");
			return false;
		} else if (Utils.isNotBlank(firstPhotoPath) && Utils.isNotBlank(secondPhotoPath) && firstPhotoPath == secondPhotoPath) {
			alertDialog.show("Validation error", "Both the chosen photographs are the same, please choose different one")
			return flase;
		}
		// start the progress bar and let the page redirect
		progressBar.start();
		$("#traineeId").val(whoami.getUser());
	}
}

// View stories model starts from here
function Stories() {
	const self = this;
	self.lst;

	self.init = function() {
		progressBar.start();
		whoami.detect(() => {
			progressBar.start();
			$.ajax({
				url: "TraineeStoryServlet",
				type: "GET",
				data: {
					traineeId: whoami.getUser()
				},
				cache: false,
				success: function(data) {
					if (data && data.length > 0) {
						self.lst = data;
						self.fill();
					} else {
						console.log("no stories")
						$("#no-stories-message").show();
					}
				},
				error: function(error) {
					console.error(error);
					alertDialog.show("Service Failure", "Failed to get schedules for trainer " + whoami.getUser());
				},
				complete: () => progressBar.end()
			});
		})
	}

	self.showMore = function(event) {
		const storyId = event.target.getAttribute("storyId");
		for (const storyDetails of self.lst) {
			if (storyDetails.storyId == storyId) {
				$(event.target.parentNode).html('<span style = "word-break: break-all; font-size:14px">' + storyDetails.story + '</span>');
				break;
			}
		}
	}

	self.fill = function() {
		const template = document.getElementById("view-stories-fragment");
		const htmlTemplate = template.innerHTML;
		const parentId = template.getAttribute("targetId");
		const parentHtmlNode = $("#" + parentId);

		for (const storyDetails of self.lst) {
			if (storyDetails.story.length > 300) {
				storyDetails.moreElement = "<span onclick='stories.showMore(event)' storyId='" + storyDetails.storyId + "' class='link'>...more<span>";
				storyDetails._story = storyDetails.story.substring(0, 300);
			} else {
				storyDetails._story = storyDetails.story;
			}
			storyDetails.approvalStatus = storyDetails.adminApprove == "true" ? "Approved" : "Approval In progress";
			storyDetails.approvalColor = storyDetails.adminApprove == "true" ? "green" : "red";
			storyDetails.time = moment(new Date(storyDetails.creationTime)).format("MMMM DD,YYYY hh:mm");
			storyDetails.showPhotosClass = storyDetails.hasPhotos == true ? "show" : "hide";
			const childHtmlNode = Utils.fillTemplate(htmlTemplate, [storyDetails]);
			parentHtmlNode.append(childHtmlNode);
		}
	}

	self.deleteStoryEvent = function(event) {
		const storyId = event.target.getAttribute("storyId");
		progressBar.start();
		confirmDialog.show("Would you like to delete the story?", () => {
			$.ajax({
				url: "TraineeStoryServlet?storyId=" + storyId,
				type: "DELETE",
				cache: false,
				success: function(data) {
					document.location.reload();
				},
				error: function(error) {
					console.error(error);
					alertDialog.show("Service Failure", "Failed to delete story for user: " + whoami.getUser());
				},
				complete: () => progressBar.end()
			});
		})
	}

	self.showPhotosEvent = function(event) {
		progressBar.start();
		const storyId = event.target.getAttribute("storyId");
		$.ajax({
			url: "TraineeStoryServlet",
			type: "GET",
			data: {
				traineeId: whoami.getUser(),
				photosOfStoryId: storyId
			},
			cache: false,
			success: function(data) {
				const container = $("#img-container-" + storyId);
				container.html("");
				for (const imgKey in data) {
					if (data[imgKey]) {
						container.append("<div class='col-12 col-md-6 image-area mt-4'><img src='" + data[imgKey] + "' class='img-fluid rounded shadow-sm mx-auto d-block'/></div>");
					}
				}
			},
			error: function(error) {
				console.error(error);
				alertDialog.show("Service Failure", "Failed to get photo's' for trainer " + whoami.getUser());
			},
			complete: () => progressBar.end()
		});
	}
}

window.journey = new Journey();
window.stories = new Stories();