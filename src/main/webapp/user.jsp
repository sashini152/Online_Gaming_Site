<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Online Gaming Site</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        
        body {
            background-image: url('assets/images/home/background.jpg'); 
            background-size: cover; 
            background-position: center; 
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh; 
            position: relative; 
            margin: 0; 
            padding: 0; 
        }

        .navbar {
            background-color: #4b0082; 
        }

        .navbar-brand, .nav-link {
            color: #ffffff !important; 
            font-weight: bold; 
            text-transform: uppercase; 
        }

        .navbar-brand:hover, .nav-link:hover {
            color: #d3d3d3 !important; 
        }

        h1, h2 {
            color: white; 
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6); 
            text-align: center; 
        }

        .card {
            background-color: rgba(44, 44, 44, 0.9); 
            border: none;
            border-radius: 10px;
            color: white; 
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px); 
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5); 
        }

        .card-title {
            color: #c299ff; 
        }

        .card-text {
            color: #e0e0e0; 
        }

        .btn-primary {
            background-color: #6f42c1;
            border-color: #6f42c1;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #5a32a8; 
            border-color: #5a32a8;
        }

        
        .footer {
            padding: 20px;
            text-align: center;
            background-color: rgba(52, 58, 64, 0.9); 
            color: white;
            position: relative; 
            bottom: 0;
            left: 0;
            right: 0;
        }

        
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); 
            z-index: 1;
        }

        .content {
            position: relative;
            z-index: 2; 
            padding: 20px;
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
                        
                        
                        <li class="nav-item"><a class="nav-link" href="viewContact.jsp">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" href="giftCard.jsp">GiftCard</a></li>
                        <li class="nav-item"><a class="nav-link" href="news.jsp">News/Blogs</a></li>
                        <li class="nav-item"><a class="nav-link" href="privacy.jsp">Privacy & Policy</a></li>
                        <li class="nav-item"><a class="nav-link" href="friends.jsp">Invite Friends</a></li>
                        <li class="nav-item"><a class="nav-link" href="tournament.jsp">Tournament</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="logoutServlet">Logout</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5 content"> 
        <h1>Welcome to the Online Gaming Site!</h1>
        <p class="text-center">Explore a variety of games and enjoy the best gaming experience.</p>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Categories</h5>
                        <p class="card-text">Browse through different game categories.</p>
                        <a href="allcategories.jsp" class="btn btn-primary">View Categories</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Games</h5>
                        <p class="card-text">Check out the latest games available on our platform.</p>
                        <a href="allgames.jsp" class="btn btn-primary">View Games</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Comments</h5>
                        <p class="card-text">Share your thoughts about the games you played.</p>
                        <a href="viewonlyComment.jsp" class="btn btn-primary">View Comments</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="mt-5 content"> 
        <h2>Why Choose Us?</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Diverse Game Selection</h5>
                        <p class="card-text">We offer a wide range of games across various genres, ensuring there's something for everyone.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Community Engagement</h5>
                        <p class="card-text">Join our vibrant community to share tips, tricks, and experiences with fellow gamers.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Regular Updates</h5>
                        <p class="card-text">We continuously update our game library with the latest titles and features, keeping the experience fresh and exciting.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="mt-5 content"> <!-- Added content class -->
        <h2>Our Features</h2>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">User-Friendly Interface</h5>
                        <p class="card-text">Navigate our platform effortlessly with a clean and intuitive design that enhances your gaming experience.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Multiplayer Options</h5>
                        <p class="card-text">Connect with friends and other players worldwide in our engaging multiplayer games.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Achievements and Leaderboards</h5>
                        <p class="card-text">Track your progress and compete with others through achievements and leaderboards, fostering a sense of accomplishment.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer mt-5">
        <p>&copy; 2024 Online Gaming Site. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>