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
<link rel="stylesheet" type="text/css" href="css/navbar.css">
<style>
body{
    margin-left:20%;
    
    position: relative;
	min-height: 100%;
	background-color: rgb(245, 245, 245);/*rgb(180, 210, 255);*/
	font-family: Helvetica;
	color: black;
}
.card1{
       width: 50%;
       background-color:#FFE4C4;
       margin-right: 40%;
      


}


.card2 {
	   width: 50%;
       background-color:#B0C4DE;
       margin-right: 40%;

</style>


<title>ContactOwner</title>
</head>
<body>
<!--Coming soon!!<br>
Owner-Recipient:<c:out value = "${recipient.username}"/>
<br>
User-Sender:<c:out value = "${sender.username}"/>
-->
<h1>Send messages to the rooms's owner</h1>
<h2>Owner:<c:out value = "${recipient.username}"/></h2>
<div class="card1">
<h3>Previous messages:</h3>
</div>
<br>
<br>
<div class="card2">
<h3>New message:</h3>
<form action="" name="messageForm" method="post">
    <textarea id="confirmationText" class="text" cols="50" rows ="4" name="messageText"></textarea>

   <input type="submit" value="Submit">
</form>
</div>
</body>
</html>