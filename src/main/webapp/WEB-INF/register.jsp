<!DOCTYPE html>
<html>
	<head>
		<title>Register New User</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="/css/form.css">
    	<link rel="stylesheet" type="text/css" href="/css/layout.css"> 
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/registerUser" method="post">
			<h2>User Registration</h2>
			<table>
				<tr>
					<td><label for="uname">Username:</label></td>
					<td><input type ="text" id="uname" name="uname"></td>
				</tr>
				<tr>
					<td><label for="pword">Password:</label></td>
					<td><input type ="password" id="pword" name="pword"></td>
					<td id = "pcheck"><td>
				</tr>
				<tr>
					<td><label for="confpw">Confirm Password:</label></td>
					<td><input type ="password" id="confpw"></td>
					<td id = "confcheck"><td>
				</tr>
				<tr>
					<td><label for="fname">First Name:</label></td>
					<td><input type ="text" id="fname" name="fname"></td>
				</tr>
				<tr>
					<td><label for="lname">Last Name:</label></td>
					<td><input type ="text" id="lname" name="lname"></td>
				</tr>
				<tr>
					<td><label for="mail">Email:</label></td>
					<td><input type ="text" id="mail" name="mail"></td>
				</tr>
				<tr>
					<td><label for="phone">Contact number:</label></td>
					<td><input type ="text" id="phone" name="phone"></td>
				</tr>
				<tr>
					<td><label for="role">Register as:</label></td>
					<td>
						<select id="role" name="role">
						  <option>Tenant</option>
						  <option>Host</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="mail">Profile picture:</label></td>
					<td><input type="file" name="filename" accept="image/gif, image/jpeg, image/png"></td>
				</tr>
			</table>
			
			<script>
			
				document.getElementById("pword").onblur = function(){
					var element = this.value;
					if(element.length < 8){
						document.getElementById("pcheck").innerHTML = "Password must be at least 8 characters long";
						document.getElementById("pcheck").style.color = "red";
					}
					else{
						document.getElementById("pcheck").innerHTML = "OK";
						document.getElementById("pcheck").style.color = "green";
					}
				}
				
				document.getElementById("confpw").onblur = function(){
					var element = this.value;
					if(element != document.getElementById("pword").value){
						document.getElementById("confcheck").innerHTML = "Passwords don't match";
						document.getElementById("confcheck").style.color = "red";
					}
					else{
						document.getElementById("confcheck").innerHTML = "OK";
						document.getElementById("confcheck").style.color = "green";
					}
				}
				
			</script>
			
			<input type="reset" value="Reset"/>
			<input type="submit" value="Submit"/>
		</form>
	</body>
</html>