<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
       }

.hidden{
	   display:none;
	   }
</style>
<title>Read a message and write an answer</title>
</head>
<body>
<div class="card1">
<h3>Previous message:</h3>
<table>
<tr>
<td>From:</td><td><c:out value = "${username}"/></td>
</tr>
<tr>
<td>Subject:</td><td><c:out value = "${message.subject}"/></td>
</tr>
<tr>
<td>Date:</td><td><c:out value = "${message.dateSent}"/></td>
</tr>

</table>
<br>
<b>Message:</b><br>
<c:out value = "${message.text}"/>
<br>
<br>
</div>
<br>
<br>
<div class="card2">
<h3>New message:</h3>
<form action="${pageContext.request.contextPath}/storemes" name="messageForm" method="post">
     <table>
     <tr>
     <td><label class="hidden">To(recipitor's username):</label></td><td><input type="text"  name="recipientName" class="hidden" value="${username}"></td>
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



</body>
</html>