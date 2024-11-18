<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adventure Games</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1e1e1e; 
            color: white; 
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #d4bfff; 
            margin-bottom: 50px;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            background-color: #2c2c2c; 
            border: 1px solid #3d3d3d; 
        }
        .card-title {
            color: #d4bfff; 
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
        }
        .btn-primary:hover {
            background-color: #5a32a8; 
            border-color: #5a32a8;
        }
        .card-img-top {
            border-bottom: 2px solid #6f42c1; 
        }
        .game-card {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Adventure Games</h1>
        <div class="row">
            
            <div class="col-md-4 game-card">
                <div class="card">
                    <img src="assets/images/category/adventureGame1.jpg" class="card-img-top" alt="Adventure Game 1">
                    <div class="card-body">
                        <h5 class="card-title">Adventure Game 1</h5>
                        <p class="card-text">An exciting adventure game with thrilling gameplay.</p>
                        <a href="#" class="btn btn-primary">Play Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 game-card">
                <div class="card">
                    <img src="assets/images/category/adventureGame2.jpg" class="card-img-top" alt="Adventure Game 2">
                    <div class="card-body">
                        <h5 class="card-title">Adventure Game 2</h5>
                        <p class="card-text">Join the journey and conquer challenging quests!</p>
                        <a href="#" class="btn btn-primary">Play Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 game-card">
                <div class="card">
                    <img src="assets/images/category/adventureGame3.jpg" class="card-img-top" alt="Adventure Game 3">
                    <div class="card-body">
                        <h5 class="card-title">Adventure Game 3</h5>
                        <p class="card-text">Experience heart-pounding adventures and discoveries.</p>
                        <a href="#" class="btn btn-primary">Play Now</a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>