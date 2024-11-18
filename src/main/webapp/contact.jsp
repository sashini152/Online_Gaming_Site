<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .contact-info {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        .alert {
            display: none; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Contact Us</h1>

        <div class="alert alert-success" id="successMessage" role="alert">
            Your message has been successfully submitted!
        </div>

        <form action="submitContact.jsp" method="post" onsubmit="return handleSubmit(event)">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            
            <div class="mb-3">
                <label for="subject" class="form-label">Subject:</label>
                <input type="text" class="form-control" id="subject" name="subject" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message:</label>
                <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>

        <div class="contact-info mt-5">
            <h5>Contact Information</h5>
            <p><strong>Email:</strong> <a href="mailto:your-email@example.com">your-email@example.com</a></p>
            <p><strong>Phone:</strong> <a href="tel:+1234567890">+1 234-567-890</a></p>
            <p><strong>Follow us on Facebook:</strong> <a href="https://facebook.com/your-facebook-page" target="_blank">Facebook Page</a></p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

    <script>
        function handleSubmit(event) {
            event.preventDefault(); 

            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const subject = document.getElementById('subject').value.trim();
            const message = document.getElementById('message').value.trim();

            if (!name || !email || !phone || !subject || !message) {
                alert('Please fill in all fields.');
                return false;
            }

            document.getElementById('successMessage').style.display = 'block';

            document.querySelector('form').reset();

            return false; 
        }
    </script>
</body>
</html>
