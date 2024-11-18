<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Gaming System</title>
    
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
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh; 
        }

        
        .container {
            flex: 1;
        }

       
        .navbar {
            background-color: #2d033b; 
        }

        .navbar-brand,
        .nav-link {
            color: white; 
        }

        .nav-link:hover {
            color: #d4af37; 
        }

       
        .card {
            background-color: #2e2e2e; 
            border: none; 
            margin-top: 20px;
        }

        .card-header {
            background-color: #2e2e2e;
            color: white; 
        }

        .card-body {
            color: lightgray; 
        }

        
        .table {
            background-color: #2e2e2e; 
            color: white; 
            margin-top: 20px; 
        }

        .table th, .table td {
            border-top: none;
        }

        .table a.btn {
            background-color: #d4af37; 
            color: black; 
        }

        .table a.btn:hover {
            background-color: #b38d00; 
        }

       
        footer {
            background-color: #2d033b; 
            color: white;
            text-align: center;
            padding: 20px 0; 
            margin-top: auto; 
            width: 100%;
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
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming System</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                <% if(session.getAttribute("userUsername") == null) { %>
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

    <div class="container">
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-header">All Users</div>
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
                        <div class="p-1" id="usersDiv">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="tableTh">ID</th>
                                        <th class="tableTh">Name</th>
                                        <th class="tableTh">Phone</th>
                                        <th class="tableTh">Username</th>
                                        <th class="tableTh">Edit</th>
                                        <th class="tableTh">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        UserService us = new UserService();
                                        ArrayList<User> arrayList = us.getUsers();

                                        for (User users : arrayList) {
                                    %>
                                    <tr>
                                        <td class="tableTh"><%= users.getId() %></td>
                                        <td class="tableTh"><%= users.getName() %></td>
                                        <td class="tableTh"><%= users.getPhone() %></td>
                                        <td class="tableTh"><%= users.getUsername() %></td>
                                        <td class="tableTh"><a class="btn btn-info" href="getUsers?id=<%= users.getId() %>">Edit</a></td>
                                        <td class="tableTh"><button class="btn btn-warning" id="<%= users.getId() %>" onclick="clickDelete(this);">Delete</button></td>
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

    <div style="display: none;">
        <form action="removeUsers" method="post" id="settingsForm">
            <input name="deleteId" id="removeId" required>
        </form>
    </div>

    <footer>
        <p>&copy; 2024 Online Gaming System. All rights reserved.</p>
    </footer>

    <script>
        function clickDelete(id) {
            var r = confirm("If you want to remove data?");
            if (r == true) {
                var did = id.id;
                document.getElementById("removeId").value = did;
                document.getElementById("settingsForm").submit();
            }
        }
    </script>
</body>
</html>