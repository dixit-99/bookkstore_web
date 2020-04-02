<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Bookstore - Order</title>
		<jsp:include page="head.jsp"></jsp:include>
		<script>
			function bookDetails(bookId) {
				window.location.href = '/bookkDetails?bookId='+bookId;
			}
			
			function deleteOrder(orderId, divId) {
				
				document.getElementById(divId).style.display = 'none';
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					
				}
				htp.open("get","/deleteOrder?orderId="+orderId,true);
				htp.send();
			}
		</script>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	<c:if test="${orderList.size() gt 0}">
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="row filter">
				<div class="col-md-12" style="text-align: center"> <b>*</b> If Deal Is Canceled Then Delete That Book</div>
			</div>
		</div>
	</div>
	</c:if>

	<div class="d2"></div>
	
	<div id="here">
	<c:if test="${orderList.size() gt 0}">
		<c:forEach items="${orderList}" var="order" varStatus="cnt">
			
			<div id="d${cnt.count}" class="d3 container wow fadeInUp">
				<div class="row">
					<div class="imgDiv col-md-4" onclick="bookDetails(${order.book.bookId})">
			  			<img src="<%request.getContextPath();%>/documents/file/${order.book.frontImage}" alt="BookImage">
			  		</div>
			  		
					<div class="imgDiv col-md-7" onclick="bookDetails(${order.book.bookId})">
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 20px"><strong> ${order.book.bookName} </strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${order.book.sellingPrice}</strong> 
							<span style="color: grey;font-size: 13px"><del>${order.book.originalPrice}</del></span>
							<span style="color: rgb(7, 119, 249);font-size:15px"><strong>${order.book.discount}% off</strong></span>
						</div>
						<span style="color:#fc5705; font-size: 22px; padding-left: 10px;"> Order Date : <fmt:formatDate value="${order.date}" type="date" pattern="dd-MMM-yyyy"/></span><br>
						<span style="color:#fc5705; font-size: 22px; padding-left: 10px;"> Order Time : <fmt:formatDate value="${order.date}" type="time" pattern="h:m:s a"/></span><br>
					</div>
					
					<div class="imgDiv col-md-1">
						<img src="img/delete.svg" style="height: 25px; margin-left: -80px; margin-top: 15px;" onclick="deleteOrder(${order.orderId},'d${cnt.count}')">
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${orderList.size() eq 0}">
		<div class="row justify-content-center wow fadeInUp">
			<img src="img/cart.svg">
		</div>
		
		<div class="row justify-content-center wow fadeInUp" style="font-size: 30px;margin-left: 10px; margin-top: 15px;">
			 You Haven't Ordered Any Book Yet
		</div>
	</c:if>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>