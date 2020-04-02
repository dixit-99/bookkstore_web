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
	<!-- <div class="container-fluid">
        <nav class="navbar navbar-expand-md fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"> 
                  Bookstore 
                </a>
            </div>
        </nav>
    </div> -->
    <div class="container">
    	<a href="/signup"><button type="button" class="btn btn-outline-primary">Sign Up</button></a><br><br>
    	<a href="/login"><button type="button" class="btn btn-outline-primary">Log In</button></a>
    </div><br>
    
    <c:if test="${!(sessionScope.required ne true)}">
    <div class="row justify-content-center">
    	<div class="col-md-4">
    		<div class="alert alert-danger">
			  <strong>LogIn Or SignUp Required..!!</strong></a>.
			</div>
    	</div>
    </div>
    </c:if>
    <c:remove var="required" scope="session"/>
</body>
</html>