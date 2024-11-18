<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    
  
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 
    <style>
        body {
            background: linear-gradient(135deg, #3d3d3d 0%, #4b2c5e 50%, #1c1c1c 100%); 
            color: #ffffff; /* White font for contrast */
            font-family: 'Arial', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 500px;
            background-color: #292929; 
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5); 
        }

        h2 {
            color: #d1c4e9;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-group label {
            color: #cccccc; 
        }

        .form-control {
            background-color: #4b4b4b; 
            border: none;
            color: #ffffff; 
        }

        .form-control:focus {
            background-color: #333333; 
            border: 1px solid #7a559d; 
            color: #ffffff;
        }

        .form-group .invalid-feedback {
            color: #ff6961; 
        }

        .btn-primary {
            background-color: #7a559d; 
            border: none;
            color: #ffffff; 
            padding: 10px 20px;
            width: 100%;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #9b79bf; 
        }

        .btn-primary:focus {
            outline: none;
            box-shadow: 0 0 10px #7a559d;
        }

        .text-center {
            color: #cccccc; 
        }

        
        .form-group input {
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">

    <div class="container mt-5">
        <h2 class="text-center">Registration Form</h2>
        <form action="register" method="POST" class="needs-validation" novalidate>
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
                <div class="invalid-feedback">Please enter your name.</div>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
                <div class="invalid-feedback">Please enter a password.</div>
            </div>
            
            <div class="form-group">
                <label for="confirm_password">Confirm Password:</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                <div class="invalid-feedback">Please confirm your password.</div>
            </div>

            <input type="hidden" id="status" value="<%= session.getAttribute("userEmail")%>"  >
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
        // JavaScript for disabling form submissions if there are invalid fields
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>

</body>
</html>