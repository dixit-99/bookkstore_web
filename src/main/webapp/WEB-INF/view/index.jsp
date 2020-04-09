<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<jsp:include page="head.jsp"></jsp:include>
	<title>BookStore</title>
</head>
<body>

	<div class="container">
        <div class="row bg-primary" style="height: 58px; font-size: 34px;color: white; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
            <div class="col" style="text-align: center; padding-top: 5px;">
                BOOKSTORE
            </div>
        </div>
    </div>
	
	<c:if test="${!(sessionScope.required ne true)}">
    <div class="container alert alert-danger wow zoomIn" style="margin-top: 10px; text-align: center;">
        <strong> Access Denied..!! </strong> Either Login or Register Your Self
    </div>
    </c:if>
    <c:remove var="required" scope="session"/>

    <div class="container carousel slide wow zoomIn" data-ride="carousel" style="margin-top: 10px;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/bookstore.jpg" style="width: 97%; height: 600px;">
                <div class="carousel-caption" style="color: black;">
                <a href="/signup"><button class="btn btn-outline-primary btn-lg" style="width: 125px;">Register</button></a>
                <a href="/login"><button class="btn btn-outline-primary btn-lg" style="width: 125px;">Login</button></a>
                </div>   
            </div>
        </div>
    </div>

    <div class="container" style="margin-top: 20px; font-size: 26px; text-align: justify;">
        <p class="wow fadeInUp">
            Often students get confused while selecting a good reference book or textbook as in which edition of which publication should 
            they refer, also some students do not know from where they can get perfect study material like previous university papers and 
            their solution.
        </p>
        <p class="wow fadeInUp">
            When semester is over, students go to book stall for return their books at that time book stall gave them <b>20-40%</b> price of that book. 
            And then they sold this book at <b>60-80%</b> price to their juniors. In this process book stall gets the commission of <b>20-40%</b> of the book price. 
            But if senior students directly sold their book to junior students so seller student get nice price rate and the buyer student get the book 
            at reasonable price rate. 
        </p>
        <p class="wow fadeInUp">
            So, to help those students out, using this online platform the junior students can directly buy books 
            from their seniors. This platform will be beneficial for both seniors as well as juniors. 
        </p>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
    
</body>
</html>