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
            background-image: url('assets/images/category/DashBoard.jpg'); 
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            font-family: 'Poppins', sans-serif; 
        }

        .navbar {
            background-color: #2d033b; 
            padding: 15px;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand, .nav-link {
            color: white !important;
            font-size: 18px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .nav-link:hover {
            color: #d4af37 !important; 
        }

        .navbar-toggler {
            background-color: white;
        }

        .container {
            margin-top: 30px;
        }

        .card {
            background-color: #2e2e2e; 
            border: none;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            transition: all 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.5);
        }

        .card-header {
            background-color: transparent;
            color: #d4af37; 
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            padding: 15px;
        }

        .card-body a {
            color: white;
            background-color: #2d033b; 
            border: none;
            font-size: 18px;
            padding: 10px;
            display: block;
            text-align: center;
            margin-bottom: 15px;
            border-radius: 5px;
            text-transform: uppercase;
            transition: background 0.3s ease;
        }

        .card-body a:hover {
            background-color: #d4af37; 
            color: black;
        }

        footer {
            background-color: #2d033b; 
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 50px;
        }

        footer p {
            margin: 0;
            font-size: 16px;
            letter-spacing: 1px;
        }

    </style>
</head>
<body>
    <!-- Navbar -->
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
                        <a class="nav-link" href="user.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Logout</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    
    <div class="container">
        <br>
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Dashboard</div>
                        <div class="card-body">
                            <a href="addCategory.jsp">Add Category</a>
                            <a href="viewCategory.jsp">All Category</a>
                            <a href="addComment.jsp">Add Comment</a>
                            <a href="viewComment.jsp">All Comment</a>
                            <a href="addUser.jsp">Add User</a>
                            <a href="viewUser.jsp">All User</a>
                            <a href="AddNewGame.jsp">Add Games</a>
                            <a href="viewGame.jsp">All Games</a>
                            <a href="addContact.jsp">Add Contact</a>
                            <a href="viewContact.jsp">All Contact</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Online Gaming Site. All Rights Reserved.</p>
        </div>
    </footer>

    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>