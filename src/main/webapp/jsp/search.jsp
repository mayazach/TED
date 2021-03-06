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
	<link rel="stylesheet" type="text/css" href="css/navbar.css">
	<title>Search results</title>
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
	<h1>We suggest the following options</h1>
	 <table style="width:100%">
	  <tr style="color:brown">
	    <th>Photo</th>
	    <th>Cost</th>
	    <th>Type</th>
	    <th>Number of beds</th>
	    <th>Average rating</th>
	   </tr>
	
	   
	   <!--/*Enumeration paramNames = request.getParameterNames();
	   while(paramNames.hasMoreElements()) {*/
	           /*String paramName = (String)paramNames.nextElement();
	           out.print("<tr><td>" + paramName + "</td>\n");-->
	          <c:forEach var = "dwm" items = "${rooms}" >          
	            <!--   <tr class="clickable" data-href=<c:out value = "${dwm.url}"/>>  -->
	 <!--         <tr class="clickable" data-href="showroom.jsp?bedsPar=${dwm.beds}&bathroomPar=${dwm.bathrooms}&typePar=${dwm.roomType}&bedroomsPar=${dwm.bedrooms}&squareMetresPar=${dwm.squareMetres}&descriptionPar=${dwm.description}&rulesPar=${dwm.rules}&addressPar=${dwm.address}&pricePar=${dwm.price}"> -->  
	             <tr class="clickable" data-href="${pageContext.request.contextPath}/showroom/${dwm.id}">
	             <td><a href="https://www.google.gr"><img src=<c:out value = "${dwm.defaultPic}"/>></a> </td>
	             <td><c:out value = "${dwm.price}"/> </td>
	             <td><c:out value = "${dwm.roomType}"/></td>
	    
	             <td><c:out value = "${dwm.beds}"/></td>
	             <td><c:out value = "${dwm.reviewAvg}"/></td>
	            
	           
	             <!--<c:out value="myVariable"/>
	             <h1>${myVariable}</h1>*/
	             out.print("</tr>");
	             -->
	     
	             
	 
	    
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