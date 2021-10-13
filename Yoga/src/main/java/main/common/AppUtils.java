package main.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import main.model.SessionUser;

public class AppUtils {
	public static SessionUser sessionUser(HttpSession httpSession) {
		return (SessionUser) (httpSession != null && httpSession.getAttribute(AppConstants.SESSION_USER_INFO) != null
				? httpSession.getAttribute(AppConstants.SESSION_USER_INFO)
				: null);
	}

	public static String convertTimeToUTC(String dateTimeWithTimeZone) throws ParseException {
		
		SimpleDateFormat parseByOffset = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssXXX");
		Date localDate = parseByOffset.parse(dateTimeWithTimeZone);
		
		SimpleDateFormat formatInUTC = new SimpleDateFormat("HHmm");
		return formatInUTC.format(localDate);
	}
}