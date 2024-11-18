<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Online Game Browsing System</title>
    
    <!-- Bootstrap CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Croppie CSS -->
    <link rel="stylesheet" href="assets/css/croppie.css" />
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #1c1c1e; /* Dark background for gaming feel */
            color: white; /* White text throughout */
        }
        .navbar {
            background-color: #2d033b; /* Dark purple background */
        }
        .navbar-brand, .nav-link {
            color: white !important; /* White text on navbar */
        }
        .nav-link:hover {
            color: #d4af37 !important; /* Gold hover effect */
        }
        .navbar-toggler {
            border-color: #d4af37; /* Gold color for mobile nav toggle */
        }
        .card {
            background-color: #2e2e2e; /* Dark card background */
            color: #f8f9fa; /* Light text */
            border: none;
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
        }
        .card-title {
            color: white; /* White titles */
            height: 3em; /* Uniform title height */
            overflow: hidden;
        }
        .card-text {
            color: #dcdcdc; /* Light gray text */
            height: 4em; /* Uniform text height */
            overflow: hidden;
        }
        .btn-demo, .btn-buy {
            color: white;
        }
        .btn-demo {
            background-color: #17a2b8; /* Keep a distinct demo button color */
        }
        .btn-buy {
            background-color: #28a745; /* Green for buy button */
        }
        .btn:hover {
            background-color: #d4af37; /* Gold hover effect for buttons */
        }
        .footer {
            background-color: #2d033b; /* Dark purple footer */
            color: white;
            padding: 20px 0;
            text-align: center;
        }
        /* Customize Bootstrap Alerts */
        .alert {
            background-color: #2e2e2e;
            border: 1px solid #d4af37;
            color: white;
        }
        /* For spacing and responsiveness */
        .my-5 {
            margin-top: 3rem !important;
            margin-bottom: 3rem !important;
        }
    </style>

    <!-- jQuery and Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <script src="assets/js/sweetalert.min.js"></script>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Game Browsing System</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" 
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userUsername") != null){ %>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logoutServlet">Logout</a>
                        </li>
                    <% } else { %>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container my-5">
        <!-- Heading for Available Games -->
        <h2 class="text-center mb-4">Available Games</h2>
        <div class="row" id="GameDiv">
            <%
                GameService gameService = new GameService();
                ArrayList<Game> gameList = gameService.getGame();
                
                if(gameList != null && !gameList.isEmpty()){
                    for (Game game : gameList) {
            %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                <div class="card h-100">
                    <img src="images/<%=game.getGame_image()%>" class="card-img-top" alt="<%=game.getTitle()%> Image">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= game.getTitle() %></h5>
                        <p class="card-text"><strong>Price:</strong> Rs. <%= game.getCost_per_item() %></p>
                        <p class="card-text"><%= game.getDescription() %></p>
                        <p class="card-text"><strong>Developer:</strong> <%= game.getDeveloper_name() %></p>
                        <p class="card-text"><strong>Release Date:</strong> <%= game.getRelease_date() %></p>
                        <div class="mt-auto">
                            <a href="playDemoServlet?gameId=<%= game.getId() %>" class="btn btn-demo btn-block mb-2">Play Demo</a>
                            <a href="buyNowServlet?gameId=<%= game.getId() %>" class="btn btn-buy btn-block">Buy Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <div class="col-12">
                <div class="alert alert-warning text-center" role="alert">
                    No games available at the moment. Please check back later!
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Online Game Browsing System. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Optional JavaScript -->
    <script>
        // Initialize any JavaScript plugins or custom scripts here
    </script>
</body>
</html>