<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Bookstore - Profile</title>
	<jsp:include page="head.jsp"></jsp:include>
	<style>
        body {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-bottom: 40px;
        }

        .right {
            text-align: right;
            border-right: 2px solid blue;
        }

        table{
            font-size: 22px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

	<div class="container">
		<jsp:include page="menu.jsp"></jsp:include>
	</div>
	
	<div class="container">
			
        <div class="row justify-content-center wow fadeInDown" style="margin-top: 15px;">
        	<c:if test="${f:startsWith(user.gender,'m')}">
	            <div class="col-md-5">
	                <img src="resources/img/man.svg" style="height: 260px; width: 100%;">
	            </div>
            </c:if>
            <c:if test="${f:startsWith(user.gender,'f')}">
	            <div class="col-md-5">
	                <img src="resources/img/woman.svg" style="height: 260px; width: 100%;">
	            </div>
            </c:if>
        </div>

        <div class="row justify-content-center wow zoomIn" style="margin-top: 15px;">
            <div class="col-md-5">
                <table class="table table-primary table-striped">
                    <tbody>
                      <tr>
                        <td class="right"> User Name </td>
                        <td> ${user.userName} </td>
                      </tr>
                      <tr>
                        <td class="right"> User Type </td>
                        <td> ${user.userType} </td>
                      </tr>
                      <tr>
                        <td class="right"> Email </td>
                        <td> ${user.email} </td>
                      </tr>
                      <tr>
                        <td class="right"> Mobile No </td>
                        <td> ${user.mobileNo} </td>
                      </tr>
                      <tr>
                        <td class="right"> College </td>
                        <td> L.D College of Engineering </td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>

        <div class="row justify-content-center wow fadeInUp" style="margin-left: 30px;">
            <div class="col-md-2">
            	<a href="/editUser?userId=${user.userId}">
                	<button class="btn btn-outline-primary">Edit Details</button>
                </a>
            </div>
            <div class="col-md-2">
                <button class="btn btn-outline-danger">Logout</button>
            </div>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>