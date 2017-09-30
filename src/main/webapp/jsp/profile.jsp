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
	.hidden{
	   display:none;
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
	.mess{
	    margin-left:50%;
	    width:20%
	}
	
	h1{
	  color:green;
	}
	</style>
	<link rel="stylesheet" type="text/css" href="css/navbar.css">
	
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="js/navbar.js"></script>
</head>
<body onload="showHide()">
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
	<script>
	function dokimi(){
		alert("yes");
		
	}
	</script>
	<script>
	      function showHide(){      
		  var owner_profile="${is_owner}";
		  var hiddeninputs=document.getElementsByClassName("hidden");
		  for(var i=0;i!=hiddeninputs.length;i++)
			  {
			   if(owner_profile==1)
				   {
				   hiddeninputs[i].style.display="block";
				   }
			  }
		  }
	</script>
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
	<div class="hidden"><b>Url:</b><c:out value = "${owner.url}"/>
	<br>
	</div>
	<div class="hidden"><b>Description:</b><c:out value = "${owner.description}"/>
	<br>
	</div>
	<div class="hidden"><b>Location:</b><c:out value = "${owner.location}"/>
	<br>
	</div>
	<br>
	<button class="edit" type="submit" id="editf">Edit profile</button> 
	<br>
	<br>
	<button class="passf" type="submit" id="passf">Change password</button>
	</div>
	<br>
	<br>
	<button class="mess" type="submit" id="mes">Messaging</button>
	
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
	 <script type="text/javascript">
	             document.getElementById("mes").onclick=function(){
	            	 window.location.href='/rooms/contactuser';
	             };
	             </script>
	             
</body>
</html>