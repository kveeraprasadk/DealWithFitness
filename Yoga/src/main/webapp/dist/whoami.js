function Whoami() {
	const self = this;
	self.userDetails = "";

	self.detect = function(callback) {
		$.ajax({
			url: "whoami",
			type: "GET",
			cache: false,
			success: function(data) {
				for (const key in data) {
					self.userDetails = data[key];
					self.bindUser(key);
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
			$("#user-logout-element").css("display", "block");
			// If logged in user is trainee then hide trainer hyperlink
			if (self.isTrainee()) {
				$("#trainer-hyperlink-element").hide();
			}
		}
	}

	self.isUserLoggedIn = function() {
		return window.__sessionUser && window.__sessionUser != "null" ? true : false;
	}
}

window.whoami = new Whoami();