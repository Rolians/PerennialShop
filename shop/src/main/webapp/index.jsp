<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<html>
<head>
	<title>P-Mart</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">P-Mart</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="home">Home</a></li>
      <li><a href="productList">Product List</a></li>
      <li><a href="login">Login</a></li>
      <li><a href="custForm">Registration</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
  </div>
</nav>
</body>
<%-- <div><%@ include file = "/WEB_INF/jsp/header.jspf"%></div> --%>
<h3>welcome ${name}</h3>
<%-- <% System.out.print(${name}); %> --%>
</body>
</html>