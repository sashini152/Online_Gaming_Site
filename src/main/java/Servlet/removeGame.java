package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.GameService;

/**
 * Servlet implementation class removeGame
 */
@WebServlet("/removeGame")
public class removeGame extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeGame() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		GameService service = new GameService();
		int result = service.deleteGame(Integer.parseInt(request.getParameter("deleteId")));

		if (result == 1) {
			request.setAttribute("errors_success", 1);
		} else {
			request.setAttribute("errors_success", 0);
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewGame.jsp");
		dispatcher.forward(request, response);
	}

}
