<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resource/css/bootstrap.min.css"">
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Login</h3>
			<%
				String error = request.getParameter("error");
			if(error != null) {
				out.println("<div class= 'alert alert-danger'>");
				out.println("없는 아이디 입니다.");
				out.println("</div>");
			}
			%>
			<form class="form-signin" action = "login_process.jsp" method="post">
				<div class="form group">
					<label for="inputUserName" class="sr-only">아이디</label>
					<input type="text" class="form-control" placeholder="ID" name ='id' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label>
					<input type="password" class="form-control" placeholder="Password" name ='password' required>
				</div>
				<button class="btn btn-block text-white" style ="background-color: black" type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>