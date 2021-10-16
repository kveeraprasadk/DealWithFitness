package main.service.trainer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TrainerLogoutServlet
 */
public class TrainerLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		 if (session != null) {
	            session.removeAttribute("traineremail");	            
            	session.removeAttribute("trainername");            	
            	session.removeAttribute("trainerexperience");
            	session.removeAttribute("trainerqualification");
            	session.removeAttribute("trainerexpertise");
            	session.removeAttribute("trainerphone");
            	session.removeAttribute("trainerpassword");
            	
            	session.removeAttribute("trainerschedule");
            	session.removeAttribute("trainerclasslevel");
            	session.removeAttribute("trainermonthlyfees");
            	session.removeAttribute("trainerexpertise2");
            	session.removeAttribute("trainerschedule2");
            	session.removeAttribute("trainerclasslevel2");
            	session.removeAttribute("trainermonthlyfees2");
            	session.removeAttribute("trainerexpertise3");
            	session.removeAttribute("trainerschedule3");
            	session.removeAttribute("trainerclasslevel3");
            	session.removeAttribute("trainermonthlyfees3");
            	session.removeAttribute("traineraboutme");
            	session.removeAttribute("trainercertificatefileName1");
            	session.removeAttribute("trainercertificatefileName2");
            	session.removeAttribute("trainercertificatefileName3");
	           session.invalidate();
	             
	            RequestDispatcher dispatcher = request.getRequestDispatcher("Trainer.jsp");
	            dispatcher.forward(request, response);
		}
	}

}
