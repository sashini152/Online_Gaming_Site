<%@page import="Model.Contact"%>
<%@page import="Service.ContactService"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Contact Messages</title>
    
    <!-- Adding Bootstrap and other libraries -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    
    <!-- Custom Styles -->
    <style type="text/css">
          body {
            background-image: url('assets/images/comments/comment1.jpg');
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
            background-color:  rgba(0, 0, 0, 0.7); 
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
            background-color:#0b12f0;
        }
         .form-control {
            background-color: #34495e
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

        .table th, .table td {
            color: white; 
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
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
            <div class="card-header text-center">
                View Contact Messages
            </div>
            <div class="card-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Message</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        // Create an instance of ContactService
                        ContactService contactService = new ContactService();
                        // Get the list of contacts
                        ArrayList<Contact> contactList = contactService.getContacts();

                        // Loop through each contact and display in the table
                        for (Contact contact : contactList) {
                        %>
                        <tr>
                            <td><%= contact.getId() %></td>
                            <td><%= contact.getName() %></td>
                            <td><%= contact.getEmail() %></td>
                            <td><%= contact.getMessage() %></td>
                            <td><%= contact.getDate() %></td>
                            <td>
                                <!-- Edit Button -->
                                <a href="editContact.jsp?id=<%= contact.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                                <!-- Delete Button -->
                                <button class="btn btn-danger btn-sm" id="deleteBtn<%= contact.getId() %>" onclick="confirmDelete(<%= contact.getId() %>);">Delete</button>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div style="display: none;">
        <form action="removeContact" method="post" id="deleteContactForm">
            <input name="deleteId" id="removeContactId" required>
        </form>
    </div>

    <script>
        function confirmDelete(contactId) {
            var r = confirm("Are you sure you want to delete this contact message?");
            if (r == true) {
                document.getElementById("removeContactId").value = contactId;
                document.getElementById("deleteContactForm").submit();
            }
        }
    </script>
</body>
</html>