package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Game;
import Service.GameService;


@WebServlet("/getGames")
public class getGames extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public getGames() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        GameService gameService = new GameService();
        Game game = null;

        try {
            String idParam = request.getParameter("id");
            if(idParam != null && !idParam.isEmpty()){
                int gameId = Integer.parseInt(idParam);
                game = gameService.getGame(gameId);
            } else {
                System.out.println("No 'id' parameter provided.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid 'id' format: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error fetching game: " + e.getMessage());
        }

        request.setAttribute("game", game);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editGame.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
