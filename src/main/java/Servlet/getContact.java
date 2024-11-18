
package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Contact; // Updated import for Contact
import Service.ContactService; // Updated import for ContactService

/**
 * Servlet implementation class getContact
 */
@WebServlet("/getContact")
public class getContact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public getContact() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        ContactService contactService = new ContactService(); // Updated to ContactService
        Contact contact = contactService.getContact(Integer.parseInt(request.getParameter("id"))); // Updated to getContact

        request.setAttribute("contact", contact); // Updated attribute name

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editContact.jsp"); // Updated JSP page
        dispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}