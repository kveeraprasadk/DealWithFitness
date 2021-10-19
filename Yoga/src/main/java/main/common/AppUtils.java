package main.common;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.Base64;
import java.util.Date;
import java.util.Optional;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import main.model.SessionUser;

public class AppUtils {
	private static final Logger log = LogManager.getLogger(AppUtils.class);

	public static SessionUser sessionUser(HttpSession httpSession) {
		return (SessionUser) (httpSession != null && httpSession.getAttribute(AppConstants.SESSION_USER_INFO) != null ? httpSession.getAttribute(AppConstants.SESSION_USER_INFO)
				: null);
	}

	public static String getTimeWithCallerTz(String dateTimeWithTimeZone, String tzOffset) throws ParseException {
		SimpleDateFormat parseByOffset = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssXXX");
		Date dateAsPerClient = parseByOffset.parse(dateTimeWithTimeZone);
		// From offset get the time zone
		TimeZone tz = getTimeZoneFromOffset(tzOffset);

		SimpleDateFormat formatter = new SimpleDateFormat("HHmm");
		formatter.setTimeZone(tz);
		log.info("converting time: {}, provided offset: {} as hour:minute: {}", dateTimeWithTimeZone, tzOffset, formatter.format(dateAsPerClient));
		return formatter.format(dateAsPerClient);
	}

	public static TimeZone getTimeZoneFromOffset(String tzOffset) {
		ZoneOffset target = ZoneOffset.of(tzOffset);
		Instant i = Instant.now().atOffset(target).toInstant();
		Optional<String> tz = ZoneId.getAvailableZoneIds().stream().filter(tzIx -> ZoneId.of(tzIx).getRules().getOffset(i).equals(target)).findFirst();
		return TimeZone.getTimeZone(tz.get());
	}

	public static String getFileNameFromFormPart(Part part) {
		// Example format of part object is form-data; name="file";
		// filename="C:\file1.zip"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
				clientFileName = clientFileName.replace("\\", "/");
				int i = clientFileName.lastIndexOf('/');
				return clientFileName.substring(i + 1);
			}
		}
		return null;
	}

	public static String asBlobEncoded(Blob blob) throws SQLException, IOException {
		if (blob != null) {
			try (InputStream inputStream = blob.getBinaryStream()) {
				try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
					byte[] buffer = new byte[4096];
					int bytesRead = -1;

					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}

					byte[] imageBytes = outputStream.toByteArray();
					return Base64.getEncoder().encodeToString(imageBytes);
				}
			}
		}
		return "";
	}
}