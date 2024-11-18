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
        /* Global Styles */
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
            background-color: rgba(0, 0, 0, 0.7); /* Dark transparent background */
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
            font-family: 'Poppins', sans-serif;        }

      
        .form-group {
            margin-bottom: 20px;
        }

       
        .alert {
            margin: 15px 0;
        }

       
        .table th, .table td {
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark"> <!-- Changed to navbar-dark for white text -->
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                <% if(session.getAttribute("userUsername")==null){ %>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="addComment.jsp">Add Comment</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Logout</a>
                    </li>
                <%} else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet">Logout</a>
                    </li>
                <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <br>
        <p></p>
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card">
                        <div class="card-header">All Comment</div>
                        <%
                            if(request.getAttribute("errors_success")!=null){
                                if(request.getAttribute("errors_success").equals(1)){
                                    %>	<div class="alert alert-success">
                                            Successful!
                                        </div>	<%
                                } else {
                                    %>	<div class="alert alert-danger">
                                            Unsuccessful!
                                        </div>	<%
                                }
                            }
                        %>
                        <div class="p-1" id="CommentDiv">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="tableTh">ID</th>
                                        <th class="tableTh">Comment</th>
                                        <th class="tableTh">Date</th>
                                        <th class="tableTh">User ID</th>
                                        <th class="tableTh">Game ID</th>
                                        <th class="tableTh">Edit</th>
                                        <th class="tableTh">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    CommentService us = new CommentService();
                                    ArrayList<Comment> arrayList = us.getComment();
                                    
                                    for (Comment Comment : arrayList) {
                                    %><tr>
                                        <td class="tableTh"><%=Comment.getId() %></td>
                                        <td class="tableTh"><%=Comment.getText() %></td>
                                        <td class="tableTh"><%=Comment.getDate() %></td>
                                        <td class="tableTh"><%=Comment.getUser_id() %></td>
                                        <td class="tableTh"><%=Comment.getGame_id() %></td>
                                        <td class="tableTh"><a class="btn btn-info" href="getComment?id=<%=Comment.getId() %>" >Edit</a></td>
                                        <td class="tableTh"><Button class="btn btn-warning" id="<%=Comment.getId() %>" onclick="clickDelete(this);">Delete</Button></td>
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
        <form action="removeComment" method="post" id="settingsForm">
            <input name="deleteId" id="removeId" required>
        </form>
    </div>

</body>
</html>
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