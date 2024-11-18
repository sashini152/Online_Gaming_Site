package Servlet;

import java.io.IOException;



//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/* public RegistrationServlet() {
	        super();
	    }
	*/
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    // Forward to the registration form page
	    RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
	    dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		
		
		RequestDispatcher dispatcher = null;	
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:4306/o_g_s","root","");
			PreparedStatement pst = con.prepareStatement("insert into registration(uname,upwd,uemail) values(?,?,?)");
			
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, uemail);  
			
			
			int rowCount = pst.executeUpdate();
			
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			 dispatcher = request.getRequestDispatcher("login.jsp");// Forward to the relevant JSP
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.fillInStackTrace();
		}finally {
	        
		}
	}
}