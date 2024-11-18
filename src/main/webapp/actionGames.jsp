<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Action Games</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a1a1a; 
            color: white; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        h1 {
            color: #c299ff; 
            margin-bottom: 50px;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            background-color: #2c2c2c; 
            border: none; 
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
        <h1 class="text-center">Action Games</h1>
        <div class="row">
            <!-- Sample Game Data -->
            <div class="col-md-4 game-card">
                <div class="card">
                    <img src="assets/images/category/actionGame1.jpeg" class="card-img-top" alt="Action Game 1">
                    <div class="card-body">
                        <h5 class="card-title">Action Game 1</h5>
                        <p class="card-text">An exciting action game with thrilling gameplay.</p>
                        <a href="#" class="btn btn-primary">Play Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 game-card">
                <div class="card">
                    <img src="assets/images/category/actionGame2.jpg" class="card-img-top" alt="Action Game 2">
                    <div class="card-body">
                        <h5 class="card-title">Action Game 2</h5>
                        <p class="card-text">Join the battle and conquer your enemies!</p>
                        <a href="#" class="btn btn-primary">Play Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 game-card">
                <div class="card">
                    <img src="assets/images/category/actionGame3.jpg" class="card-img-top" alt="Action Game 3">
                    <div class="card-body">
                        <h5 class="card-title">Action Game 3</h5>
                        <p class="card-text">Experience heart-pounding action and adventure.</p>
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