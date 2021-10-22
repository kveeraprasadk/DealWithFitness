function Whoami() {
	const self = this;
	self.userDetails = "";
	// Pages which does not required authentication
	self.whitelistedPages = ["index.jsp", "About.jsp", "trainerdetails.jsp", "Trainer.jsp"];

	self.detect = function(callback) {
		console.log("Login detection started");
		// Initialize the addtional user options for navbar which are common for all screens
		self.initNavBar()

		$.ajax({
			url: "whoami",
			type: "GET",
			cache: false,
			success: function(data) {
				self.handleLoginQueryResponse(data, callback);
			},
			error: function(data) {
				// If this is the status then user not logged in
				if (data.status == 401) {
					if (self.isWhitelisted(document.location.href) || self.isItRoot()) {
						return self.handleLoginQueryResponse(null, callback);
					} else {
						document.location.href = "./session-expiry.jsp";
					}
				} else {
					alertDialog.show("Service Failure", data.statusText);
				}
			},
		});
	}

	self.isItRoot = function() {
		const path = document.location.href;
		const values = path.split("/");
		const root = values[values.length - 1].trim().length == 0;
		console.log("Root location: ", root);
		return root;
	}

	self.isWhitelisted = function(value) {
		for (const whitelistedPage of self.whitelistedPages) {
			if (value.endsWith(whitelistedPage)) {
				return true;
			}
		}
		return false;
	}

	self.handleLoginQueryResponse = function(data, callback) {
		if (data) {
			for (const key in data) {
				self.userDetails = data[key];
				self.bindUser(key);
			}
		} else {
			console.log("No user logged in");
			const trainers = document.getElementsByName("trainer-hyperlink-element");
			$(trainers).removeClass("hide");
		}

		if (callback) {
			callback();
		}
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
				$(trainers).addClass("hide");
				$("#trainee-extra-options").removeClass("hide");
			} else {
				$("#trainer-extra-options").removeClass("hide");
			}
		}
	}

	self.isUserLoggedIn = function() {
		return window.__sessionUser && window.__sessionUser != "null" ? true : false;
	}

	// Nav bar related changes below
	// Initialize the addtional user options for navbar which are common for all screens
	self.initNavBar = function() {
		$("#logged-in-user-options-trigger").popover({
			html: true,
			content: function() {
				return $('#logged-in-user-popover-options').html();
			}
		});

		$("#sm-more-options-trigger").popover({
			html: true,
			content: function() {
				return $('#sm-navbar-more-options').html();
			}
		});
	}

	// Called form small screen devices more options button
	self.closeMoreOptionsCollapse = function() {
		$("#navbarCollapse-sm").collapse("hide");
	}
}

window.whoami = new Whoami();