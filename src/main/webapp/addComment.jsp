<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Gaming Site</title>

    <!-- Adding Bootstrap and other libraries -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    
    <!-- Custom Styles -->
    <style type="text/css">
        
        body {
            background-image: url('assets/images/category/addCategory.jpeg');
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
    <!-- Navbar with new color scheme -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewComment.jsp">All comment</a>
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

    <!-- Main content with form -->
    <div class="container">
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add Comment</div>
                        <div class="card-body">
                            <% if(request.getAttribute("errors_success") != null) {
                                if(request.getAttribute("errors_success").equals(1)) { %>
                                    <div class="alert alert-success">Comment added successfully!</div>
                                <% } else { %>
                                    <div class="alert alert-danger">Failed to add comment!</div>
                                <% }
                            } %>

                            <!-- Comment form -->
                            <form id="commentForm" action="insertComment" method="post">
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Comment</label>
                                    <div class="col-md-6">
                                        <input type="text" id="text" class="form-control" name="text" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Date</label>
                                    <div class="col-md-6">
                                        <input type="date" id="date" class="form-control" name="date" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">User</label>
                                    <div class="col-md-6">
                                        <select id="user_id" class="form-control" name="user_id" required>
                                            <% UserService us = new UserService();
                                               ArrayList<User> arrayList = us.getUsers();
                                               for (User users : arrayList) { %>
                                                <option value="<%= users.getId() %>"><%= users.getName() %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Game</label>
                                    <div class="col-md-6">
                                        <select id="game_id" class="form-control" name="game_id" required>
                                            <% GameService v = new GameService();
                                               ArrayList<Game> arrayList1 = v.getGame();
                                               for (Game game : arrayList1) { %>
                                                <option value="<%= game.getId() %>"><%= game.getTitle() %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">Add Comment</button>
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
            // Initialize the jQuery Validate plugin
            $("#commentForm").validate({
                rules: {
                    text: {
                        required: true,
                        minlength: 5 
                    },
                    date: {
                        required: true,
                        date: true 
                    },
                    user_id: {
                        required: true 
                    },
                    game_id: {
                        required: true 
                    }
                },
                messages: {
                    text: {
                        required: "Please enter a comment",
                        minlength: "Your comment must be at least 5 characters long"
                    },
                    date: {
                        required: "Please select a date",
                        date: "Please enter a valid date"
                    },
                    user_id: {
                        required: "Please select a user"
                    },
                    game_id: {
                        required: "Please select a game"
                    }
                },
                errorClass: "my-error-class", 
                validClass: "my-valid-class"   
            });
        });
    </script>
</body>
</html>