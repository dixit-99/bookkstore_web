<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>BookStore - Book Details</title>
		<jsp:include page="head.jsp"></jsp:include>
		<style>
			.right {
	            border-right: 2px solid blue;;
	            text-align: right;
	        }
	        .filter {
	          color: white;
	          text-align: center;
	          height: 40px;
	          font-size: 25px;
	          background-color: #fc5705;
	          border-bottom-left-radius: 10px;
	          border-bottom-right-radius: 10px;
	        }
	
	        .filter > div:hover {
	          border-bottom-left-radius: 10px;
	          border-bottom-right-radius: 10px;
	          background-color: rgba(0, 0, 0, 0.100);
	        }
		</style>
		<script>
		function addWish(userId, bookId) {
			
			document.getElementById("add").style.display = 'none';
			document.getElementById("rm").style.display = 'inline';
			var htp=new XMLHttpRequest();
			htp.onreadystatechange=function(){
				
			}
			htp.open("get","/addWish?userId="+userId+"&bookId="+bookId,true);
			htp.send();
		}
		
		function rmWish(userId, bookId) {
			
			document.getElementById("rm").style.display = 'none';
			document.getElementById("add").style.display = 'inline';
			var htp=new XMLHttpRequest();
			htp.onreadystatechange=function(){
				
			}
			htp.open("get","/rmWish?userId="+userId+"&bookId="+bookId,true);
			htp.send();
		}
		
		function order() {
			$("#buyNow").modal("hide");
			$("#order").modal({backdrop: "static"});
		}
		
		function orderConfirmed(bookId) {
			$("#order").modal("hide");
			
			var htp=new XMLHttpRequest();
			htp.onreadystatechange=function(){
				window.location.href = '/home';
			}
			htp.open("get","/orderBook?bookId="+bookId,true);
			htp.send();
		}
		</script>
</head>
<body>
	<div class="container">

        <div class="row bg-primary" style="height: 45px; font-size: 25px;color: white; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
            <div class="col" style="text-align: center; padding-top: 5px;">
                BOOK DETAILS
            </div>
        </div>
        
        <c:if test="${!(sessionScope.noBuy ne null)}">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="row filter">
              <div id="add" class="col-md-6" onclick="addWish(${sessionScope.user},${book.bookId})"> Add To Wishlist </div>
              <div id="rm" class="col-md-6" onclick="rmWish(${sessionScope.user},${book.bookId})" style="display: none"> Remove From Wishlist </div>
              <div class="col-md-6" data-toggle="modal" data-target="#buyNow" data-backdrop="static"> Buy Now </div>
            </div>
          </div>
        </div>
        </c:if>
        <c:remove var="noBuy" scope="session"/>

        <div style="width: 35%; float: left;">

            <div class="row justify-content-end wow fadeInLeft" style="margin-top: 102px;">
                <div class="col-md-9">
                    <img src="userBooks/${book.frontImage}" style="height: 320px; width: 100%; border: 2px solid black;">
                </div>
            </div>

            <div class="row justify-content-end wow fadeInLeft" style="margin-top: 15px;">
                <div class="col-md-9">
                    <img src="userBooks/${book.backImage}" style="height: 320px; width: 100%; border: 2px solid black;">
                </div>
            </div>

        </div>

        <div style="width: 65%; float: left;">
            
            <div class="row justify-content-center wow zoomIn" style="text-align: center; margin-top: 15px; margin-left: -400px;">
                <div class="col-md-6">
                    <h4> ${book.bookName} </h4>
                </div>
            </div>
    
            <div class="row justify-content-center wow zoomIn" style="text-align: center; margin-left: -400px">
                <div class="col-md-6">
                    <span style="font-size: 25px;"><b>&#8377;${book.sellingPrice}</b></span>
                    <span style="color: grey;font-size: 18px"><del>${book.originalPrice}</del></span>
                    <span style="color: #fc5705;font-size:18px"><strong>${book.discount}% off</strong></span>
                </div>
            </div>
    
            <div class="row justify-content-center wow fadeInRight" style="font-size: 25px;margin-top: 15px;">
                <div class="col-md-10">
                    <table class="table table-striped table-primary">
                        <tbody>
                            <tr>
                              <td class="right"> Book Name </td>
                              <td> ${book.bookName} </td>
                            </tr>
                          <tr>
                            <td class="right"> Subject </td>
                            <td> ${book.subject.subjectName} </td>
                          </tr>
                          <tr>
                            <td class="right"> Subject Code </td>
                            <td> ${book.subject.subjectCode} </td>
                          </tr>
                          <tr>
                            <td class="right"> Semester </td>
                            <td> SEM ${book.subject.semester} </td>
                          </tr>
                          <tr>
                            <td class="right"> Branch </td>
                            <td> ${book.subject.branch.branchName} </td>
                          </tr>
                          <tr>
                            <td class="right"> Author Name </td>
                            <td> ${book.authorName} </td>
                          </tr>
                          <tr>
                            <td class="right"> Publication </td>
                            <td> ${book.publication} </td>
                          </tr>
                          <tr>
                            <td class="right"> Edition </td>
                            <td> ${book.edition} </td>
                          </tr>
                          <tr>
                            <td class="right"> Book Condition </td>
                            <td> ${book.bookCondition} </td>
                          </tr>
                          <tr>
                            <td class="right"> Total Page </td>
                            <td> ${book.totalPage} </td>
                          </tr>
                        </tbody>
                        </table>
                    </table>
                </div>
            </div>
    
            <div class="row justify-content-center wow zoomIn" style="text-align: center; margin-top: 15px; margin-left: -400px; margin-bottom: 40px;">
                <div class="col-md-10">
                    <h4> College : L.D College of Engineering </h4>
                    <h4> Seller : ${book.user.userName} </h4>
                </div>
              </div>
        </div>
	</div>
	
	<div class="modal fade" id="buyNow">
	    <div class="modal-dialog" style="width: 420px;">
	      <div class="modal-content">
	      
	        <div class="modal-header justify-content-center">
			  <h4 class="modal-title text-primary">Buy Now</h4>
	        </div>
	        
	        <div class="modal-body justify-content-center">
				Are You Sure..! &nbsp; You Want To Buy This Book ??
	        </div>
	        
	        <div class="modal-footer justify-content-center">
				<button type="button" class="col-4 btn btn-outline-danger" data-dismiss="modal"> Cancel </button>
			    <button type="button" class="col-4 btn btn-outline-primary" onclick="order()"> Confirm </button>
	        </div>
	        
	      </div>
	    </div>
	</div>
	
	<div class="modal fade" id="order">
	    <div class="modal-dialog" style="width: 450px;">
	      <div class="modal-content">
	      
	        <div class="modal-header justify-content-center">
			  <h4 class="modal-title text-primary">Order Confirmed</h4>
	        </div>
	        
	        <div class="modal-body justify-content-center">
				Please Confirm Your Deal By Communicating With The Seller. <br>
				<b style="color: #fc5705"> Seller Mobile No : ${book.user.mobileNo} </b>
	        </div>
	        
	        <div class="modal-footer justify-content-center">
			    <button type="button" class="col-4 btn btn-outline-primary" onclick="orderConfirmed(${book.bookId})"> Okay </button>
	        </div>
	        
	      </div>
	    </div>
	</div>
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
</body>
</html>