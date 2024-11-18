<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Gaming Site</title>

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/croppie.css">
    <link rel="stylesheet" href="assets/css/styles.css"> 
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <script src="assets/js/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>

    <style>
        html, body {
            height: 100%; 
            margin: 0;
            display: flex; 
            flex-direction: column; 
            background-color: #1c1c1e; 
            background-image: url('assets/images/category/addCategory.jpeg'); 
            background-size: cover; 
            background-position: center; 
            background-repeat: no-repeat; 
            color: white; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        }

       
        .main-content {
            flex: 1; 
            padding: 20px;
        }

       
        .navbar {
            background-color: #2d033b; 
            background-image: url('assets/images/navbar-bg.jpg'); 
            background-size: cover; 
            background-position: center;
            border-bottom: 2px solid #d4af37; 
        }

        .navbar-nav .nav-link {
            color: white; 
            transition: color 0.3s; 
        }

        .navbar-nav .nav-link:hover {
            color: #d4af37; 
        }

        /* Card Styles */
        .card {
            background-color: #2e2e2e; 
            border: none;
            margin-bottom: 20px; 
        }

        .card-header {
            color: white; 
            font-weight: bold; 
        }

        .card-body {
            color: lightgray; 
        }


        .btn-primary {
            background-color: #d4af37; 
            border-color: #d4af37;
            transition: background-color 0.3s, border-color 0.3s; 
        }

        .btn-primary:hover {
            background-color: #c49b29; 
            border-color: #c49b29; 
        }

       
        footer {
            background-color: #2d033b; 
            color: white; 
            text-align: center;
            padding: 10px 0; 
            width: 100%; 
        }

       
        @media (max-width: 768px) {
            .navbar-nav {
                margin-top: 10px; 
            }
            .card {
                margin: 15px; 
            }
        }
    </style>
</head>
<body>
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
                            <a class="nav-link" href="login.jsp">Login</a>
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

    <div class="main-content">
        <div class="container">
            <br>
            <main class="login-form">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">Add Users</div>
                            <div class="card-body">
                                <%
                                    if(request.getAttribute("errors_success") != null) {
                                        if(request.getAttribute("errors_success").equals(1)) {
                                %>  
                                <div class="alert alert-success">
                                    Successful!
                                </div>
                                <%
                                        } else {
                                %>  
                                <div class="alert alert-danger">
                                    Unsuccessful!
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <form action="insertUsers" method="post">
                                    <div class="form-group row">
                                        <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
                                        <div class="col-md-6">
                                            <input type="text" id="name" class="form-control" name="name" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="phone" class="col-md-4 col-form-label text-md-right">Phone</label>
                                        <div class="col-md-6">
                                            <input type="text" id="phone" class="form-control" name="phone" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="username" class="col-md-4 col-form-label text-md-right">Username</label>
                                        <div class="col-md-6">
                                            <input type="text" id="username" class="form-control" name="username" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                        <div class="col-md-6">
                                            <input type="password" id="password" class="form-control" name="password" required>
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
    </div>

    <footer>
        <p>&copy; 2024 Online Gaming Site. All rights reserved.</p>
    </footer>

</body>
</html>