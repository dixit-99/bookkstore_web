<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Log In</title>
	<jsp:include page="head.jsp"></jsp:include>
	<script type="text/javascript">
		function login() {
			var email = document.getElementById("email");
			var password = document.getElementById("password");
			
			var htp=new XMLHttpRequest();
			htp.onreadystatechange=function(){
				if(htp.readyState==4){
						status = htp.responseText;
						if(status == "true")
							window.location.href = '/home';
						else
							$("#status").modal();
				}
			}
			htp.open("get","/verify?email="+email.value+"&password="+password.value,true);
			htp.send();
		}
		
		function show() {
			document.getElementById("password").type = 'text';
			document.getElementById("show1").style.display = 'none';
			document.getElementById("hide1").style.display = 'inline';
		}
		function hide() {
			document.getElementById("password").type = 'password';
			document.getElementById("show1").style.display = 'inline';
			document.getElementById("hide1").style.display = 'none';
		}
	</script>
	<style>
        body {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
<div class="container">

		<!-- ***** Header ***** -->
        <div class="row bg-primary" style="height: 70px; font-size: 30px;color: white;">
            <div class="col" style="text-align: center; padding-top: 15px;">
                BOOKSTORE - LOGIN
            </div>
        </div>
                
        <div class="row" style="margin-top: 20px;">
        	<div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="email">Email :</label>
                    <input class="form-control" id="email">
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
	                    <input type="password" class="form-control" id="password"/>
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
       
        <div class="row" style="height: 70px; font-size: 30px;">
            <div class="col-md-5"></div>
            <div class="col-md-2">
                <center>
                	<button type="button" onclick="login()" class="btn btn-outline-primary">Log In</button>
                </center>
            </div>
            <div class="col-md-5"></div>
        </div>
        
        <div class="modal" id="status">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title text-danger">Wrong Credentials</h4>
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		      </div>
		    </div>
		</div>

</div>
</body>
</html>