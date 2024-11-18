<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Friends / Social Page</title>
    <style>
      body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .navbar {
            background-color: black;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        .navbar-brand {
            color: #ecf0f1 !important;
            font-size: 24px;
            text-decoration: none;
        }

        .navbar-nav {
            display: flex;
        }

        .nav-link {
            color: #ecf0f1 !important;
            font-size: 18px;
            margin-left: 20px;
            text-decoration: none;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: #3498db;
        }

        h2 {
            margin-top: 30px;
            text-align: center; 
        }

        h1, h2 {
            margin: 0;
        }

        main {
            padding: 20px;
        }

        #friends-list, #invite-friends {
            background-color: #1a001a; 
            color: white; 
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        #friends-list ul {
            list-style: none;
            padding: 0;
        }

        #friends-list li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2); 
        }

        .friend-info {
            display: flex;
            flex-direction: column;
        }

        .friend-name {
            font-weight: bold;
        }

        .friend-status {
            color: gray;
        }

        .invite-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .invite-button:hover {
            background-color: #218838;
        }

        #multiplayer-options {
            margin-top: 20px;
        }

        .multiplayer-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        .multiplayer-button:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 20px 0;
            width: 100%;
            position: relative;
            bottom: 0;
            left: 0;
        }

        footer p {
            margin: 5px;
            font-size: 14px;
        }

        footer a {
            color: #3498db;
            text-decoration: none;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Success Message Styles */
        #success-message {
            margin-top: 20px;
            padding: 10px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            display: none; /* Hidden by default */
        }
    </style>
    <script>
        function sendInvite() {
            const emailInput = document.getElementById("email-input");
            const successMessage = document.getElementById("success-message");
            const email = emailInput.value.trim();

            // Basic email validation
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!email) {
                alert("Please enter an email address.");
                return;
            } else if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return;
            }

            // Simulate sending invite (without database)
            emailInput.value = ""; // Clear input
            successMessage.style.display = "block"; // Show success message
            successMessage.innerText = `Invite sent `; // Set success message
        }

        function scrollToInvite() {
            const inviteSection = document.getElementById("invite-friends");
            inviteSection.scrollIntoView({ behavior: "smooth" });
        }
    </script>
</head>
<body>
    <nav class="navbar">
        <a class="navbar-brand" href="home.jsp">Online Gaming Site</a>
        <div class="navbar-nav">
            <% if(session.getAttribute("userEmail") == null) { %>
                <a class="nav-link" href="user.jsp">Home</a>
                <a class="nav-link" href="login.jsp">Logout</a>
            <% } else { %>
                <a class="nav-link" href="logoutServlet">Logout</a>
            <% } %>
        </div>
    </nav>
    
    <main>
        <section id="friends-list">
            <h2>Invite your Friends</h2> <!-- This heading is now centered -->
            <ul>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Lakshi Senadeera</span>
                        <span class="friend-status">Online</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Tharushi Sadunika</span>
                        <span class="friend-status">Playing: Apex Legends</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Malshi Perera</span>
                        <span class="friend-status">Offline</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Sanduni Dulakshika</span>
                        <span class="friend-status">Online</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Sashini Geshani</span>
                        <span class="friend-status">Online</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Eshan Madushanka</span>
                        <span class="friend-status">Online</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
                <li>
                    <div class="friend-info">
                        <span class="friend-name">Neelaka Bandara</span>
                        <span class="friend-status">Online</span>
                    </div>
                    <button class="invite-button" onclick="scrollToInvite()">Invite to Game</button>
                </li>
            </ul>
        </section>

        <section id="invite-friends">
            <h2>Invite Friends</h2>
            <p>Share your unique invite link or send invites via email to bring your friends into the game!</p>
            <input type="text" id="email-input" placeholder="Enter email address" style="width: 80%; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
            <button class="invite-button" style="margin-top: 10px;" onclick="sendInvite()">Send Invite</button>
            <div id="success-message"></div> <!-- Success message div -->
        </section>
        
        <section id="multiplayer-options">
            <h2>Multiplayer Options</h2>
            <button class="multiplayer-button">Find Friends to Play</button>
            <button class="multiplayer-button">Create a Group Chat</button>
            <button class="multiplayer-button">View Activity Feed</button>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Online Gaming Tournament</p>
       
    </footer>
</body>
</html>