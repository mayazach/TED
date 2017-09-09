<!DOCTYPE html>
<html>
	<head>
		<title>Register New User</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" href="/css/form.css">
    	<link rel="stylesheet" type="text/css" href="/css/layout.css"> 
	</head>
	<body>
		<form action="" method="post">
			<h2>User Registration</h2>
			<table>
				<tr>
					<td><label for="uname">Username:</label></td>
					<td><input type ="text" id="uname"></td>
				</tr>
				<tr>
					<td><label for="pword">Password:</label></td>
					<td><input type ="text" id="pword"></td>
				</tr>
				<tr>
					<td><label for="confpw">Confirm Password:</label></td>
					<td><input type ="text" id="confpw"></td>
				</tr>
				<tr>
					<td><label for="fname">First Name:</label></td>
					<td><input type ="text" id="fname"></td>
				</tr>
				<tr>
					<td><label for="lname">Last Name:</label></td>
					<td><input type ="text" id="lname"></td>
				</tr>
				<tr>
					<td><label for="mail">Email:</label></td>
					<td><input type ="text" id="mail"></td>
				</tr>
				<tr>
					<td><label for="mail">Contact number:</label></td>
					<td><input type ="text" id="mail"></td>
				</tr>
				<tr>
					<td><label for="role">Register as:</label></td>
					<td>
						<select id="role">
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
			<input type="reset" value="Reset"/>
			<input type="submit" value="Submit"/>
		</form>
	</body>
</html>