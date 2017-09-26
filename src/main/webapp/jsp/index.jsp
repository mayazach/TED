<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Room added</title>
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
    <h2>Room added successfully</h2>
     <script>
        var timer = setTimeout(function() {
            /*window.location='index.html'*/
            window.location.href='/rooms'
        }, 3000);
    </script>
</body>
</html>



