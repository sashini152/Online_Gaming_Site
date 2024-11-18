<%@page import="Model.Contact"%>
<%@page import="Service.ContactService"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Contact</title>
    
    <!-- Bootstrap and other library includes -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

    <!-- Custom styles -->
    <style>
        body {
            background-image: url('assets/images/purple 1.jpg');
            background-size: cover;
            color: white;
        }

        .my-error-class {
            color: red;
        }
        .my-valid-class {
            color: green;
        }

        .card {
            background-color: rgba(0, 0, 0, 0.7); 
            border-radius: 10px;
            color: white;
        }

        .navbar {
            background-color: black;
            padding-top: 5px;
            padding-bottom: 5px;
            height: 75px; 
            display: flex;
            align-items: center; 
            justify-content: center; 
            position: relative;
        }

        .navbar-brand {
            position: absolute;
            left: 10px; 
            color: #ecf0f1 !important;
            font-size: 20px; 
        }

        .nav-link {
            color: #ecf0f1 !important;
            font-size: 20px; 
            margin-left: 15px;
            margin-right: 15px;
        }

        .btn-primary {
            background-color: #990bf0; 
            border: none;
        }

        .btn-primary:hover {
            background-color: #0b12f0;
        }

        .form-control {
            background-color: #34495e; 
            color: white;
            border: none;
        }

        .form-control:focus {
            border-color: #e74c3c;
            box-shadow: none;
        }

     
        .container {
            margin-top: 50px;
        }

        .card-header {
            text-align: center;
            font-size: 24px;
            color: #990bf0;
            font-weight: bold; 
            font-family: 'Poppins', sans-serif; 
        }

        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if (session.getAttribute("userEmail") == null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="addContact.jsp">Add Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Logout</a>
                        </li>
                    <% } else { %>
                        <li class="nav-item">
                            <a class="nav-link" href="logoutServlet">Logout</a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card">
            <div class="card-header">
                Edit Contact
            </div>
            <div class="card-body">
                <% 
                    // Get the contact ID from the request
                    String contactIdParam = request.getParameter("id");
                    int contactId = Integer.parseInt(contactIdParam);
                    
                    // Create an instance of ContactService
                    ContactService contactService = new ContactService();
                    // Get the contact details by ID
                    Contact contact = contactService.getContact(contactId);
                %>

                <form id="editContactForm" action="updateContact" method="post">
                    <input type="hidden" name="id" value="<%= contact.getId() %>">
                    
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="<%= contact.getName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= contact.getEmail() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" name="message" required><%= contact.getMessage() %></textarea>
                    </div>

                    <div class="form-group">
                        <label for="date">Date</label>
                        <input type="date" class="form-control" id="date" name="date" value="<%= contact.getDate() %>" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Contact</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Initialize jQuery Validate plugin
            $("#editContactForm").validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2 
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    message: {
                        required: true,
                        minlength: 10 
                    },
                    date: {
                        required: true,
                        date: true 
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name",
                        minlength: "Your name must be at least 2 characters long"
                    },
                    email: {
                        required: "Please enter your email",
                        email: "Please enter a valid email address"
                    },
                    message: {
                        required: "Please enter a message",
                        minlength: "Your message must be at least 10 characters long"
                    },
                    date: {
                        required: "Please select a date",
                        date: "Please enter a valid date"
                    }
                },
                errorClass: "my-error-class",
                validClass: "my-valid-class"
            });
        });
    </script>

</body>
</html>