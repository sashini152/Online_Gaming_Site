<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Contact Message</title>

    <!-- Adding Bootstrap and other libraries -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

    <!-- Custom Styles -->
    <style type="text/css">
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
                    <% if(session.getAttribute("userEmail") == null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="viewContact.jsp">All Contact</a>
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
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add Contact Message</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errors_success") != null) {
                                if(request.getAttribute("errors_success").equals(1)) { %>
                                    <div class="alert alert-success">Contact message added successfully!</div>
                                <% } else { %>
                                    <div class="alert alert-danger">Failed to add contact message!</div>
                                <% }
                            } %>

                            <!-- Contact form -->
                            <form id="contactForm" action="insertContact" method="post">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" id="name" class="form-control" name="name" required>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" class="form-control" name="email" required>
                                </div>

                                <div class="form-group">
                                    <label for="message">Message</label>
                                    <textarea id="message" class="form-control" name="message" required></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="date">Date</label>
                                    <input type="date" id="date" class="form-control" name="date" required>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Add Contact Message</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        $(document).ready(function() {
            $("#contactForm").validate({
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