<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Gaming Site</title>

    <!--  external JS and CSS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
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
            background-image: url('assets/images/navbar-background.jpg'); 
            background-size: cover;
            background-position: center;
            color: white;
        }

        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: bold;
        }

        .navbar-brand:hover, .nav-link:hover {
            color: #d4af37 !important; 
        }

        
        .card {
            background-color: #2e2e2e;
            border: 1px solid #2d033b;
            color: white;
        }

        .card-header {
            background-color: #2d033b;
            color: #d4af37;
            font-weight: bold;
        }

        .tableTh {
            color: white;
        }

        .card .btn-info, .card .btn-warning {
            background-color: #d4af37;
            border: none;
            color: white;
        }

        .btn-info:hover, .btn-warning:hover {
            background-color: #b8860b; 
        }

        
        table {
            width: 100%;
            margin-top: 10px;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            background-color: #2d033b;
            color: white;
        }

        td {
            background-color: #2e2e2e;
            color: #e0e0e0;
        }

        
        .footer {
            background-color: #2d033b;
            background-image: url('assets/images/footer-background.jpg'); 
            background-size: cover;
            background-position: center;
            padding: 20px;
            text-align: center;
            color: white;
            margin-top: 50px;
        }

        
        .btn {
            background-color: #d4af37;
            color: white;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #b8860b;
            color: white;
        }

        
        .alert {
            margin-top: 15px;
            color: #fff;
        }

        .alert-success {
            background-color: #abebc6;
        }

        .alert-danger {
            background-color: #dc3545;
        }

        
        @media (max-width: 768px) {
            .navbar-brand, .nav-link {
                font-size: 0.9rem;
            }
        }

    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userUsername")==null){ %>
                        <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Logout</a></li>
                    <%} else { %>
                        <li class="nav-item"><a class="nav-link" href="logoutServlet">Logout</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    
    <div class="container mt-4">
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-header">All Categories</div>
                        
                        <% if(request.getAttribute("errors_success") != null) {
                            if(request.getAttribute("errors_success").equals(1)){ %>
                                <div class="alert alert-success">Successful!</div>
                            <% } else { %>
                                <div class="alert alert-danger">Unsuccessful!</div>
                            <% }
                        } %>
                        
                        <div class="p-1" id="CategoryDiv">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Edit</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                            <%
                                CategoryService us = new CategoryService();
                                ArrayList<Category> arrayList = us.getCategory();
                                for (Category category : arrayList) { %>
                                <tr>
                                    <td><%=category.getId() %></td>
                                    <td><%=category.getName() %></td>
                                    <td><%=category.getDescription() %></td>
                                    <td><a class="btn btn-info" href="getCategory?id=<%=category.getId() %>">Edit</a></td>
                                    <td><Button class="btn btn-warning" id="<%=category.getId() %>" onclick="clickDelete(this);">Delete</Button></td>
                                </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Hidden Form for Deletion -->
    <div style="display: none;">
        <form action="removeCategory" method="post" id="settingsForm">
            <input name="deleteId" id="removeId" required>
        </form>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Online Gaming Site. All rights reserved.</p>
    </div>

    <!--  Delete Confirmation  -->
    <script>
        function clickDelete(id){
            var r = confirm("Do you really want to remove this category?");
            if (r == true) {
                var did = id.id;
                document.getElementById("removeId").value = did;
                document.getElementById("settingsForm").submit();
            }
        }
    </script>
</body>
</html>
