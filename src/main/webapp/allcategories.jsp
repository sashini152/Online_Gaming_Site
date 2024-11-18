<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game Categories</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1c1c1e; 
            color: #ffffff; 
        }
        .navbar {
            background-color: #2d033b; 
        }
        .navbar-nav .nav-link {
            color: #ffffff;
        }
        .navbar-nav .nav-link:hover {
            color: #d4af37; 
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            color: #d4af37; 
            margin-bottom: 30px;
        }
        .category-card {
            background-color: #2e2e2e; 
            border: none;
            border-radius: 8px;
            transition: transform 0.2s ease; 
        }
        .category-card:hover {
            transform: scale(1.05); 
        }
        .card-title {
            color: #ffffff; 
        }
        .card-text {
            color: #bbbbbb; 
        }
        .btn-primary {
            background-color: #4b0082; 
            border-color: #4b0082;
        }
        .btn-primary:hover {
            background-color: #d4af37; 
            border-color: #d4af37;
        }
        .card-img-top {
            border-bottom: 3px solid #d4af37; 
            height: 200px; 
            object-fit: cover; 
        }
        footer {
            margin-top: 50px;
            text-align: center;
            padding: 20px;
            background-color: #2d033b; 
            color: #ffffff;
        }
        .row {
            justify-content: center;
        }
        
        .category-card {
            width: 100%;
            max-width: 300px;
            margin: 20px auto;
        }
        @media (min-width: 768px) {
            .category-card {
                max-width: 250px; 
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">GamingSite</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
    <h1 class="text-center">Game Categories</h1>
    <div class="row">
        <!-- Sample Category Data (Replace with your data) -->
        <div class="col-md-4 d-flex justify-content-center">
            <div class="card category-card">
                <img src="assets/images/category/action.jpeg" class="card-img-top" alt="Action Games">
                <div class="card-body text-center">
                    <h5 class="card-title">Action Games</h5>
                    <p class="card-text">Experience thrilling adventures and fast-paced gameplay.</p>
                    <a href="actionGames.jsp?category=action" class="btn btn-primary">View Games</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex justify-content-center">
            <div class="card category-card">
                <img src="assets/images/category/adventure.jpg" class="card-img-top" alt="Adventure Games">
                <div class="card-body text-center">
                    <h5 class="card-title">Adventure Games</h5>
                    <p class="card-text">Embark on exciting journeys and solve challenging puzzles.</p>
                    <a href="adventure.jsp?category=adventure" class="btn btn-primary">View Games</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex justify-content-center">
            <div class="card category-card">
                <img src="assets/images/category/racing.jpg" class="card-img-top" alt="Racing Games">
                <div class="card-body text-center">
                    <h5 class="card-title">Racing Games</h5>
                    <p class="card-text">Feel the rush with high-speed racing action.</p>
                    <a href="racing.jsp?category=racing" class="btn btn-primary">View Games</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex justify-content-center">
            <div class="card category-card">
                <img src="assets/images/category/sports.jpg" class="card-img-top" alt="Sports Games">
                <div class="card-body text-center">
                    <h5 class="card-title">Sports Games</h5>
                    <p class="card-text">Compete in a variety of sports challenges.</p>
                    <a href="sports.jsp?category=sports" class="btn btn-primary">View Games</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex justify-content-center">
            <div class="card category-card">
                <img src="assets/images/category/kids.jpg" class="card-img-top" alt="kids Games">
                <div class="card-body text-center">
                    <h5 class="card-title">Kids Games</h5>
                    <p class="card-text">Use your mind to outsmart your opponents.</p>
                    <a href="strategy.jsp?category=strategy" class="btn btn-primary">View Games</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 d-flex justify-content-center">
            <div class="card category-card">
                <img src="assets/images/category/rolePlaying.jpg" class="card-img-top" alt="Role-Playing Games">
                <div class="card-body text-center">
                    <h5 class="card-title">RPG Games</h5>
                    <p class="card-text">Step into a new world and become the hero of your own story.</p>
                    <a href="rpg.jsp?category=rpg" class="btn btn-primary">View Games</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2024 GamingSite. All Rights Reserved.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>