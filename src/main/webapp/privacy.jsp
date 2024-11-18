<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms of Service / Privacy Policy - Online Gaming Site</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a001a;
            height: 100vh; /* This makes sure the gradient covers the full height of the viewport */
            color: white; /* Make all text white */
        }

        .navbar {
            background-color: black;
            padding-top: 5px;
            padding-bottom: 5px;
            height: 75px; /* Set the desired height */
            display: flex; /* Use flexbox */
            align-items: center; /* Vertically center the content */
            justify-content: center; /* Horizontally center the links */
            position: relative;
        }

        .navbar-brand {
            position: absolute;
            left: 10px; /* Adjust as needed */
            color: #ecf0f1 !important;
            font-size: 20px; /* Adjust the font size as needed */
        }

        .nav-link {
            color: #ecf0f1 !important;
            font-size: 20px; /* Adjust the font size as needed */
            margin-left: 15px;
            margin-right: 15px;
        }

        h2 {
            margin-top: 30px;
        }

        p {
            text-align: justify;
        }
        
         footer {
            background-color: black; /* Dark purple footer */
            color: white; /* White text */
            text-align: center; /* Centered text */
            padding: 10px 0; /* Padding for footer */
            width: 100%; /* Full width */
        }
        
        /* Style for News/Blog Title */
        h1 {
            color: white; /* Change the title color to white */
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
        <h1 class="text-center">Terms of Service</h1>
        <p>Welcome to our online gaming site. By using this site, you agree to comply with and be bound by the following terms and conditions of use. These terms govern your access and use of our platform, including but not limited to content, features, and services provided through the site.</p>
        
        <h2>1. Use of Site</h2>
        <p>By using this site, you represent that you are at least the age of majority in your country or state of residence. You agree not to use the site for any illegal or unauthorized purpose and to comply with all laws in your jurisdiction.</p>
        
        <h2>2. Account Registration</h2>
        <p>You are responsible for maintaining the confidentiality of your account information and password. You agree to accept responsibility for all activities that occur under your account.</p>
        
        <h2>3. Intellectual Property</h2>
        <p>All content on this site, including but not limited to text, images, and logos, is the property of the site owner or its licensors. You may not use any content without written permission from the site owner.</p>
        
        <h2>4. Termination of Use</h2>
        <p>We may terminate or suspend your account and access to the site at our discretion without notice, for conduct that we believe violates these Terms of Service or is harmful to the interests of our site or other users.</p>

        <h1 class="text-center">Privacy Policy</h1>
        <p>We are committed to protecting your privacy. This policy explains how we collect, use, and protect your personal information when you use our site.</p>
        
        <h2>1. Information Collection</h2>
        <p>We collect information that you provide when you register on our site, subscribe to newsletters, or interact with our services. This includes personal information such as name, email address, and payment information.</p>
        
        <h2>2. Use of Information</h2>
        <p>The information we collect is used to provide, maintain, and improve our services. We may use your information to communicate with you about updates, promotions, and other content relevant to the services you use.</p>
        
        <h2>3. Data Security</h2>
        <p>We use a variety of security measures to protect your personal information from unauthorized access or disclosure. However, no method of transmission over the Internet or method of electronic storage is 100% secure.</p>
        
        <h2>4. Third-Party Services</h2>
        <p>Our site may contain links to third-party services. We are not responsible for the privacy practices of these services, and we encourage you to review their privacy policies before providing personal information.</p>

        <h2>5. Changes to the Privacy Policy</h2>
        <p>We may update this Privacy Policy from time to time. When we do, we will notify you by posting the updated policy on this page.</p>

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