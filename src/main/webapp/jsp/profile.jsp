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
    width: 50%;
    font-size: 18px;
    hover:red;
    
}

h1{
  color:green;
}


</style>
<title>Insert title here</title>
</head>
<body>
<div class="card">
<h1 style=margin-left:10%;margin-right:10%><c:out value = "${user.username}"/></h1>
<br>
<b>FirstName:</b><c:out value = "${user.firstName}"/>
<br>

<b>LastName:</b><c:out value = "${user.lastName}"/>

<br>
<b>Email:</b><c:out value = "${user.email}"/>
<br>
<b>Phone:</b><c:out value = "${user.phone}"/>
<br>
<b>Role:</b><c:out value = "${user.role}"/>
<br>
<br>
 <button class="edit" type="submit" id="editf">Edit profile</button> 
<br>
<br>
<button class="passf" type="submit" id="passf">Change password</button>
</div>

 <script type="text/javascript">
             document.getElementById("editf").onclick=function(){
            	 window.location.href='/rooms/editprofile';
             };
             </script>
 <script type="text/javascript">
             document.getElementById("passf").onclick=function(){
            	 location.href='/rooms/changepassword';
             };
             </script>
</body>
</html>