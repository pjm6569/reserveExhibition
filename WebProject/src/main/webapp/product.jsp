<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>상세 정보</title>
    <link rel = "stylesheet"
href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css")>
</head>
<body>
    <jsp:include page="menu.jsp" />
    <%@ include file="dbconn.jsp"%>
    <%
        String sql = "select * from exhibition WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        String productId = request.getParameter("id");
        //String productId = "3";
        pstmt.setString(1, productId);
        //pstmt.setString(1, "3");
        rs = pstmt.executeQuery();
        while (rs.next()) {
    %>
    <script type="text/javascript">
        function addToCart() {
            var id = '<%=productId%>';
            if (confirm("상품을 정말로 예약하시겠습니까?")) {
                window.location.href = "./reservefunc.jsp?id=" + id;

            } else {
                document.addForm.reset();
            }
        }
        function deleteConfirm(id){
            if(confirm("해당 전시회를 삭제합니다!") == true)
                location.href= "./delete.jsp?id=" + id;
            else
                return;
        }
    </script>
    <br>
    <br>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("photo")%>" style="width: 100%">
            </div>
            <div class="col-md-6">
                <h3><%=rs.getString("name")%></h3>
                <p> <b>장소 : </b><span class="badge badge-danger"><%=rs.getString("place")%></span> </p>
                <p><b>전시 기간</b> : <%=rs.getString("startDate")%> ~ <%=rs.getString("endDate")%></p>
                <p><b>관람 시간</b> : <%=rs.getString("time")%>분</p>
                <p><b>가격</b> : <%=rs.getString("price")%>원</p>
                <p><%=rs.getString("info")%></p>
                
                
                	<%
		Object sessionID = session.getAttribute("id");
		if(sessionID != null && sessionID.toString().equals("admin")){
			%>
                <form a href="#" action="./reservelist.jsp" onclick="addToCart()" class="btn btn-primary">예약하기</form>
                <form a href = "#" onclick="deleteConfirm('<%=rs.getString("id")%>')" class = "btn btn-danger" role = "button" >삭제 &raquo;></form>
<%} %>
            </div>
            <%
                }
            %>
            <%
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if(conn != null)
                    conn.close();
            %>
        </div>
    </div>

</body>
</html>
