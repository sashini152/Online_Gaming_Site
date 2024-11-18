<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Gaming Site</title>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    
    <style type="text/css">
        
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
        
        .navbar {
            background-color: #2d033b; 
            background-image: url('assets/img/navbar-bg.jpg'); 
            background-size: cover;
        }

        .navbar-brand, .nav-link {
            color: white !important;
        }

        .nav-link:hover {
            color: #d4af37 !important; 
        }

        
        .card {
            background-color: #2e2e2e;
            color: white;
            
        }

        .card-header {
            background-color: #2d033b; 
            color: #d4af37; 
            font-weight: bold;
        }

        .form-control {
            background-color: #3e3e3e;
            color: white;
            
        }

        .form-control:focus {
            border-color: #d4af37;
            box-shadow: 0 0 5px #d4af37;
        }

        
        .btn-primary {
            background-color: #2d033b; 
            color: white;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn-primary:hover {
            background-color: #d4af37; 
            color: black;
        }

       
        .footer {
            background-color: #2d033b; 
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -5px 5px rgba(0,0,0,0.5); 
        }

        
        .my-error-class {
            color: red;
        }

        .my-valid-class {
            color: green;
        }

        
        .form-control:hover {
            border-color: #d4af37;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="category.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("categoryEmail") == null){ %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                    <%} else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet">Logout</a>
                    </li>
                    <%} %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <%
        Category category = (Category) request.getAttribute("category");
        %>
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Categories</div>
                        <div class="card-body">
                        <%
                            if (request.getAttribute("errors_success") != null) {
                                if (request.getAttribute("errors_success").equals(1)) {
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
                            <form action="updateCategory" method="post">
                                <input type="hidden" name="id" value="<%=category.getId() %>" >

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="name" class="form-control" name="name" value="<%=category.getName() %>" required>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Description</label>
                                    <div class="col-md-6">
                                        <input type="text" id="description" class="form-control" name="description" value="<%=category.getDescription() %>" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        Edit
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
        <p>&copy; 2024 Online Gaming Site. All rights reserved.</p>
    </footer>
</body>
</html>