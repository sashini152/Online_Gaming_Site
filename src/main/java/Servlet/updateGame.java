package Servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Game;  // Import the Game model
import Service.GameService;  // Import the GameService


@WebServlet("/updateGame")
@MultipartConfig

public class updateGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public updateGame() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		Game game = new Game();  // Create a new Game object

		game.setId(Integer.parseInt(request.getParameter("id")));
		game.setTitle(request.getParameter("title"));
		game.setRelease_date(request.getParameter("release_date"));
		game.setDescription(request.getParameter("description"));
		game.setDeveloper_name(request.getParameter("developer_name"));
		game.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		game.setCost_per_item(Double.parseDouble(request.getParameter("cost_per_item")));
		
		
		

		GameService service = new GameService();  
		int res = service.editGame(game);  

		if (res == 0) {
	        request.setAttribute("errors_success", 0); 
	        request.setAttribute("game", game); 
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editGame.jsp");
	        dispatcher.forward(request, response);
	    } else if (res == 1) {
	        request.setAttribute("errors_success", 1); 
	        request.setAttribute("game", game); 
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editGame.jsp");
	        dispatcher.forward(request, response);
	    }
	}

}
