package main.common;

import javax.servlet.http.HttpSession;

import main.model.SessionUser;

public class AppUtils {
	public static SessionUser sessionUser(HttpSession httpSession) {
		return(SessionUser) (httpSession != null
				&& httpSession.getAttribute(AppConstants.SESSION_USER_INFO) != null
						? httpSession.getAttribute(AppConstants.SESSION_USER_INFO)
						: null);
	}
}
