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
 * Servlet implementation class insertContact
 */
@WebServlet("/insertContact")
public class insertContact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertContact() {
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

        // Create a new Contact object
        Contact contact = new Contact();

        // Set the contact properties from request parameters
        contact.setName(request.getParameter("name")); // Set name
        contact.setEmail(request.getParameter("email")); // Set email
        contact.setMessage(request.getParameter("message")); // Set message
        // Set the date from the request (assumed to be in the format yyyy-MM-dd)
        String dateString = request.getParameter("date");
        contact.setDate(Date.valueOf(dateString)); // Convert string to SQL Date

        // Create an instance of ContactService to handle the insert operation
        ContactService service = new ContactService();
        int res = service.addContact(contact); // Call the method to insert contact

        // Handle the response based on the result of the insert operation
        if (res == 0) {
            // Insertion failed
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addContact.jsp");
            request.setAttribute("errors_success", 0); // Indicate failure
            dispatcher.forward(request, response);
        } else if (res == 1) {
            // Insertion succeeded
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addContact.jsp");
            request.setAttribute("errors_success", 1); // Indicate success
            dispatcher.forward(request, response);
        }
    }
}