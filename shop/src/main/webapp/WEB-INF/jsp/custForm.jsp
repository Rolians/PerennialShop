<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<style type="style.css">
</style>
<style>
input[type=text], select {
    width: 100%;
  	padding: 12px 20px;
   	margin: 8px 0;
   	border: 1px solid #ccc;
   	border-radius: 4px;
}

input[type=number],select{
	width: 100%;
	padding: 12px 16px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
}
input[type=password],select{
	width: 100%;
	padding: 12px 16px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
}
input[type=email],select{
	width: 100%;
	padding: 12px 16px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 12px 20px;
  text-align: center;
  font-size: 12px;
  cursor: pointer;
}
.button:hover {
  background-color: green;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function validation()
{
	var firstpassword=document.registration.password.value;  
	var secondpassword=document.registration.ConfirmPassword.value;  

	if(firstpassword == secondpassword){  
		return true;  
	}  
	else{  
		alert("password one and two must be same!");  
		return false;  
	}  
} 
</script>
</head>
<body bgcolor="Lavender">
	<%-- <%@ include file = "header.jspf"%> --%>
	<h2 align="center">Customer Registration </h2>
	<p align = "center"> ${ErrorMsg}</p>
	<form name="registration" action="/shop/custForm" method = "POST" onsubmit="return validation()">
		<table align="center">
			<tr>
				<td><h3>Name :</h3></td>
				<td><input type = "text" name = "custName" pattern="[A-Za-z]{5,}" title="five or more charcter" required></td>
			</tr>
			<tr>
				<td><h3>address : </h3></td>
				<td><input type = "text" name = "address" required></td>
			</tr>
			<tr>
				<td><h3>Email : </h3></td>
				<td><input type="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required></td>
			</tr>
			<tr>
				<td><h3>Contact :</h3></td>
				<td><input type = "text" name = "contact" pattern="[789][0-9]{9}" required></td>
			</tr>
			<tr>
				<td><h3>UserName : </h3></td>
				<td><input type = "text" name = "userName" required></td>
			</tr>
			<tr>
				<td><h3>password : </h3></td>
				<td><input type = "password" name = "password" id="password" pattern=".{6,}" title="Six or more characters" required></td>
			</tr>
			<tr>
				<td><h3>Confirm password : </h3></td>
				<td><input type = "password" name = "ConfirmPassword" id = "ConfirmPassword" required></td>
			</tr>
			<tr>
				<!-- <td><input tabindex="3" type="button" value="Submit" onClick="validatePassword();"/></td> -->
				<td><button type="submit" class="button" onClick=" return Validate();">Register</button></td> 
				<td><button type="reset" class="button">Reset</button></td>
			</tr>
		</table>
	</form>
</body>
</html>