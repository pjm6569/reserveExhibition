<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel = "stylesheet"
href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css")>

<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>전시 등록</title>
</head>


<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
 	<jsp:include page="menu.jsp" />
 	<div class = "jumbotron">
 		<div class="container">
 			<h1 class = "display-3"><fmt:message key = "title" /></h1>
 		</div>
 	</div>
 	<div class = "container">
 		<div class ="text-right">
 			<a href="?language=ko" >Korean</a>|<a href = "?language=en" >English</a>
 		</div>
 		<form name="newExhibition" action = "./addProcess.jsp" class = "form-horizontal"
 		method = "post" enctype = "multipart/form-data">
 			
 			<div class = "form-group row">
 				<label class="col-sm-2"><fmt:message key = "id" /></label>
 				<div class = "col-sm-3">
 					<input type="text" id = "Id" name = "Id" class = "form-control" >
 				</div>
 			</div>
 			
 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "name" /></label>
 				<div class = "col-sm-3">
 					<input type="text" id = "name" name = "name" class = "form-control" >
 				</div>
 			</div>
 			
 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "ticketPrice" /></label>
 				<div class = "col-sm-3">
 					<input type="text" id = "ticketPrice" name = "ticketPrice" class = "form-control" >
 				</div>
 			</div>
 			
 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "time" /></label>
 				<div class = "col-sm-3">
 					<input type="text" id = "time" name = "time" class = "form-control" >
 				</div>
 			</div>
 			
 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "place" /></label>
 				<div class = "col-sm-3">
 					<input type="text" name = "place" class = "form-control" >
 				</div>
 			</div>

 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "startDate" /></label>
 				<div class = "col-sm-3">
 					<input type="date" name = "startDate" class = "form-control" >
 				</div>
 			</div>
 			
			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "endDate" /></label>
 				<div class = "col-sm-3">
 					<input type="date" name = "endDate" class = "form-control" >
 				</div>
 			</div>
			
 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "info" /></label>
 				<div class = "col-sm-5">
 					<textarea name = "info" cols="50" rows = "4" class = "form-control"></textarea>
 				</div>
 			</div>
 			
 			<div class="form-group row">
 				<label class="col-sm-2"><fmt:message key = "category" /></label>
 				<div class = "col-sm-5">
 					<input type="radio" name = "category" value = "photo">
 					<fmt:message key = "category_one" />
 					<input type = "radio" name = "category" value = "relic">
 					<fmt:message key = "category_two" />
 					<input type = "radio" name = "category" value="painting"> <fmt:message key = "category_three" />
 				</div>
 			</div>
 			<div class = "form-group row">
 				<label class = "col-sm-2"><fmt:message key = "photo" /></label>
 				<div class = "col-sm-5">
 					<input type = "file" name = "photo" class = "form-control">
 				</div>
 			</div>
 			
 			<div class="form-group row">
 				<div class = "col-sm-offset-2 col-sm-10 ">
 					<input type="button" class = "btn btn-primary" value = "<fmt:message key = "button" />"  onclick="CheckAddProduct()">
 					<input type="reset" class = "btn btn-danger" value = "<fmt:message key = "reset" />">
 				</div>
 			</div>
 		</form>
 	</div>
</fmt:bundle>
</body>
</html>