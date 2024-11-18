<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Gaming Site</title>
    
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>

    <style type="text/css">
        body {
            background-color: #1c1c1e; 
            color: white; 
        }
        .navbar {
            background-color: #2d033b; 
            color: white;
        }
        .navbar a.navbar-brand, .navbar a.nav-link {
            color: white;
        }
        .navbar a.nav-link:hover {
            color: #d4af37; 
        }
        .card {
            background-color: #2e2e2e;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }
        .card-header {
            background-color: #2d033b; 
            color: white;
            font-size: 1.2em;
            text-align: center;
        }
        .card-body label {
            color: #d4af37; 
        }
        .card-body input[type="text"],
        .card-body input[type="password"],
        .card-body input[type="number"] {
            background-color: #333; 
            color: white;
            border: 1px solid #555;
        }
        .btn-primary {
            background-color: #d4af37; 
            border-color: #d4af37;
            color: black;
        }
        .btn-primary:hover {
            background-color: white; 
            color: #d4af37;
        }
        .alert-success {
            background-color: #2e7d32; 
            color: white;
        }
        .alert-danger {
            background-color: #d32f2f; 
            color: white;
        }
        footer {
            background-color: #2d033b; 
            color: white;
            padding: 15px 0;
            text-align: center;
        }
        .container {
            margin-top: 40px;
        }
        .my-error-class {
            color: red;
        }
        .my-valid-class {
            color: green;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
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
        User user = (User) request.getAttribute("user");
        %>
        <br>
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Edit Users</div>
                        <div class="card-body">
                            <%
                            if (request.getAttribute("errors_success") != null) {
                                if (request.getAttribute("errors_success").equals(1)) {
                                    %>  
                                    <div class="alert alert-success">Successful!</div>  
                                    <%
                                } else {
                                    %>  
                                    <div class="alert alert-danger">Unsuccessful!</div>  
                                    <%
                                }
                            }
                            %>
                            <form action="updateUsers" method="post">
                                <input type="hidden" name="id" value="<%= user.getId() %>">
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="name" class="form-control" name="name" value="<%= user.getName() %>" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Phone</label>
                                    <div class="col-md-6">
                                        <input type="number" id="phone" class="form-control" name="phone" value="<%= user.getPhone() %>" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Username</label>
                                    <div class="col-md-6">
                                        <input type="text" id="username" class="form-control" name="username" value="<%= user.getUsername() %>" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <input type="password" id="password" class="form-control" name="password" value="<%= user.getPassword() %>" required>
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

    <footer>
        <p>Online Gaming Site &copy; 2024</p>
    </footer>

</body>
</html>