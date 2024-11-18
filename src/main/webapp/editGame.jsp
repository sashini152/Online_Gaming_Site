<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Game Browsing System</title>
	
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
	<style type="text/css">
        .my-error-class {
            color:red;
        }
        .my-valid-class {
            color:green;
        }
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
	        <a class="navbar-brand" href="game.jsp">Online Gaming Site</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav ml-auto">
	                <% if(session.getAttribute("gameEmail")==null){ %>
	                <li class="nav-item">
	                    <a class="nav-link" href="login.jsp">Login</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="register.jsp">Register</a>
	                </li>
	                <%}else{ %>
	                <li class="nav-item">
	                    <a class="nav-link" href="logoutServlet">Logout</a>
	                </li>
	                <%} %>
	            </ul>
	
	        </div>
        </div>
	</nav>
    <div class="container">
		
<br>
<p></p>
		<main class="login-form">
	        <div class="row justify-content-center">
	            <div class="col-md-8">
	                <div class="card">
	                    <div class="card-header">Games</div>
	                    <div class="card-body">
	                    <%
							if(request.getAttribute("errors_success")!=null){
								if(request.getAttribute("errors_success").equals(1)){
									%>	<div class="alert alert-success">
										  Successful!
										</div>	
										
										<script>
						            setTimeout(function() {
						                window.location.href = 'viewGame.jsp';
						            }, 500);
						        </script>
							  
										<%
								}else{
									%>	<div class="alert alert-danger">
										  Unsuccessful!
										</div>	<%
								}
								
								
							}
						    %>
						    
						    <%
								Game game = (Game) request.getAttribute("game");
						    
						    if (game == null) {
						        response.sendRedirect("viewGame.jsp"); // Redirect if no game is found
						        return;
						    }
								%>
							<form action="updateGame" method="post" enctype="multipart/form-data">
					       
							    <input type="hidden" name="id" value="<%=game.getId() %>" >
							    <div class="form-group row">
							        <label class="col-md-4 col-form-label text-md-right">Title</label>
							        <div class="col-md-6">
							            <input type="text" id="title" class="form-control" name="title" value="<%=game.getTitle() %>" required>
							        </div>
							    </div>
							
	                        	
									                            
									                              
							    <div class="form-group row">
								    <label class="col-md-4 col-form-label text-md-right"> Release Date</label>
								    <div class="col-md-6">
								        <input type="date" id="release_date" class="form-control" name="release_date" value="<%=game.getRelease_date() %>" required>
								    </div>
								</div>
									                            
	                         
	                            
	                            <div class="form-group row">
	                                <label class="col-md-4 col-form-label text-md-right">Description</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="description" class="form-control" name="description" value="<%=game.getDescription() %>" required>
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
								
								String selected = (c.getId() == game.getCategory_id()) ? "selected" : "";
						%>
							<option value="<%= c.getId() %>" <%= selected %>><%= c.getName() %></option>
							<%
							}
						%>
	                                    </select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label class="col-md-4 col-form-label text-md-right">Developer_name</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="developer_name" class="form-control" name="developer_name" value="<%=game.getDeveloper_name() %>" required />
	                                </div>
	                            </div>
	                            
	                             <div class="form-group row">
								    <label class="col-md-4 col-form-label text-md-right">Game Price</label>
								    <div class="col-md-6">
								        <div class="input-group">
								            <span class="input-group-text">Rs.</span>
								            <input type="number" id="cost_per_item" class="form-control" name="cost_per_item" value ="<%=game.getCost_per_item() %>"required />
								            <span class="input-group-text">.00</span>
								        </div>
								    </div>
								</div>
								
								
	                            
								
								
	                            
	                            <div class="col-md-6 offset-md-4">
	                                <button type="submit" class="btn btn-primary">
	                                    Edit
	                                </button>
	                            </div>
	                    	</form>
	                    </div>
	                </div>
	            </div>
	        </div>
		</main>
	</div>

</body>
</html>
