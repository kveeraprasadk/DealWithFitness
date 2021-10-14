function Whoami() {
	const self = this;
	self.userDetails = "";

	self.detect = function(callback) {
		$("#logged-in-user-options-trigger").popover({
			html: true,
			content: function() {
				return $('#logged-in-user-popover-options').html();
			}
		});

		$.ajax({
			url: "whoami",
			type: "GET",
			cache: false,
			success: function(data) {
				if (data) {
					for (const key in data) {
						self.userDetails = data[key];
						self.bindUser(key);
					}
				} else {
					console.log("No user logged in");
					const trainers = document.getElementsByName("trainer-hyperlink-element");
					$(trainers).show();
				}

				if (callback) {
					callback();
				}
			},
			error: function(data) {
				alertDialog.show("Service Failure", data.statusText);
			}
		});
	}

	self.redirectIfUserLoggedInOrElse = function(pathIfPresent, pathOrElse) {
		document.location.href = self.isUserLoggedIn() ? pathIfPresent : pathOrElse
	}

	self.getUser = function() {
		return window.__sessionUser;
	}

	self.isTrainee = function() {
		return self.userDetails.type == "Trainee";
	}

	self.bindUser = function(user) {
		console.log("New user binding: ", user, self.userDetails);
		window.__sessionUser = user;
		if (self.isUserLoggedIn()) {
			$("#logged-in-user-email").text(self.userDetails.email);
			$("#logged-in-user-name").text(self.userDetails.name);
			$("#logged-in-user-options-trigger").show();

			// If logged in user is trainee then hide trainer hyperlink
			if (self.isTrainee()) {
				const trainers = document.getElementsByName("trainer-hyperlink-element");
				$(trainers).hide();
				$("#trainee-extra-options").removeClass("hide");
			} else {
				$("#trainer-extra-options").removeClass("hide");
			}
		}
	}

	self.isUserLoggedIn = function() {
		return window.__sessionUser && window.__sessionUser != "null" ? true : false;
	}
}

window.whoami = new Whoami();