function ProgressBar() {
	self = this;
	self.start = function() {
		document.getElementById("progress-bar").style.display = "block";
	}
	self.end = function() {
		document.getElementById("progress-bar").style.display = "none";
	}
}

function AlertDialog() {
	self = this;

	self.show = function(title, message) {
		$("#alert-title").text(title);
		$("#alert-dialog-message").text(message);
		$("#alert-dialog").modal({ show: true });
		setTimeout(() => {
			$("#alert-dialog-ok").focus()
		}, 500)
	}
}

function ConfirmDialog() {
	const self = this;
	self.callback = null;
	
	$(document).ready(() => {
		$("#confirm-dialog-yes").click(e => {
			if (self.callback) {
				self.callback();
			}
		})
	})
	
	self.show = function(message, callback) {
		self.callback = callback;
		$("#confirm-dialog-message").text(message);
		$("#confirm-dialog").modal("show");
	}
}

window.progressBar = new ProgressBar();
window.alertDialog = new AlertDialog();
window.confirmDialog = new ConfirmDialog();
