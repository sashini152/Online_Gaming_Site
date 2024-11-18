<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News / Blog - Online Gaming Site</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #b497ed;
        }
        
        body {
            background: #1a001a;
            height: 100vh; 
        }

        .card {
            background-color: white; 
            border: 3px solid black;
            border-radius: 15px;
        }

        .navbar {
            background-color: black;
            padding-top: 5px;
            padding-bottom: 5px;
            height: 75px;
            display: flex; 
            align-items: center;
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

        .news-item {
            margin-bottom: 30px;
            padding: 20px;
            background: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .sidebar {
            background: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .comments-section {
            margin-top: 30px;
            padding: 20px;
            background: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .comment {
            border-bottom: 1px solid #e9ecef;
            padding: 10px 0;
        }

        .comment:last-child {
            border-bottom: none;
        }
        
        /* Footer Styles */
        footer {
            background-color: #2d033b;
            color: white; 
            text-align: center; 
            padding: 10px 0; 
            width: 100%; 
        }

        
        h1 {
            color: white; 
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="user.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Logout</a>
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
        <h1 class="text-center">News / Blog</h1>
        <p class="text-center">Stay updated with the latest game releases, features, and news!</p>

        <div class="row">
            <div class="col-md-8">
                <div class="news-item">
                    <h3>New Game Release: Adventure Quest</h3>
                    <p class="text-muted">Published on: <strong>October 6, 2024</strong></p>
                    <p>Get ready to embark on an epic journey in Adventure Quest, launching next week! Explore new worlds and conquer challenges.</p>
                    <p><strong>Categories:</strong> Game Releases, Adventure</p>
                    <a href="#" class="btn btn-info btn-sm">Read More</a>
                </div>

                <div class="news-item">
                    <h3>Site Feature Update: Enhanced User Profiles</h3>
                    <p class="text-muted">Published on: <strong>October 5, 2024</strong></p>
                    <p>We’ve upgraded our user profile feature! Now you can customize your profile with more options and privacy settings.</p>
                    <p><strong>Categories:</strong> Updates, Features</p>
                    <a href="#" class="btn btn-info btn-sm">Read More</a>
                </div>

                <div class="news-item">
                    <h3>Industry News: Gaming Convention Highlights</h3>
                    <p class="text-muted">Published on: <strong>October 4, 2024</strong></p>
                    <p>This year's gaming convention showcased incredible new titles and innovations in the gaming industry. Check out our summary of the highlights!</p>
                    <p><strong>Categories:</strong> Industry News, Events</p>
                    <a href="#" class="btn btn-info btn-sm">Read More</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="sidebar">
                    <h4>Popular Articles</h4>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="#">Top 10 Upcoming Games in 2025</a></li>
                        <li class="list-group-item"><a href="#">5 Tips for New Gamers</a></li>
                        <li class="list-group-item"><a href="#">Understanding Game Genres</a></li>
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