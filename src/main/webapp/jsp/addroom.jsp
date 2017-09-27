<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/form.css">
	<link rel="stylesheet" type="text/css" href="css/layout.css">
	<link rel="stylesheet" type="text/css" href="css/navbar.css">
	
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/navbar.js"></script>
     <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      <!-- Javascript -->
      <script>
         $(function() {
            $( "#datepicker-1" ).datepicker( { dateFormat: "dd-mm-yy" });
         });
         $(function() {
            $( "#datepicker-2" ).datepicker({ dateFormat: "dd-mm-yy" });
         });
      </script>
   </head>
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
	<h2 style="text-align:center">Add a new room</h2>
	<form id='user-opt' class=manageform action='${pageContext.request.contextPath}/newroom' method="post">
	<table>
	<tr>
	<td>Name:*</td><td><input type="text"  name="name" class="necessary"></td>
	</tr>
	<tr>
	<td>Address:*</td><td><input type="text"  name="address" class="necessary"></td>
	</tr>
	<tr>
	<td>Transport:</td><td><input type="text" name="transport"></td>
	</tr>
	<tr>
	<td>Available from:</td><td><input type="text" name="time-beginning" id="datepicker-1"></td>
	</tr>
	<tr>
	<td>Available to:</td><td><input type="text" name="time-end" id="datepicker-2"></td>
	
	</tr>
	<tr>
	<td>Guests:*</td><td><input type="text" name="guests" class="necessary"></td>
	</tr>
	<tr>
	<td>Max guests:</td><td><input type="text" name="maxGuests"></td>
	</tr>
	<tr>
	<td>Minimum price:*</td><td><input type="text" name="price" class="necessary"></td>
	</tr>
	<tr>
	<td>Extra cost per person:</td><td><input type="text" name="pricePerExtra;"></td>
	</tr>
	<tr>
	<td>Room type:*</td><td><input type="text" name="roomType" class="necessary"></td>
	</tr>
	<tr>
	<td>Rules:</td><td><input type="text" name="rules"></td>
	</tr>
	<tr>
	<td>Description:*</td><td><input type="text" name="description" class="necessary"></td>
	</tr>
	<tr>
	<td>Number of beds:*</td><td><input type="text" name="beds" class="necessary"></td>
	</tr>
	<tr>
	<td>Number of bathrooms:*</td><td><input type="text" name="bathrooms" class="necessary"></td>
	</tr>
	<tr>
	<td>Number of bedrooms:*</td><td><input type="text" name="bedrooms" class="necessary"></td>
	</tr>
	<tr>
	<td>SquareMetres:</td><td><input type="text" name="SquareMetres"></td>
	</tr>
	<tr>
	<td><input type="submit" value="Submit" id="submit"/></td>
	</tr>
	</table>
	</form>
	<script src="js/addroom.js"></script>
</body>
</html>