<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Bookstore - Add Book</title>
	<jsp:include page="head.jsp"></jsp:include>
	<script src="js/addBook.js"></script>
	<style>
        body {
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>

<div class="container">
	<jsp:include page="menu.jsp"></jsp:include>
</div>

<div class="container">
        
        <!-- ***** Two Image ***** -->
        <div class="row" style="margin-top: 15px;">
            <div class="col-md-2"></div>
            <div class="col-md-3 wow fadeInLeft" style="border: 1px solid cornflowerblue;">
                <img id="f" src="img/front.jpg" style="height: 300px; width: 100%;">
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-3 wow fadeInRight" style="border: 1px solid cornflowerblue;">
                <img id="b" src="img/back.jpg" style="height: 300px; width: 100%;">
            </div>
            <div class="col-md-2"></div>
        </div>
		
		<form:form action="/addBookk" method="post" modelAttribute="book" enctype="multipart/form-data">
		
			<!-- ***** Browse ***** -->
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-2"></div>
                <div class="col-md-3 wow fadeInLeft">
                    <div class="custom-file">
                        <input type="file" name="front" class="custom-file-input" id="front" onchange="showFrontImage()">
                        <label class="custom-file-label" for="front">Choose file</label>
                    </div>     
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-3 wow fadeInRight">
                    <div class="custom-file">
                        <input type="file" name="back" class="custom-file-input" id="back" onchange="showBackImage()">
                        <label class="custom-file-label" for="back">Choose file</label>
                    </div>                       
                </div>
                <div class="col-md-2"></div>
            </div>
			
			<!-- ***** Book & Auth ***** -->
            <div class="row wow fadeInUp" style="margin-top: 20px;">
                <div class="col">
                    <div class="form-group">
                        <label for="bookName">Book Name :</label>
                        <form:input path="bookName" class="form-control" id="bookName"/>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="authorName">Author Name :</label>
                        <form:input path="authorName" class="form-control" id="authorName"/>
                    </div>
                </div>
            </div>
			
			<!-- ***** Semester Row ***** -->
            <div class="row wow fadeInUp">
                <div class="col">
                    <div class="form-group">
                        <label for="branchName">Branch Name :</label>
                        <select class="form-control" id="branchName" onchange="getSubject()">
                            <option value=" "> -- Select -- </option>
                            <option value="1"> Computer </option>
                            <option value="2"> Electrical </option>
                            <option value="3"> Mechanical </option>
                            <option value="4"> Civil </option>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="semester">Semester :</label>
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
				<div class="col">
                    <div class="form-group">
                        <label for="subject">Subject Name :</label>
                        <select class="form-control" id="subject" onchange="setSubject()">
                            <option value=" "> -- Select -- </option>
                        </select>
                    </div>
                </div>
				<div class="col">
                    <div class="form-group">
                        <label for="subjectCode">Subject Code :</label>
                        <input type="text" class="form-control" id="subjectCode">
                    </div>
                </div>
            </div>
			
			<!-- ***** Edition Row ***** -->
            <div class="row wow fadeInUp">
                <div class="col">
                    <div class="form-group">
                        <label for="publication">Publication :</label>
                        <form:input path="publication" class="form-control" id="publication"/>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="edition">Edition :</label>
                        <form:input path="edition" class="form-control" id="edition"/>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="publishedYear">Published Year :</label>
                        <form:input path="publishedYear" class="form-control" id="publishedYear"/>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="totalPage">Total Page :</label>
                        <form:input path="totalPage" class="form-control" id="totalPage"/>
                    </div>
                </div>
            </div>
			
			<!-- ***** Price Row ***** -->
            <div class="row wow fadeInUp">
                <div class="col">
                    <div class="form-group">
                        <label for="bookCondition">Book Condition :</label>
                        <form:select path="bookCondition" class="form-control" id="bookCondition">
                            <option value=" "> -- Select -- </option>
                            <option value="best"> Best </option>
                            <option value="good"> Good </option>
                            <option value="medium"> Medium </option>
                            <option value="poor"> Poor </option>
                        </form:select>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="originalPrice">Original Price :</label>
                        <form:input path="originalPrice" class="form-control" id="originalPrice"/>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="sellingPrice">Selling Price :</label>
                        <form:input path="sellingPrice" class="form-control" id="sellingPrice"/>
                    </div>
                </div>
            </div>
            
			<form:input path="user.userId" type="hidden" value="${sessionScope.user}"/>
			<form:input path="subject.subjectId" type="hidden" id="subjectId"/>
			<br>
			<!-- ***** Reset & Submit ***** -->
			<div class="row wow fadeInUp" style="height: 70px; font-size: 30px;">
                <div class="col-md-4"></div>
                <div class="col-md-2">
                    <input type="reset" type="button" class="btn btn-outline-danger btn-lg">
                </div>
                <div class="col-md-2">
                    <input type="submit" type="button" class="btn btn-outline-success btn-lg">
                </div>
                <div class="col-md-4"></div>
            </div>
		</form:form>
</div>	
</body>
	<script>
        // Add the following code if you want the name of the file appear on select
        $(".custom-file-input").on("change", function() {
          var fileName = $(this).val().split("\\").pop();
          $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>

</html>