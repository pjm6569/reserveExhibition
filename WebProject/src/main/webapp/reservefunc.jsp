<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.ReserveRepository"%>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<% 
		String id = request.getParameter("id");
		ReserveRepository reserveDao = new ReserveRepository();
		reserveDao.insertReserve(id);
		response.sendRedirect("exhibits.jsp");
	%>
</body>
</html>