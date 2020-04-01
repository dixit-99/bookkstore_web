<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Bookstore - Order</title>
		<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	
	<div class="container">
		<div style="border: 1px solid red; margin-top: 10px;">
			SELL
			<br><br>
			<a href="/addBook"><button type="button" class="btn btn-outline-primary">Add Book</button></a><br><br>
		</div>
	</div>
</body>
</html>