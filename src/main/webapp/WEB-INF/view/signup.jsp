<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Sign Up</title>
		<jsp:include page="head.jsp"></jsp:include>
		<style>
			body {
			    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
			    margin-bottom: 40px;
			}
		</style>
		<script type="text/javascript">
			function show() {
				document.getElementById("password").type = 'text';
				document.getElementById("confirmPassword").type = 'text';
				document.getElementById("show1").style.display = 'none';
				document.getElementById("hide1").style.display = 'inline';
			}
			function hide() {
				document.getElementById("password").type = 'password';
				document.getElementById("confirmPassword").type = 'password';
				document.getElementById("show1").style.display = 'inline';
				document.getElementById("hide1").style.display = 'none';
			}
		</script>
</head>
<body>
<div class="container">

		<!-- ***** Header ***** -->
        <div class="row bg-primary" style="height: 70px; font-size: 30px;color: white;">
            <div class="col" style="text-align: center; padding-top: 15px;">
                BOOKSTORE - SIGN UP
            </div>
        </div>
		
		<form:form action="/addUser" method="post" modelAttribute="user">
		
			<div class="row" style="margin-top: 20px;">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <label for="userName">User Name :</label>
	                    <form:input path="userName" class="form-control" id="userName"/>
	                </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <div class="row">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	            	<div class="form-group">
		            	<label for="password">Password :</label>
		                <div class="input-group mb-3">
		                    <form:input path="password" type="password" class="form-control" id="password"/>
		                    <div class="input-group-btn">
        						<button id="show1" class="btn btn-primary reveal" type="button" onclick="show()">
        							<i class="fa fa-eye" aria-hidden="true"></i>
        						</button>
        						<button id="hide1" class="btn btn-primary reveal" type="button" onclick="hide()" style="display: none;">
        							<i class="fa fa-eye-slash" aria-hidden="true"></i>
        						</button>
      						</div>
		                </div>
		             </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <div class="row">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <label for="confirmPassword">Confirm Password :</label>
	                    <input type="password" class="form-control" id="confirmPassword">
	                </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <div class="row">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <label for="email">Email :</label>
	                    <form:input path="email" class="form-control" id="email"/>
	                </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <div class="row">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	                <div class="form-group">
	                    <label for="mobileNo">Mobile Number :</label>
	                    <form:input path="mobileNo" class="form-control" id="mobileNo"/>
	                </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <div class="row">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	                <div class="form-check-inline">
					      <label class="form-check-label">User Type : </label>
				    </div>
				    <div class="form-check-inline">
				      <label class="form-check-label" for="radio1">
				        <form:radiobutton path="userType" class="form-check-input" id="radio1" value="Student"/> Student
				      </label>
				    </div>
				    <div class="form-check-inline">
				      <label class="form-check-label" for="radio2">
				        <form:radiobutton path="userType" class="form-check-input" id="radio2" value="Faculty"/> Faculty
				      </label>
				    </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <div class="row" style="margin-top: 20px;">
	        	<div class="col-md-3"></div>
	            <div class="col-md-6">
	                <div class="form-check-inline">
					      <label class="form-check-label">Gender : </label>
				    </div>
				    <div class="form-check-inline">
				      <label class="form-check-label" for="radio1">
				        <form:radiobutton path="gender" class="form-check-input" id="radio1" value="male"/> Male
				      </label>
				    </div>
				    <div class="form-check-inline">
				      <label class="form-check-label" for="radio2">
				        <form:radiobutton path="gender" class="form-check-input" id="radio2" value="female"/> Female
				      </label>
				    </div>
	            </div>
	            <div class="col-md-3"></div>
	        </div>
	        
	        <form:input path="userId" type="hidden"/>
	        
	        <div class="row" style="height: 70px; font-size: 30px; margin-top: 30px;">
                <div class="col-md-4"></div>
                <div class="col-md-2">
                    <center><input type="reset" type="button" class="btn btn-outline-danger"></center>
                </div>
                <div class="col-md-2">
                    <center><input type="submit" value="Sign Up" type="button" class="btn btn-outline-primary"></center>
                </div>
                <div class="col-md-4"></div>
            </div>
	      
		</form:form>
</div>
</body>
</html>