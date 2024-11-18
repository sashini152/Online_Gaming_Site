<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Gaming site</title>
    
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>

    <style type="text/css">
        body {
            background-image: url('assets/images/category/addCategory.jpeg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
            height: 100vh;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #2d033b; 
            color: white;
        }
        .navbar a.navbar-brand, .navbar a.nav-link {
            color: white;
        }
        .navbar a.nav-link:hover {
            color: #d4af37; 
        }
        .card {
            background-color: #2e2e2e;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
        }
        .card-header {
            background-color: #2d033b; 
            color: white;
            font-size: 1.3em;
            text-align: center;
        }
        .card-body label {
            color: #d4af37; 
        }
        .card-body input[type="text"],
        .card-body input[type="password"],
        .card-body input[type="number"],
        .card-body input[type="file"],
        .card-body input[type="date"],
        .card-body select {
            background-color: #333; 
            color: white;
            border: 1px solid #555;
        }
        .card-body .input-group-text {
            background-color: #444;
            color: white;
        }
        .btn-primary {
            background-color: #d4af37; 
            border-color: #d4af37;
            color: black;
        }
        .btn-primary:hover {
            background-color: white;
            color: #d4af37;
        }
        .alert-success {
            background-color: #2e7d32; 
            color: white;
        }
        .alert-danger {
            background-color: #d32f2f; 
            color: white;
        }
        footer {
            background-color: #2d033b; 
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 20px;
        }
        .container {
            margin-top: 40px;
        }
        .my-error-class {
            color: red;
        }
        .my-valid-class {
            color: green;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="user.jsp">Online Gaming Site</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
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
        <br>
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Add New Game</div> <!-- Changed to reflect gaming context -->
                        <div class="card-body">
                            <%
                            if (request.getAttribute("errors_success") != null) {
                                if (request.getAttribute("errors_success").equals(1)) {
                                    %>  
                                    <div class="alert alert-success">Game added Successfully!</div>  
                                    <script>
                                        setTimeout(function() {
                                            window.location.href = 'viewGame.jsp';
                                        }, 1000); /* Redirect after 1 second */
                                    </script>
                                    <%
                                } else {
                                    %>  
                                    <div class="alert alert-danger">Unsuccessful!</div>  
                                    <%
                                }
                            }
                            %>
                            <form action="insertGame" method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Title</label>
                                    <div class="col-md-6">
                                        <input type="text" id="title" class="form-control" name="title" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Developer Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="developer_name" class="form-control" name="developer_name" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Game Price</label>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text">Rs.</span>
                                            <input type="text" id="cost_per_item" class="form-control" name="cost_per_item" required />
                                            <span class="input-group-text">.00</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Description</label>
                                    <div class="col-md-6">
                                        <input type="text" id="description" class="form-control" name="description" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Release Date</label>
                                    <div class="col-md-6">
                                        <input type="date" id="release_date" class="form-control" name="release_date" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Category</label>
                                    <div class="col-md-6">
                                        <select id="category_id" class="form-control" name="category_id" required>
                                            <%
                                            CategoryService v = new CategoryService();
                                            ArrayList<Category> arrayList1 = v.getCategory();
                                            for (Category c : arrayList1) {
                                            %>
                                                <option value="<%=c.getId() %>"><%=c.getName() %></option>
                                            <%
                                            }
                                            %>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right">Upload Game Image</label>
                                    <div class="col-md-6">
                                        <input name="game_image" type="file" class="form-control-file" id="game_image" required>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <footer>
        <p>Online Game Browsing System &copy; 2024</p>
    </footer>
    
    <script>
    $(document).ready(function () {
        // Adding custom validation rules
        $("form").validate({
            rules: {
                title: {
                    required: true,
                    minlength: 2
                },
                developer_name: {
                    required: true,
                    minlength: 2
                },
                cost_per_item: {
                    required: true,
                    number: true,
                    min: 0
                },
                description: {
                    required: true,
                    minlength: 5
                },
                release_date: {
                    required: true,
                    date: true,
                    max: new Date().toISOString().split("T")[0] 
                },
                game_image: {
                    required: true,
                    extension: "jpg|jpeg|png|gif" 
                },
                category_id: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: "Please enter the game title",
                    minlength: "Title must be at least 2 characters long"
                },
                developer_name: {
                    required: "Please enter the developer's name",
                    minlength: "Developer name must be at least 2 characters long"
                },
                cost_per_item: {
                    required: "Please enter the game price",
                    number: "Only numeric values are allowed",
                    min: "Price cannot be negative"
                },
                description: {
                    required: "Please provide a game description",
                    minlength: "Description must be at least 5 characters long"
                },
                release_date: {
                    required: "Please select a release date",
                    max: "Release date cannot be in the future"
                },
                game_image: {
                    required: "Please upload a game image",
                    extension: "Only image files are allowed (jpg, jpeg, png, gif)"
                },
                category_id: {
                    required: "Please select a category"
                }
            },
            errorClass: "my-error-class",
            validClass: "my-valid-class",
            errorElement: "div",
            errorPlacement: function (error, element) {
                error.addClass("invalid-feedback");
                if (element.prop("type") === "checkbox") {
                    error.insertAfter(element.siblings("label"));
                } else {
                    error.insertAfter(element);
                }
            },
            highlight: function (element) {
                $(element).addClass("is-invalid").removeClass("is-valid");
            },
            unhighlight: function (element) {
                $(element).addClass("is-valid").removeClass("is-invalid");
            }
        });
    });
</script>
    

</body>
</html>