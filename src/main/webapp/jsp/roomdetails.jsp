<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style>
	.manageform{
	text-align:center;
	background-color:lightblue;
	margin-bottom: 5%;
	margin-left: 30%;
	margin-right: 30%;
	
	}
	
	.h1{
	color:green;
	
	}
	
	.h2{
	color:brown;
	
	}
	</style>
	<link rel="stylesheet" type="text/css" href="../css/navbar.css">
	<title>modify details and answer questions</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="../js/navbar.js"></script>
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
	 <h1 style="text-align:center">Manage your rooms</h1>
	<h2 style="text-align:center">Modify room details</h2>
	<form id='user-opt' class=manageform action='${pageContext.request.contextPath}/updateroom/${room.id}' method="post">
	<table>
	<tr>
	<td>Name:*</td><td><input type="text" name="name" value="${room.name}" ></td>
	</tr>
	<tr>
	<td>Address:*</td><td><input type="text" name="address" id="myaddress" value="${room.address}" ></td>
	</tr>
	<tr>
	<td>Transport:</td><td><input type="text" name="transport" value="${room.transport}"></td>
	</tr>
	<tr>
	<td>Available from:</td><td><input type="text" name="time-beginning"></td>
	</tr>
	<tr>
	<td>Available to:</td><td><input type="text" name="time-end"></td>
	
	</tr>
	<tr>
	<td>Guests:*</td><td><input type="text" name="guests" value="${room.guests}"></td>
	</tr>
	<tr>
	<td>Max guests:</td><td><input type="text" name="maxGuests" value="${room.maxGuests}"></td>
	</tr>
	<tr>
	<td>Minimum price:*</td><td><input type="text" name="price" value="${room.price}"></td>
	</tr>
	<tr>
	<td>Extra cost per person:</td><td><input type="text" name="pricePerExtra;"value="${roompricePerExtra}"></td>
	</tr>
	<tr>
	<td>Room type:*</td><td><input type="text" name="roomType" value="${room.roomType}"></td>
	</tr>
	<tr>
	<td>Rules:</td><td><input type="text" name="rules" value="${room.rules}"></td>
	</tr>
	<tr>
	<td>Description:*</td><td><input type="text" name="description" value="${room.description}"></td>
	</tr>
	<tr>
	<td>Number of beds:*</td><td><input type="text" name="beds" value="${room.beds}" ></td>
	</tr>
	<tr>
	<td>Number of bathrooms:*</td><td><input type="text" name="bathrooms" value="${room.bathrooms}"></td>
	</tr>
	<tr>
	<td>Number of bedrooms:*</td><td><input type="text" name="bedrooms" value="${room.bedrooms}"></td>
	</tr>
	<tr>
	<td>SquareMetres:</td><td><input type="text" name="SquareMetres" value="${room.squareMetres}"></td>
	</tr>
	<tr>
	<td><input type="submit" value="Submit"></td>
	</tr>
	</table>
	</form>
	<script type="text/javascript">
	/*
	document.getElementById("myaddress").defaultValue =;
	
	*/</script>

</body>
</html>