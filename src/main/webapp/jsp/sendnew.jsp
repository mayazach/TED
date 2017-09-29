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
body{
    margin-left:20%;
    
    position: relative;
	min-height: 100%;
	background-color: rgb(245, 245, 245);/*rgb(180, 210, 255);*/
	font-family: Helvetica;
	color: black;
}


.card {
	   width: 50%;
       background-color:#B0C4DE;
       margin-right: 40%;
}
</style>

<title>Send a new message</title>
</head>
<body>
<div class="card">
<h3>New message:</h3>
<form action="" name="messageForm" method="post">
     <table>
     <tr>
     <td>To(recipitor's username):*</td><td><input type="text"  name="recipientName"></td>        </td>
     </tr>
     <tr><td>Subject:*</td><td><input type="text"  name="subject"></td>
     </tr>
     </table>
    <br>  
    Write your message here!!<br>
    <textarea id="confirmationText" class="text" cols="50" rows ="4" name="text"></textarea>

   <input type="submit" value="Submit">
</form>
</div>
</body>
</html>