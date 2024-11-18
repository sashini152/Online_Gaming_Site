<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Online Video Browsing System</title>

    <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Croppie CSS -->
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <!-- jQuery and other JavaScript libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <script src="assets/js/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>

    <!-- Custom CSS -->
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

    <div class="container">
        <%
        Comment comment = (Comment) request.getAttribute("comment");
        %>

        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Edit Comment</div>
                        <div class="card-body">
                            <!-- Success or Error Message -->
                            <%
                                if (request.getAttribute("errors_success") != null) {
                                    if (request.getAttribute("errors_success").equals(1)) {
                            %>
                            <div class="alert alert-success">Comment updated successfully!</div>
                            <%
                                    } else {
                            %>
                            <div class="alert alert-danger">Failed to update comment. Please try again.</div>
                            <%
                                    }
                                }
                            %>

                            <!-- Comment Form -->
                            <form id="commentForm" action="updateComment" method="post">
                                <input type="hidden" name="id" value="<%= comment.getId() %>">

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Comment</label>
                                    <div class="col-md-6">
                                        <input type="text" id="text" class="form-control" name="text"
                                            value="<%= comment.getText() %>" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Date</label>
                                    <div class="col-md-6">
                                        <input type="date" id="date" class="form-control" name="date"
                                            value="<%= comment.getDate() %>" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">User</label>
                                    <div class="col-md-6">
                                        <select id="user_id" class="form-control" name="user_id" required>
                                            <%
                                                UserService us = new UserService();
                                                ArrayList<User> userList = us.getUsers();
                                                for (User user : userList) {
                                            %>
                                            <option value="<%= user.getId() %>"><%= user.getName() %></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Game</label>
                                    <div class="col-md-6">
                                        <select id="game_id" class="form-control" name="game_id" required>
                                            <%
                                                GameService gameService = new GameService();
                                                ArrayList<Game> gameList = gameService.getGame();
                                                for (Game game : gameList) {
                                            %>
                                            <option value="<%= game.getId() %>"><%= game.getTitle() %></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">Edit</button>
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
            // Initialize jQuery Validate plugin
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
                        required: true                    }
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