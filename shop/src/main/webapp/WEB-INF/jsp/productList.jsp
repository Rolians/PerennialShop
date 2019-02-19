<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link href='https://fonts.googleapis.com/css?family=Rock+Salt' rel='stylesheet' type='text/css'>
<link href="style.css" rel="stylesheet" type="text/css">		
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css"><link>
<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"></link>
<style type="text/css">
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 80%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center; 
  background-color: #4CAF50;
  color: white;
}
</style>

<script src='./resource/js/jquery-1.8.3.min.js'></script>
<script src='./resource/js/jquery.dataTables.min.js'></script>
<script src='http://code.jquery.com/ui/1.9.2/jquery-ui.js'></script>
<script src='./resource/js/my-demo-table-script.js'></script>
<script type="text/javascript"  

src="js/data_table/jquery.dataTables.plugins.js"></script> 
<!-- <script>
$(document).ready(function() {
    $('#customers').DataTable();
} );
</script> -->


</head>

<body bgcolor = "lavender">
	 <div><%@ include file = "header.jspf"%></div>
	<h2 align = "center">List of Products</h2>
	<p id="demo"></p>
	<div>
		<form action="productList">
			<table align ="center">
				<tr>
					<td><H4>Enter the product name</H4></td>
					<td><input type="text" name="sname"></td>
					<td><input  type = submit></td>
					<!-- <td><button type="button" onClick = "location.href='productList'">Search</button></td> -->
				</tr>
			</table>
		</form>
	</div>
	<div>
		<form action="sortProductList">
			<table cellspacing="15" align ="center">
				<tr>
					<td><H4>Sort by</H4></td>
					<td><select name="sortAttribute">
						<option value="prodName" name="prodName"> Product Name </option>
						<option value="category" name="category"> Category </option>
						</select></td>
					<td><input  type = submit value="Submit"></td>
					<!-- <td><button type="button" onClick = "location.href='productList'">Search</button></td> -->
				</tr>
			</table>
		</form>
	</div>
	<div>
	<form:form>
		
			<!-- <tr>
				<td><H3>Enter the product name</H3></td>
				<td><input type="text" name="sname"></td>
				<td><button type="button" onClick = "location.href='productList'">Search</button></td>
			</tr> -->

		<table id = "customers" class='display' align="center">
			<tr align="center">	
				<th>Product Id</th>
				<th>Name</th>
				<th>Available Quantity</th>
				<th>Price</th>
				<th>Category</th>
				<th>Select</th>
			</tr >
		 <c:forEach var="product" items="${list}" >
				<tr align="center">
					<td> ${product.prodId} </td>
					<td> ${product.prodName} </td>
					 <td> ${product.availQuantity}</td>
					<td> ${product.price} </td>
					<td> ${product.category} </td>
					<td><a href="selectProduct?prodId=${product.prodId}">select</a></td>
				</tr>
			</c:forEach>
		</table>
		</form:form>
	</div>	
</body>
</html>
<script>

$(function () {
    $("#customers").DataTable({
        "searching": true,
        "sorting": true,
        "paging": true,
        "columns": [{
            "orderable": true
        }, {
            "orderable": true
        }, {
            "orderable": true
        }, {
            "orderable": true
        }, {
            "orderable": true
        },{
            "orderable": false
        }]
    });

});

</script>
