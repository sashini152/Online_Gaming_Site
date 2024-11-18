package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Comment;
import Service.CommentService;

@WebServlet("/insertComment")
public class insertComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public insertComment() {
        super();
       
    }

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		Comment comment =  new Comment();

		comment.setText(request.getParameter("text"));
		comment.setDate(request.getParameter("date"));
		comment.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		comment.setGame_id(Integer.parseInt(request.getParameter("game_id")));

		CommentService s = new CommentService();
		int res=s.addComment(comment);

		if(res==0) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addComment.jsp");
			request.setAttribute("errors_success", 0);
			dispatcher.forward(request, response);
		}else if(res==1) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addComment.jsp");
			request.setAttribute("errors_success", 1);
			dispatcher.forward(request, response);
		}
	}

}
