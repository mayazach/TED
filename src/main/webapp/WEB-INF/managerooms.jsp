<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/form.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
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
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
tr:hover{
   background-color: lightblue;
}

-->
</style>

<title>Manage</title>
</head>
<body>
<h1 style="text-align:center">Manage your rooms</h1>
<h2 style="text-align:center">Your rooms</h2>
<table style="width:100%">
  <tr style="color:brown">
    <th>Photo</th>
    <th>Cost</th>
    <th>Type</th>
    <th>Number of beds</th>
    <th>Average rating</th>
   </tr>
 <c:forEach var = "dwm" items = "${rooms}" >
 
   <tr class="clickable" data-href="${pageContext.request.contextPath}/showroom/${dwm.id}">
             <td><a href="https://www.google.gr"><img src=<c:out value = "${dwm.defaultPic}"/>></a> </td>
             <td><c:out value = "${dwm.price}"/> </td>
             <td><c:out value = "${dwm.roomType}"/></td>
    
             <td><c:out value = "${dwm.beds}"/></td>
             <td><c:out value = "${dwm.reviewAvg}"/></td>
   </tr>
          </c:forEach>
         </table>

<!-- <button type="button" onclick="alert('A new room will be available')">ADD A NEW ROOM</button>-->
<!--  <button type="button" onclick="/rooms/addroom">ADD A NEW ROOM</button> -->
    <form action="/rooms/addroom">
    <input type="submit" value="ADD A NEW ROOM" />
</form>
</body>
</html>        
</body>
</html>