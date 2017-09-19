<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  margin: auto;
  text-align: center;
  font-family: arial;
  background-color:lightblue;
}
.button1 {
    border-style:solid ;
    outline: 0;
    display: inline-block;
    padding: 8px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
    hover:red;
    
}
button {
    border-style:solid ;
    border-color:black;
    padding: 8px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
    hover:red;
    
}
.sub{
    border-style:solid ;
    border-color:black;
    padding: 8px;
    cursor: pointer;
    width: 100%;
    font-size: 18px;
    hover:red;
    
}

h1{
  color:green;
}


</style>
<title>Edit profile</title>
</head>
<body>
<div class="card">
<h1 style=margin-left:10%;margin-right:10%><c:out value = "${user.username}"/></h1>
<form  action='${pageContext.request.contextPath}/updateprofile' method="post">
<table>
<tr>
<td><b>FirstName:</b></td><td><input type="text" name="firstName" value="${user.firstName}"></td>
</tr>
<tr>

<td><b>LastName:</b></td><td><input type="text" name="lastName" value="${user.lastName}"></td>
</tr>
<tr>
<td><b>Email:</b></td><td><input type="text" name="email" value="${user.email}"></td>
</tr>
<tr>
<td><b>Phone:</b></td><td><input type="text" name="phone" value="${user.phone}"></td>
</tr>
<tr>
<td><b>Role:</b></td><td><c:out value ="${user.role}"/></td>
</tr>
<tr>
<td><input class="sub" type="submit" value="Submit"></td>
</tr>
</table>
</form>
<!--<br>
<button class="edit" type="submit" value="Submit">Submit your changes</button>
-->
</div>

 <script type="text/javascript">
             document.getElementById("editf").onclick=function(){
            	 location.href="https://www.google.gr";
             };
             </script>
</body>
</html>