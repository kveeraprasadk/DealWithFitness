package main.service.common;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.common.AppUtils;
import main.common.Json;
import main.model.SessionUser;

@WebServlet(name = "/LoginQueryService", urlPatterns = "/whoami")
public class LoginQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionUser user = AppUtils.sessionUser(request.getSession());
		if (user != null) {
			response.setContentType("applicaton/json");
			response.getWriter().write(Json.stringify(Collections.singletonMap(user.getEmail(), user)));
		} else {
			response.setStatus(401);
		}
	}
}
