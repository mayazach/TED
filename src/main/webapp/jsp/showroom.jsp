<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<link rel="stylesheet" type="text/css" href="../css/navbar.css">
	<title>show room</title>
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
			<li><a href="${pageContext.request.contextPath}/index.html">Home</a></li>
			<li><a href="profile">Profile</a></li>
			<li><a href="logout">Logout</a></li>
		</ul>		
	</nav>
	<h1 style=margin-left:10%;margin-right:10%>Room info</h1><br>
	<h2 style=margin-left:10%;margin-right:10%><c:out value = "${room.name}"/></h2><br>
	<div><b>Place:</b><br>
	<%/*
	            String beds = request.getParameter("bedsPar");
	            String squareMetres=request.getParameter("squareMetresPar");
	            String price=request.getParameter("pricePar");
	            String description=request.getParameter("descriptionPar");
	            String rules=request.getParameter("rulesPar");
	            String address=request.getParameter("addressPar");
	           /* String neighborhood=request.getParameter("neighborhoodPar");*/
	%>
	Number of beds <c:out value = "${room.beds}"/>
	<br>
	
	SquareMetres: <c:out value = "${room.squareMetres}"/>
	<br>
	
	<br>
	<b>Description:</b><br>
	<c:out value = "${room.description}"/>
	<br>
	<br>
	<b>Amenities:</b>
	<c:out value = "${amenities}"/>
	
	<br>
	<br>
	<b>Rules:</b>
	<c:out value = "${room.rules}"/>
	<br>
	
	<!--  Price:-->
	
	<br>
	<b>Location:</b>
	<br>
	Map:
	<br>
	Address:<c:out value = "${room.address}"/>
	<br>
	Neighborhood:<c:out value = "${room.neighborhood}"/>
	<br>
	Transportation:<c:out value = "${room.transport}"/>
	<br>
	<br>
	<b>Photos:</b>
	<br>
	<c:forEach var = "photo" items = "${photos}" >
	<img src =<c:out value = "${photo.source}"/> width="200" height="200"> 
	</c:forEach>
	<br>
	<br>
	<b>Owner info:</b>
	<br>
	Name:<c:out value = "${roomowner.firstName}"/> <c:out value = "${roomowner.lastName}"/>
	<br>
	UserName:<c:out value = "${roomowner.username}"/>
	<br>
	<i>*Subscribe to be able to send your questions to the owner.</i>
	</div>
</body>
</html>