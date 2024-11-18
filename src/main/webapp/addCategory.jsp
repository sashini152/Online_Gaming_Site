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
    
    <style>
        
        body {
            background-image: url('assets/images/category/addCategory.jpeg'); 
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
            height: 100vh;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(28, 28, 30, 0.8); 
            z-index: 0;
        }

        
        .container, .navbar, .footer {
            position: relative;
            z-index: 1;
        }

        
        .navbar {
            background-color: #2d033b;
        }

        .navbar-brand, .nav-link {
            color: white !important;
        }

        .navbar-brand:hover, .nav-link:hover {
            color: #d4af37 !important;
        }

        
        .card {
            background-color: #2e2e2e;
            border: none;
            color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #2d033b;
            color: white;
            font-weight: bold;
        }

        .card-body {
            color: #e0e0e0;
        }

        .form-control {
            background-color: #1c1c1e;
            color: white;
            border: 1px solid #555;
        }

        .form-control:focus {
            background-color: #2e2e2e;
            color: white;
            border-color: #d4af37;
        }

        
        .btn-primary {
            background-color: #2d033b;
            border-color: #2d033b;
            color: white;
        }

        .btn-primary:hover {
            background-color: #d4af37;
            border-color: #d4af37;
        }

        
        .footer {
            background-color: #2d033b;
            padding: 20px;
            color: white;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
        }

        
        .my-error-class {
            color: red;
        }

        .my-valid-class {
            color: green;
        }

        
        .login-form {
            padding: 50px 0;
        }

        .card-title {
            color: white;
        }

        .text-md-right {
            color: white;
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
                            <a class="nav-link" href="login.jsp">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Dashboard</a>
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
                        <div class="card-header">Category</div> 
                        <div class="card-body">
                        <% if (request.getAttribute("errors_success") != null) {
                            if (request.getAttribute("errors_success").equals(1)) { %>
                                <div class="alert alert-success">
                                    Successful!
                                </div>
                            <% } else { %>
                                <div class="alert alert-danger">
                                    Unsuccessful!
                                </div>
                            <% }
                        } %>
                            <form action="insertCategory" method="post">
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="name" class="form-control" name="name" required>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Description</label>
                                    <div class="col-md-6">
                                        <input type="text" id="description" class="form-control" name="description" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        Add
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <footer class="footer">
        &copy; 2024 Online Gaming Site. All rights reserved.
    </footer>
</body>
</html>