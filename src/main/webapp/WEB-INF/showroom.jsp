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

<title>show room</title>
</head>
<body>
<h1 style=margin-left:10%;margin-right:10%>Room info</h1><br>
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
SquareMetres: 
<br>

<br>
<b>Description:</b>
<br>

<br>
<br>
<b>Rules:</b>
<br>

<br>
<!--  Price:-->

<br>
<b>Location:</b>
<br>
Map:
<br>
Address:
<br>
Neighborhood:
<br>
Transportation:
<br>
<b>Photos:</b>
<br>
<c:forEach var = "photo" items = "${photos}" >
<img src =<c:out value = "${photo.source}"/> width="200" height="200"> 
 </c:forEach>
</div>
</body>
</html>