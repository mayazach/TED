<!DOCTYPE HTML>
<html>
<head>
    <title>Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="css/form.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css">
    <link rel="stylesheet" type="text/css" href="css/navbar.css">
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
    <h1 style=text-align:center>Login page</h1>
    <form class=form1 action="${pageContext.request.contextPath}/login" method="POST">
    <table align="center">
	    <tr>
	    	<td>Username:</td><td><input type="text" name="username"></td>
	    </tr>
	    <tr>
	    	<td>Password:</td><td><input type="password" name="password"></td> 
	    </tr>
	    <tr>
    		<td><input name="submit" type="submit" value="Login"></td>
    	</tr>
    </table>
   </form> 
</body>
</html>