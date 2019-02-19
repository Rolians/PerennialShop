<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#loginTable{

	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	padding : 8px;
}
</style>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%-- <div><%@ include file = "header.jspf"%></div> --%>
	<p>	${ErrorMsg} </p>
	<form action="/shop/login" method = POST>
		<table id="loginTable" align="center">
			<tr>
				<td>User Name </td>
				<td><input type = "text" name = "userName"></td>
			</tr>
			<tr>
				<td>PassWord</td>
				<td> <input type = "password" name = "password"></td>
			</tr>
			<tr>
				<td><button type="submit"> Login</button></td>
				<td><button type="reset" onClick = "location.href='index.jsp">Cancel</button></td>
			</tr>
		</table>
	</form>
</body>
</html>