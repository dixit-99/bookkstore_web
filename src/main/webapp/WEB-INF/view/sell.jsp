<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Bookstore - Sell</title>
		<jsp:include page="head.jsp"></jsp:include>
		<script>
			function bookDetails(bookId) {
				window.location.href = '/bookkDetails?bookId='+bookId;
			}
			
			function deleteBook(bookId) {
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					if(htp.readyState==4){
						$("#here").load(" #here > *");
					}
				}
				htp.open("get","/deleteBook?bookId="+bookId,true);
				htp.send();
			}
			
			function sold(bookId) {
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					if(htp.readyState==4){
						$("#here").load(" #here > *");
					}
				}
				htp.open("get","/soldBook?bookId="+bookId,true);
				htp.send();
			}
			
			function sell(bookId) {
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					if(htp.readyState==4){
						$("#here").load(" #here > *");
					}
				}
				htp.open("get","/sellBook?bookId="+bookId,true);
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
	<c:if test="${sellingList.size() gt 0}">
		<c:forEach items="${sellingList}" var="book" varStatus="cnt">
			<%-- <c:if test="${cnt.count%2 ne 0}">
			<div class="d3 container wow fadeInLeft">
			</c:if>
			<c:if test="${cnt.count%2 eq 0}">
			<div class="d3 container wow fadeInRight">
			</c:if> --%>
			
			<div id="d${cnt.count}" class="d3 container wow fadeInUp">
				<div class="row">
					<div class="imgDiv col-md-4" onclick="bookDetails(${book.bookId})">
			  			<img src="${book.frontImage}" alt="BookImage">
			  		</div>
			  		
					<div class="imgDiv col-md-7" onclick="bookDetails(${book.bookId})">
						<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 20px"><strong> ${book.bookName} </strong></div> <br>
						<div style="margin-top: -25px;margin-left: 10px;">
							<strong>&#8377;${book.sellingPrice}</strong> 
							<span style="color: grey;font-size: 13px"><del>${book.originalPrice}</del></span>
							<span style="color: rgb(7, 119, 249);font-size:15px"><strong>${book.discount}% off</strong></span>
						</div>
						
						<c:if test="${book.status eq true}">
							<span style="color:#fc5705; font-size: 22px; padding-left: 10px;"> Waiting For Buyer... </span><br>
						</c:if>
						
						<c:if test="${book.status eq false}">
							<span style="color:#fc5705; font-size: 22px; padding-left: 10px;"> Delivered <i class="fa fa-check-circle" aria-hidden="true"></i> </span><br>
						</c:if>
						
						<acronym title="Users Seen This Book ${book.views} Times"><span class="badge" style="background-color: #fc5705; color: white"><i class="fa fa-eye"></i> ${book.views} </span></acronym>
					</div>
					
					<div class="imgDiv col-md-1">
						<acronym title="Delete The Book"><img src="img/delete.svg" style="height: 25px; margin-left: -80px; margin-top: 15px;" onclick="deleteBook(${book.bookId})"><br></acronym>
						<acronym title="Edit Book Details"><a href="/editBook?bookId=${book.bookId}"><img src="img/editBook.svg" style="height: 30px; margin-left: -75px; margin-top: 7px;")"></a></acronym>
						
						<c:if test="${book.status eq true}">
							<acronym title="Mark As Sold"><img src="img/sold.svg" style="height: 30px; margin-left: -75px; margin-top: 30px;")" onclick="sold(${book.bookId})"></acronym>
						</c:if>
						
						<c:if test="${book.status eq false}">
							<acronym title="Mark For Sell"><img src="img/sell.svg" style="height: 30px; margin-left: -75px; margin-top: 30px;")" onclick="sell(${book.bookId})"></acronym>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${sellingList.size() eq 0}">
		<div class="row justify-content-center wow fadeInUp">
			<img src="img/book.svg">
		</div>
		
		<div class="row justify-content-center wow fadeInUp" style="font-size: 30px; margin-top: 15px;">
			 Not Added Any Books Yet
		</div>
	</c:if>
	</div>
	
	<div class="wow fadeInUp" style="position: absolute; top: 10%; right:15%;">
		<acronym title="Add New Book For Sell"><a href="/addBook"><img src="img/addBook.svg" style="height: 100px;"></a></acronym>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	
</body>
</html>