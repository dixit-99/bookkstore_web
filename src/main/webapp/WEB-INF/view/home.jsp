<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Bookstore - Home</title>
		<jsp:include page="head.jsp"></jsp:include>
		<script>
			function getSubject() {
				var branch = document.getElementById("branchName").value;
				var sem = document.getElementById("semester").value;
				var sub = document.getElementById("subject");
				document.getElementById("apply").disabled = true;
				
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					if(htp.readyState==4){
						sub.innerHTML="";
						var opn = document.createElement("option");
						opn.text = "-- Select --";
						opn.value = " ";
						sub.options.add(opn);
						var data = JSON.parse(htp.responseText);
						for (var i = 0; i < data.length; i++) {
							
							var subjectId = data[i].subjectId;
							var subjectCode = data[i].subjectCode;
							var subjectName = data[i].subjectName;
							
							var opn = document.createElement("option");
							
							opn.text = subjectName;
							opn.value = subjectId;
							
							sub.options.add(opn);
						}
					}
				}
				htp.open("get","/getSubject?branch="+branch+"&sem="+sem,true);
				htp.send();
			}
			
			function setSubject(subject) {
				var pttr = /^[1-9]{1}/;
				if(subject.match(pttr))
					document.getElementById("apply").disabled = false;
				else
					document.getElementById("apply").disabled = true;
			}
			
			function applyFilter() {
				$("#filter").modal("hide");
				var subjectId = document.getElementById("subject").value;
				var bookCondition = document.getElementById("bookCondition").value;
				
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					if(htp.readyState==4){
						$("#here").load(" #here > *");
					}
				}
				if(bookCondition.length > 2)
					htp.open("get","/bookCondition?subjectId="+subjectId+"&bookCondition="+bookCondition,true);
				else
					htp.open("get","/applyFilter?subjectId="+subjectId,true);
				htp.send();
			}
			
			function sortBooks(i) {
				$("#sort").modal("hide");
				
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					if(htp.readyState==4){
						$("#here").load(" #here > *");
					}
				}
				htp.open("get","/sortBooks?option="+i,true);
				htp.send();
			}	
			
			function bookDetails(bookId) {
				
				var htp=new XMLHttpRequest();
				htp.open("get","/incrementViews?bookId="+bookId,true);
				htp.send();
				
				window.location.href = '/bookDetails?bookId='+bookId;
			}
			
			function addWish(userId, bookId, hid, wid) {
				
				$('#add').toast({delay: 1350});
			    $('#add').toast('show');
				document.getElementById(hid).style.display = 'none';
				document.getElementById(wid).style.display = 'inline';
				var htp=new XMLHttpRequest();
				htp.onreadystatechange=function(){
					
				}
				htp.open("get","/addWish?userId="+userId+"&bookId="+bookId,true);
				htp.send();
			}
			
			function rmWish(userId, bookId, hid, wid) {
				
				$('#rm').toast({delay: 1350});
			    $('#rm').toast('show');
				document.getElementById(wid).style.display = 'none';
				document.getElementById(hid).style.display = 'inline';
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
	<div class="row justify-content-center">
		<div class="col-md-5">
			<div class="row filter">
				<div class="col-md-6" data-toggle="modal" data-target="#sort"> <i class="fa fa-sort"></i> Sort </div>
				<div class="col-md-6" data-toggle="modal" data-target="#filter"> <i class="fa fa-filter"></i> Filter </div>
			</div>
		</div>
	</div>
	<div class="d2"></div>
	
	<div id="here">
	<c:if test="${sessionScope.bookList.size() gt 0}">
	<c:forEach items="${sessionScope.bookList}" var="book" varStatus="cnt">
		<%-- <c:if test="${cnt.count%2 ne 0}">
		<div class="d3 container wow fadeInLeft">
		</c:if>
		<c:if test="${cnt.count%2 eq 0}">
		<div class="d3 container wow fadeInRight">
		</c:if> --%>
		
		<div class="d3 container wow fadeInUp">
			<div class="row">
				<div class="imgDiv col-md-4" onclick="bookDetails(${book.bookId})">
		  			<img src="<%request.getContextPath();%>/documents/file/${book.frontImage}" alt="BookImage">
		  		</div>
		  		
				<div class="imgDiv col-md-7" onclick="bookDetails(${book.bookId})">
					<div class="mb-0 mt-2" style="margin-left: 10px;font-size: 20px"><strong> ${book.bookName} </strong></div> <br>
					<div style="margin-top: -25px;margin-left: 10px;">
						<strong>&#8377;${book.sellingPrice}</strong> 
						<span style="color: grey;font-size: 13px"><del>${book.originalPrice}</del></span>
						<span style="color: rgb(7, 119, 249);font-size:15px"><strong>${book.discount}% off</strong></span>
					</div>
					<span class="badge badge-primary">${book.subject.subjectName}</span>
					<span class="badge badge-primary">${book.authorName}</span>
					<span class="badge badge-primary">${book.publication}</span>
					<span class="badge badge-primary">SEM ${book.subject.semester}</span>
				</div>
				
				<div class="imgDiv col-md-1">
					<img id="h${cnt.count}" src="img/heart.svg" alt="BookImage" style="height: 25px; margin-left: -80px; margin-top: 15px;" onclick="addWish(${sessionScope.user},${book.bookId},'h${cnt.count}','w${cnt.count}')">
					<img id="w${cnt.count}" src="img/wishlist.svg" alt="BookImage" style="height: 25px; margin-left: -80px; margin-top: 15px; display: none" onclick="rmWish(${sessionScope.user},${book.bookId},'h${cnt.count}','w${cnt.count}')">
				</div>
			</div>
		</div>
	</c:forEach>
	</c:if>
	<c:if test="${sessionScope.bookList.size() eq 0}">
		<div class="row justify-content-center wow fadeInUp">
			<img src="img/emptyBookList.svg">
		</div>
		
		<div class="row justify-content-center wow fadeInUp" style="font-size: 30px;margin-right: 10px; margin-top: 15px;">
			 Not Have Any Books
		</div>
	</c:if>
	</div>
	
	<div class="modal fade" id="sort">
	    <div class="modal-dialog" style="width: 400px;">
	      <div class="modal-content">
	      
	        <div class="modal-header justify-content-center">
	          <h4 class="modal-title text-primary">Sort By</h4>
	        </div>
	        
	        <div class="modal-body ">
				<div class="form-check justify-content-center">
					<label class="form-check-label">
						<h5> <input type="radio" class="form-check-input" name="optradio" checked onclick="sortBooks(1)"> Newest First </h5>
					</label>
				</div>
				<div class="form-check justify-content-center">
					<label class="form-check-label">
						<h5> <input type="radio" class="form-check-input" name="optradio" onclick="sortBooks(2)"> Oldest First </h5>
					</label>
				</div>
				<div class="form-check justify-content-center">
					<label class="form-check-label">
						<h5> <input type="radio" class="form-check-input" name="optradio" onclick="sortBooks(3)"> Popularity </h5>
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
					  <h5> <input type="radio" class="form-check-input" name="optradio" onclick="sortBooks(4)"> Price : Low to High </h5>
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
					  <h5> <input type="radio" class="form-check-input" name="optradio" onclick="sortBooks(5)"> Price : High to Low </h5>
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
					  <h5> <input type="radio" class="form-check-input" name="optradio" onclick="sortBooks(6)"> Discount : Low to High </h5>
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label">
					  <h5> <input type="radio" class="form-check-input" name="optradio" onclick="sortBooks(7)"> Discount : High to Low </h5>
					</label>
				</div>
	        </div>
	        
	      </div>
	    </div>
	</div>
	
	<div class="modal fade" id="filter">
	    <div class="modal-dialog modal-dialog-centered" style="width: 400px;">
	      <div class="modal-content">
	      
	        <div class="modal-header justify-content-center">
			  <h4 class="modal-title text-primary">Book Filter</h4>
	        </div>
	        
	        <div class="modal-body justify-content-center">
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="branchName"> <b class="text-danger">*</b> Branch Name :</label>
							<select class="form-control" id="branchName" onchange="getSubject()">
								<option value=" "> -- Select -- </option>
								<option value="1"> Computer </option>
								<option value="2"> Electrical </option>
								<option value="3"> Mechanical </option>
								<option value="4"> Civil </option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="semester"> <b class="text-danger">*</b> Semester :</label>
							<select class="form-control" id="semester" onchange="getSubject()">
								<option value=" "> -- Select -- </option>
								<option value="1"> 1 </option>
								<option value="2"> 2 </option>
								<option value="3"> 3 </option>
								<option value="4"> 4 </option>
								<option value="5"> 5 </option>
								<option value="6"> 6 </option>
								<option value="7"> 7 </option>
								<option value="8"> 8 </option>
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="subject"><b class="text-danger">*</b> Subject Name :</label>
							<select class="form-control" id="subject" onchange="setSubject(this.value)">
								<option value=" "> -- Select -- </option>
							</select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="subject"> Book Condition :</label>
							<select class="form-control" id="bookCondition">
								<option value=" "> -- Select -- </option>
								<option value="best"> Best </option>
                            	<option value="good"> Good </option>
                            	<option value="medium"> Medium </option>
                            	<option value="poor"> Poor </option>
                            </select>
						</div>
					</div>
				</div>
	        </div>
	        
	        <div class="modal-footer justify-content-center">
				<button type="button" class="col-4 btn btn-outline-danger" data-dismiss="modal">Close</button>
			    <button type="button"  id="apply" class="col-4 btn btn-outline-primary" onclick="applyFilter()" disabled>Apply</button>
	        </div>
	        
	      </div>
	    </div>
	</div>
	
	<div id="add" class="toast mt-3" style="position: fixed; top: 47%; right:5%; z-index:-1;">
		<div class="toast-header text-white" style="background-color:#fc5705">
		  Book Successfully Added To Wishlist
		</div>
	</div>
	
	<div id="rm" class="toast mt-3" style="position: fixed; top: 47%; right:3%;z-index:-1;">
		<div class="toast-header text-white bg-primary">
		  Book Successfully Removed From Wishlist
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>