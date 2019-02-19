<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Cart</title>
<style type="text/css">
#cart {	
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}
#cart td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}
#cart th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #4CAF50;
  color: white;
}
#cart td {
	text-align: center;
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</style>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	  $("#show").click(function(){
	    $(".place").toggle();
	  });
	});
</script>
</head>
<body>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   		<h2 align="center" >Your Cart</h2>
   			<table id="cart" frame="box" align="center" width = "60%" text-align = "center">
   				<tr>
   					<th>Product name</th>
   					<th>Quantity</th>
   					<th>Price</th>
   					<th>Update</th>
   					<th>Remove</th>
   				</tr>
   				<c:forEach var="order" items="${list}">
   					<tr>
   						<td>${order.prodName}</td>
   						<td>${order.reqQuantity}</td>
   						<td>${order.price}</td>
   						<td><button></button></td>
   						<td><button onclick="location.href='deleteFromCart?orderId=${order.orderId}'"></button></td>
   						<!-- <td><a href="#">update</a></td>
   						<td><a href="#">Remove</td> -->
   					</tr>
   				</c:forEach>
   			</table>
   			<div align = center><h3>Total : Rs. ${sum}</h3>
   			<button class="button" id = "show"> Place Order </button></div>
   		<div align = center class ="place" style='display:none'>
   		<form action = "checkOut" method = "GET">
   			<h3 syle='Font-color:red'>Your order has been placed successfully!!!</h3>
   			<input type="hidden" name = "orderPrice"  value = ${sum}>
   			<button type = "submit" class="button">OK</button>
   		</form>	
   		</div>
</body>
</html>