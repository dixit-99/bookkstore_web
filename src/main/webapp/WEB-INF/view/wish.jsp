<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Bookstore - Wishlst</title>
		<jsp:include page="head.jsp"></jsp:include>
		<script>
			function bookDetails(bookId) {
				window.location.href = '/bookDetails?bookId='+bookId;
			}
			
			function rmWish(userId, bookId, divId) {
				
				document.getElementById(divId).style.display = 'none';
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					
				}
				htp.open("get","/rmWish?userId="+userId+"&bookId="+bookId,true);
				htp.send();
			}
		</script>
</head>
<body>

	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>

	<div class="d2"></div>
	
	<div id="here">
	<c:if test="${wishlist.size() gt 0}">
		<c:forEach items="${wishlist}" var="wish" varStatus="cnt">
			<%-- <c:if test="${cnt.count%2 ne 0}">
			<div class="d3 container wow fadeInLeft">
			</c:if>
			<c:if test="${cnt.count%2 eq 0}">
			<div class="d3 container wow fadeInRight">
			</c:if> --%>
			
			<div id="d${cnt.count}" class="d3 container wow fadeInUp">
				<div class="row">
					<div class="imgDiv col-md-4" onclick="bookDetails(${wish.book.bookId})">
			  			<img src="<%request.getContextPath();%>/documents/file/${wish.book.frontImage}" alt="BookImage">
			  		</div>
			  		
					<div class="imgDiv col-md-7" onclick="bookDetails(${wish.book.bookId})">
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 20px"><strong> ${wish.book.bookName} </strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${wish.book.sellingPrice}</strong> 
							<span style="color: grey;font-size: 13px"><del>${wish.book.originalPrice}</del></span>
							<span style="color: rgb(7, 119, 249);font-size:15px"><strong>${wish.book.discount}% off</strong></span>
						</div>
						<span class="badge badge-primary">${wish.book.subject.subjectName}</span>
						<span class="badge badge-primary">${wish.book.authorName}</span>
						<span class="badge badge-primary">${wish.book.publication}</span>
						<span class="badge badge-primary">SEM ${wish.book.subject.semester}</span>
					</div>
					
					<div class="imgDiv col-md-1">
						<img src="resources/img/delete.svg" style="height: 25px; margin-left: -80px; margin-top: 15px;" onclick="rmWish(${sessionScope.user},${wish.book.bookId},'d${cnt.count}')">
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${wishlist.size() eq 0}">
		<div class="row justify-content-center wow fadeInUp">
			<img src="resources/img/wishempty.svg">
		</div>
		
		<div class="row justify-content-center wow fadeInUp" style="font-size: 30px;margin-right: 10px; margin-top: 15px;">
			 Your Wishlist Is Empty
		</div>
	</c:if>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	
</body>
</html>