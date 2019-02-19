<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#product td{
	font-size:20px;
	padding: 8px;
}
#insertTable td{
	font-size:20px;
	padding: 8px;
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
.form-submit-button{
	background-color: #4CAF50;
 	border: none;
  	color: white;
  	padding: 12px 20px;
  	text-align: center;
  	font-size: 12px;
  	cursor: pointer;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	  $("#show").click(function(){
	    $(".abc").toggle();
	  });
	});
</script>
<meta charset="ISO-8859-1">
<title>Select the product</title>
</head>
<body bgcolor="lavender">
	<div align = "center">
	<h2>Select the product</h2>
	<table id="product">
		<tr>
			<td >Product id</td>
			<td></td>
			<td>${product.prodId}</td>
		</tr>
		<tr>
			<td>Product Name</td>
			<td></td>
			<td>${product.prodName}</td>
		</tr>
		<tr>
			<td>Product Category</td>
			<td></td>
			<td>${product.category}</td>
		</tr>
		<tr>	
			<td>Product Price</td>
			<td></td>
			<td><label id="">${product.price}</td>
		</tr>
		<tr>
			<td>Available Quantity</td>
			<td></td>
			<td>${product.availQuantity}</td>
		</tr>
	</table>
	<button class="button" id="show">Select</button>
	</div>
	<div class="abc" align="center" style="display:none">
		<form action="addToCart">
		<table id="insertTable">
			<tr>
				<input type="hidden" name="prodId" value=${product.prodId}>
				<input type="hidden" name="price" value=${product.price}>
				<td>Product Name</td>
				<td><input type="text" name="prodName" value=${product.prodName} readonly></td>
			</tr>
			<tr>
				<td>Required Quantity</td>
				<td><input type = "number" id = "reqQuantity" name="reqQuantity" max="${product.availQuantity}" title = "must be less than available quantity" required></td>
			</tr>
			<tr>
				<td><button class="button" type="submit">Add to cart</button></td>
				<td><input type="reset" class="button"></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>