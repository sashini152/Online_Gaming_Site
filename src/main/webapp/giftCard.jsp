<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gaming Gift Card</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
         html, body {
            height: 100%; 
            margin: 0; 
            display: flex; 
            flex-direction: column; 
            background-color: #1c1c1e; 
            background-image: url('assets/images/cate`````````````````gory/addCategory.jpeg'); 
            background-size: cover; 
            background-position: center; 
            background-repeat: no-repeat; 
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        }

        .main-content {
            flex: 1; 
            padding: 20px; 
        }

        .navbar {
            background-color: #2d033b; 
            background-image: url('assets/images/navbar-bg.jpg');
            background-size: cover; 
            background-position: center; 
            border-bottom: 2px solid #d4af37; 
        }

        .navbar-nav .nav-link {
            color: white; 
            transition: color 0.3s; 
        }

        .navbar-nav .nav-link:hover {
            color: #d4af37; 
        }

        /* Card Styles */
        .card {
            background-color: #2e2e2e; 
            border: none; 
            margin-bottom: 20px; 
        }

        .card-header {
            color: white; 
            font-weight: bold;
        }

        .card-body {
            color: lightgray; 
        }

        /* Button Styles */
        .btn-primary {
            background-color: #d4af37
            border-color: #d4af37; 
            transition: background-color 0.3s, border-color 0.3s; 
        }

        .btn-primary:hover {
            background-color: #c49b29; 
            border-color: #c49b29;
        }

        /* Footer Styles */
        footer {
            background-color: #2d033b; 
            color: white; 
            text-align: center; 
            padding: 10px 0; 
            width: 100%; 
        }
        .alert {
            display: none;
        }
    </style>
</head>
<body>

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
                            <a class="nav-link" href="login.jsp">Login</a>
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
        <h1 class="text-center">Gaming Gift Card</h1>
        <p class="text-center">Give the gift of gaming! Choose a gift card amount for your loved ones.</p>

        <form id="giftCardForm" action="processGiftCard.jsp" method="post">
            <div class="mb-3">
                <label for="recipientEmail" class="form-label">Recipient's Email</label>
                <input type="email" class="form-control" id="recipientEmail" name="recipientEmail" required>
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Select Amount</label>
                <select class="form-select" id="amount" name="amount" required>
                    <option value="">Choose an coin</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Send Gift Card</button>
                <div class="alert alert-success" id="successMessage" role="alert">
                    Your gift has been successfully submitted!
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.9/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Handle form submission
        document.getElementById("giftCardForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent default form submission
            
            // Show the success message
            document.getElementById("successMessage").style.display = "block";
            
            // Optionally, you can also submit the form after showing the message
            // Uncomment the line below if you want to submit the form after displaying the message
            // this.submit();
        });
    </script>

</body>
</html>