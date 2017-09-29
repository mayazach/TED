<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="css/form.css">
	<link rel="stylesheet" type="text/css" href="css/layout.css">
	<link rel="stylesheet" type="text/css" href="css/navbar.css">
	<style>
	body{
	background-color:#E6E6FA;
	margin-left:10%;
	margin-right:10%;
	}
	table, th, td {
	    border: 1px solid black;
	    border-collapse: collapse;
	}
	th, td {
	    padding: 5px;
	    text-align: left;
	}
	.clickable:hover{
	   background-color: lightblue;
	}
	</style>
	<title>Admin Panel</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/navbar.js"></script>
</head>
<body>
	<nav id="loginbar">
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="rooms/login">Login</a></li>
			<li><a href="register">Register</a></li>
		</ul>		
	</nav>
	<nav id="logoutbar" style=display:none>
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="profile">Profile</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>		
	</nav>
	<h1 >Admin panel</h1>
	<table>
	<tr>
	<th>UserName</th><th>Role</th>
	</tr>
	
	<c:forEach var = "xristes" items = "${users}">
	<tr class="clickable" data-href="${pageContext.request.contextPath}/userdetails/${xristes.username}">
	<td><c:out value ="${xristes.username}"/></td><td><c:out value ="${xristes.role}"/></td>
	</tr>
	</c:forEach>
	</table>
	<script type="text/javascript">
	var elements = document.getElementsByClassName('clickable');
	/*location.href="index3.html";*/
	for (var i = 0; i < elements.length; i++) {
	    var element = elements[i];
	    element.addEventListener('click', function() {
	        var href = this.dataset.href;
	        if (href) {
	            window.location.assign(href);
	    
	        }
	    })
	}
	</script>
</body>
</html>