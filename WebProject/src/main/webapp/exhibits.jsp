<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<script>
    window.onload = function() {
        // 페이지가 로드될 때 쿼리 매개변수를 제거하여 isWhereAdded를 초기화합니다. (새로고침 시 검색 초기화)
        history.replaceState({}, document.title, location.pathname);
    };
    
</script>

<head>
<link rel = "stylesheet"
href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css")>
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">전시회 목록</h1>
		</div>
	</div>
<%-- 검색 폼 --%>
<%@ include file = "search.jsp" %> 
	<%
		Object sessionID = session.getAttribute("id");
		if(sessionID != null && sessionID.toString().equals("admin")){
			%>
			<div class="row">
				<table width="1320px">
					<tr>
						<td align="left"></td>
						<td align="right"><a href="add.jsp" class="btn btn-success">등록하기</a></td>
					</tr>
				</table>
			</div>
		<% 	
		}
	%>
	<div class="container">		
		<div class="row" align="center">		
		<%@ include file="dbconn.jsp"%>
			<%
            String sql = "SELECT * FROM exhibition WHERE 1=1"; // Initial SQL
            
            // 검색 조건이 전달되었을 경우 WHERE 절 추가
            String categoryParam = request.getParameter("category");
            String nameParam = request.getParameter("name");
            String startDateParam = request.getParameter("startDate");
            String endDateParam = request.getParameter("endDate");
            
            //검색 기능(sql문에 조건을 덧붙인다)
            if (categoryParam != null && !categoryParam.isEmpty()) {
                sql += " AND category = '" + categoryParam + "'";
            }
            
            if (nameParam != null && !nameParam.isEmpty()) {
                sql += " AND name LIKE '%" + nameParam + "%'";
            }
            
            if (startDateParam != null && !startDateParam.isEmpty()) {
                sql += " AND startDate >= DATE('" + startDateParam + "')";
            }
            
            if (endDateParam != null && !endDateParam.isEmpty()) {
                sql += " AND endDate <= DATE('" + endDateParam + "')";
            }
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
			%>
			<div class="col-md-3" align="left">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("photo")%>" style="width: 240px; height: 320px;">
				<h4><%=rs.getString("name")%></h3>
				<p>기간: <%=rs.getString("startDate")%> ~ <%=rs.getString("endDate")%>
				<p>가격: <%=rs.getString("price")%>원 
				<p> <a href="./product.jsp?id=<%=rs.getString("id")%>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
			<%
				}
				
			if (rs != null)
				rs.close();
 			if (pstmt != null)
 				pstmt.close();
 			if (conn != null)
				conn.close();
			%>
		</div>
		<hr>
	</div>
</body>
</html>