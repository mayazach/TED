<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

-->
</style>
<title>Add</title>
</head>
<body>
<h1 style="text-align:center">Manage your rooms</h1>
<h2 style="text-align:center">Add a new room</h2>
<form id='user-opt' class=manageform>
<table>
<tr>
<td>Address:</td><td><input type="text" name="address"></td>
</tr>
<tr>
<td>Transport:</td><td><input type="text" name="transport"></td>
</tr>
<tr>
<td>Available from:</td><td><input type="text" name="time-beginning"></td>
</tr>
<tr>
<td>Available to:</td><td><input type="text" name="time-end"></td>

</tr>
<tr>
<td>Max guests:</td><td><input type="text" name="maxGuests"></td>
</tr>
<tr>
<td>Minimum price:</td><td><input type="text" name="price"></td>
</tr>
<tr>
<td>Extra cost per person:</td><td><input type="text" name="pricePerExtra;"></td>
</tr>
<tr>
<td>Room type:</td><td><input type="text" name="roomType"></td>
</tr>
<tr>
<td>Rules:</td><td><input type="text" name="rules"></td>
</tr>
<tr>
<td>Description:</td><td><input type="text" name="description"></td>
</tr>
<tr>
<td>Number of beds:</td><td><input type="text" name="beds"></td>
</tr>
<tr>
<td>Number of bathrooms:</td><td><input type="text" name="bathrooms"></td>
</tr>
<tr>
<td>Number of bedrooms:</td><td><input type="text" name="bedrooms"></td>
</tr>
<tr>
<td>SquareMetres:</td><td><input type="text" name="SquareMetres"></td>
</tr>
<tr>
<td><input type="submit" value="Submit"></td>
</tr>
</table>
</form>
</body>
</html>