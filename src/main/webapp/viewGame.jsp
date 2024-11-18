<%@page import="Model.*"%>
<%@page import="Service.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Online Gaming Site</title>
	
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
	        <a class="navbar-brand" href="user.jsp">Online Game Site</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav ml-auto">
	            <% if(session.getAttribute("userUsername")==null){ %>
	               
	                <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                        </li>
                         <li class="nav-item">
	                    <a class="nav-link" href="login.jsp">Logout</a>
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
	            <div class="col-12 col-md-10 ">
	                <div class="card">
	                    <div class="card-header">
	                    All Games
	                    <a href="AddNewGame.jsp" class="btn btn-primary float-right">Add New Game</a>
	                    </div>
	                    
	                    <div class="p-1" id="GameDiv">
	                    	<table class="table">
			                    <thead>
					                <tr>
					                    <th class="tableTh">ID</th>
					                     <th class="tableTh">Game Image</th>
					                    <th class="tableTh">Title</th>
					                    <th class="tableTh">Description</th>
					                    <th class="tableTh">Category ID</th>
					                    <th class="tableTh">Edit</th>
					                    <th class="tableTh">Remove</th>
					                </tr>
				                </thead>
			                <tbody>
	                	<%
	                		GameService us = new GameService();
							ArrayList<Game> arrayList = us.getGame();
							
							for (Game game : arrayList) {
						%><tr>
							<td class="tableTh"><%=game.getId() %></td>
							<td class="tableTh">
    						<img src="<%=request.getContextPath()%>/images/<%=game.getGame_image()%>" style="width:50px;" height="50px;">
						   </td>
							
							<td class="tableTh"><%=game.getTitle() %></td>
							<td class="tableTh"><%=game.getDescription() %></td>
							<td class="tableTh"><%=game.getCategory_id() %></td>
							<td class="tableTh"><a class="btn btn-info" href="getGames?id=<%=game.getId() %>" >Edit</a></td>
							<td class="tableTh"><Button class="btn btn-warning" id="<%=game.getId() %>" onclick="clickDelete(this);">Delete</Button></td>
						  </tr>
						<%
							}
						%>
						</tbody>
	            </table>
	            </div>
	                </div>
	            </div>
	        </div>
		</main>
	</div>

	
	<div style="display: none;" >
    	<form action="removeGame" method="post" id="settingsForm">
			<input name="deleteId" id="removeId" required>
		</form>
    </div>

</body>
</html>
<script>
	
	function clickDelete(id){
		
		var r = confirm("Do you want to remove this game?");
		
		if (r == true) {
			var did = id.id;
			document.getElementById("removeId").value = did;
			document.getElementById("settingsForm").submit();
		}
	}

</script>
