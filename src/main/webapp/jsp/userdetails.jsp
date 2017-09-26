<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/form.css">
	<link rel="stylesheet" type="text/css" href="css/layout.css">
	<style>
	div {
	    background-color:#C6DEFF;
	    width: 40%;
	    border: 25px brown;
	    padding: 5%;
	    margin: 5%;
	}
	body{
	background-color:#E6E6FA;
	margin-left:10%;
	margin-right:10%;
	}
	
	</style>
	<link rel="stylesheet" type="text/css" href="css/navbar.css">
	<title>user details</title>
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
	<h1 style=margin-left:10%;margin-right:10%>User info</h1>
	<br>
	<b>UserName:</b><c:out value = "${user.username}"/>
	<br>
	
	<b>Password:</b><c:out value = "${user.password}"/>
	
	<br>
	<b>FirstName:</b><c:out value = "${user.firstName}"/>
	<br>
	
	<b>LastName:</b><c:out value = "${user.lastName}"/>
	
	<br>
	<b>Email:</b><c:out value = "${user.email}"/>
	<br>
	<b>Role:</b><c:out value = "${user.role}"/>
	<br>

</body>
</html>