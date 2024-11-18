package Servlet;

import java.io.IOException;
import java.sql.Date; // Import for SQL Date
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Contact; // Updated import for Contact
import Service.ContactService; // Updated import for ContactService

/**
 * Servlet implementation class updateContact
 */
@WebServlet("/updateContact")
public class updateContact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateContact() {
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
        response.setContentType("text/html");

        Contact contact = new Contact(); // Create a new Contact object

        // Set contact properties from request parameters
        contact.setId(Integer.parseInt(request.getParameter("id"))); // ID of the contact to update
        contact.setName(request.getParameter("name")); // Set contact name
        contact.setEmail(request.getParameter("email")); // Set contact email
        contact.setMessage(request.getParameter("message")); // Set contact message
        // Set the date from the request (assumed to be in the format yyyy-MM-dd)
        String dateString = request.getParameter("date");
        contact.setDate(Date.valueOf(dateString)); // Convert string to SQL Date

        ContactService service = new ContactService(); // Create an instance of ContactService
        int res = service.editContact(contact); // Call editContact to update the contact

        // Handle the response based on the result of the update operation
        if (res == 0) {
            // Update failed
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewContact.jsp");
            request.setAttribute("errors_success", 0); // Indicate failure
            dispatcher.forward(request, response);
        } else if (res == 1) {
            // Update succeeded
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewContact.jsp");
            request.setAttribute("errors_success", 1); // Indicate success
            dispatcher.forward(request, response);
        }
    }
}
