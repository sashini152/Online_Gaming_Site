package Servlet;

import java.io.IOException;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public loginServlet() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect to the login page or display an error message
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("password");
		RequestDispatcher dispatcher = null;	
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:4306/o_g_s","root","");
			PreparedStatement pst = con.prepareStatement("SELECT * FROM registration WHERE uemail = ? AND upwd = ?");

			
			pst.setString(1, uemail);
			pst.setString(2, upwd);
			
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				HttpSession session = request.getSession(); //handling of session
				session.setAttribute("name",rs.getString("uname"));
				dispatcher = request.getRequestDispatcher("dashboard.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
		}
		catch(Exception e) {
			e.fillInStackTrace();// Improved error logging
		}finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
		
		
		
	}

}