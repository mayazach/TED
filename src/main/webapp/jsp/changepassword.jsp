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
  max-width: 400px;
  margin: auto;
  text-align: center;
  font-family: arial;
  background-color:lightblue;
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
<title>Change password</title>
</head>
<body>
<div class="card">
<h1 style=margin-left:10%;margin-right:10%><c:out value = "${user.username}"/></h1>
<form  action='${pageContext.request.contextPath}/updatepassword' method="post">
<table>
<tr>
<td><b>Current password:</b></td><td><input type="password" id="curpword" name="curpword"></td><td id = "curcheck"><td>
</tr>
<tr>

<td><b>New password:</b></td><td><input type="password" id="newpw" name="newpw"></td><td id = "newcheck"><td>
</tr>
<tr>
<td><b>Confirm new password:</b></td><td><input type="password" id="confpw" name="confpw"></td><td id = "confcheck"><td>
</tr>

      
<tr>			
<td><input class="sub" type="submit" value="Submit"></td>
</tr>
</table>
</form>
</div>
<script>
		document.getElementById("curpword").onblur=function(){
			var element=this.value;
			var previous="${password}";
			if(element!=previous){
				document.getElementById("curcheck").innerHTML = "Wrong password";
				document.getElementById("curcheck").style.color = "red";	
				
			}
			else{
				document.getElementById("curcheck").innerHTML = "OK";
				document.getElementById("curcheck").style.color = "green";	
				
			}
			
			
		}	
			
			
			
				document.getElementById("newpw").onblur = function(){
					var element = this.value;
					if(element.length < 8){
						document.getElementById("newcheck").innerHTML = "Password must be at least 8 characters long";
						document.getElementById("newcheck").style.color = "red";
					}
					else{
						document.getElementById("newcheck").innerHTML = "OK";
						document.getElementById("newcheck").style.color = "green";
					}
				}
				
				document.getElementById("confpw").onblur = function(){
					var element = this.value;
					if(element != document.getElementById("newpw").value){
						document.getElementById("confcheck").innerHTML = "Passwords don't match";
						document.getElementById("confcheck").style.color = "red";
					}
					else{
						document.getElementById("confcheck").innerHTML = "OK";
						document.getElementById("confcheck").style.color = "green";
					}
				}
				
</script>
</body>
</html>