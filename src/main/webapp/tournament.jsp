<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events / Tournaments - Online Gaming Site</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a001a;
            height: 100vh;
            color: white; 
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            color: #ffffff !important;
        }
        .navbar-nav .nav-link {
            color: #ffffff !important;
        }
        .container {
            margin-top: 40px;
        }
        .card {
            margin-bottom: 20px;
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-title {
            font-size: 1.5rem;
            color: #343a40;
        }
        .card-text {
            color: #6c757d;
        }
        .sidebar {
            background: red;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .sidebar h4 {
            margin-bottom: 15px;
        }
        .list-group-item {
            border: none;
            padding: 10px 0;
        }
        .list-group-item a {
            color: #007bff;
        }
        .list-group-item a:hover {
            text-decoration: underline;
        }
        
                p {
            text-align: justify;
        }
        
         footer {
            background-color: black; 
            color: white;
            text-align: center;
            padding: 10px 0; 
            width: 100%; 
        }
        
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Registration.jsp">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp">Contact</a>
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
        <h1 class="text-center mb-4">Events / Tournaments</h1>
        <p class="text-center mb-4">Join exciting gaming events and showcase your skills!</p>

        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Fortnite Championship 2024</h5>
                        <p class="card-text">Event Date: <strong>October 20, 2024</strong></p>
                        <p class="card-text">Join the action and compete against the best players worldwide in the Fortnite Championship. Prizes up to $1M!</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">League of Legends World Tournament</h5>
                        <p class="card-text">Event Date: <strong>November 10, 2024</strong></p>
                        <p class="card-text">Watch or participate in one of the biggest eSports tournaments of the year. Can you lead your team to victory?</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Call of Duty: Warzone Ultimate Battle</h5>
                        <p class="card-text">Event Date: <strong>December 5, 2024</strong></p>
                        <p class="card-text">Get ready for the Warzone Ultimate Battle! Show off your skills in this high-stakes tournament. Are you the best soldier?</p>
                        <a href="#" class="btn btn-primary">Learn More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="sidebar">
                    <h4>Upcoming Events</h4>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="#">Valorant Global Championship - Oct 25, 2024</a></li>
                        <li class="list-group-item"><a href="#">Rocket League eSports Cup - Nov 15, 2024</a></li>
                        <li class="list-group-item"><a href="#">Overwatch League Finals - Dec 20, 2024</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
     <footer>
        <p>&copy; 2024 Online Gaming Site. All rights reserved.</p>
    </footer>
    

</body>
</html>