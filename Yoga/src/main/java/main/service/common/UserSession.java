package main.service.common;

import javax.servlet.http.HttpSession;

import main.common.AppConstants;
import main.model.SessionUser;

public class UserSession {
	public enum Type {
		TRAINEE("Trainee"), TRAINER("Trainer");

		String value;

		Type(String value) {
			this.value = value;
		}
	}

	public static void createUserSession(HttpSession session, Type userType, String username, String userEmail) {
		SessionUser user = new SessionUser();
		user.setType(userType.value);
		user.setName(username);
		user.setEmail(userEmail);
		session.setAttribute(AppConstants.SESSION_IDENTIFICATION_KEY, userEmail);
		session.setAttribute(AppConstants.SESSION_USER_INFO, user);
	}
}
