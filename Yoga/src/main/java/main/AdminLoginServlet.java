package main;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.common.DBConnection;
import main.common.EncodeDecodeSHA256;

/**
 * Servlet implementation class AdminLoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8");
	    
	    String username = (String)request.getParameter("username");
        String pass = (String)request.getParameter("password");
        
     //   Base64.Encoder enc = Base64.getEncoder();
        // encode data using BASE64
    //       String password = enc.encodeToString(pass.getBytes());
        String password=null;
		try {
			password = EncodeDecodeSHA256.toHexString(EncodeDecodeSHA256.getSHA(pass));
		} catch (NoSuchAlgorithmException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
           System.out.println("encoded value is \t" + password );
           
           Connection con = null;
          
               con = DBConnection.createConnection();
               
               String cntQuery = "SELECT count(*) FROM dwfadmin where (username='"+username+"' and password='"+password+"')";
               PreparedStatement stat;
               String Countrow=null;
   			try {
   				stat = con.prepareStatement(cntQuery);
   				 ResultSet rs = stat.executeQuery();
   		            rs.next();
   		            Countrow = rs.getString(1);
   		            
   			} catch (SQLException e1) {
   				// TODO Auto-generated catch block
   				e1.printStackTrace();
   			}
   			System.out.println("count is::"+Countrow);
         
   			if(Countrow.equals("1")){	
   				HttpSession session = request.getSession(false);
   				session.setAttribute("adminemail",username);
              	   System.out.println("Login successfull");            	   
	               response.getWriter().write("Login Success");   
               }else{
            	   System.out.println("Invalid Credentials");            	   
	               response.getWriter().write("Invalid Credentials");       
               }            
           
       }

}

