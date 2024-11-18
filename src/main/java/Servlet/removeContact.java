package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.ContactService; // Updated import for ContactService

/**
 * Servlet implementation class removeContact
 */
@WebServlet("/removeContact")
public class removeContact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeContact() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optionally handle GET requests if needed
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ContactService service = new ContactService(); // Updated to ContactService
        int res = service.deleteContact(Integer.parseInt(request.getParameter("deleteId"))); // Update to deleteContact

        // Set success or error attribute based on result
        if (res == 1) {
            request.setAttribute("errors_success", 1); // Indicate success
        } else {
            request.setAttribute("errors_success", 0); // Indicate failure
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewContact.jsp"); // Updated JSP page
        dispatcher.forward(request, response);
    }
}