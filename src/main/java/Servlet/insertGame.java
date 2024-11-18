package Servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLOutput;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Game;
import Service.GameService;


@WebServlet("/insertGame")
@MultipartConfig

public class insertGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public insertGame() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		Game game = new Game();

		game.setTitle(request.getParameter("title"));
		game.setRelease_date(request.getParameter("release_date"));
		game.setDescription(request.getParameter("description"));
		game.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
		game.setDeveloper_name(request.getParameter("developer_name"));
		game.setCost_per_item(Double.parseDouble(request.getParameter("cost_per_item")));
		Part part = request.getPart("game_image");
		game.setGame_image(part.getSubmittedFileName());
		
		
		
		

		GameService gameService = new GameService();
		int result = gameService.addGame(game);
		
		String path = getServletContext().getRealPath("/images"); // Path within the webapp folder
		String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		part.write(path + File.separator + fileName);
		
	  
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddNewGame.jsp");
		if (result == 0) {
			
	        request.setAttribute("errors_success", 0);
			
			
			
		} else if (result == 1) {
			
			request.setAttribute("errors_success", 1);
			
		}
		
		dispatcher.forward(request, response);
	}

}
