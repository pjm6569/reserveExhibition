<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>예매 내역</title>
</head>
<body>
	<%
		class reserve{
			String productId; //전시회코드
			String productName; //전시회이름
			String photo; //파일이름
			String place; //장소
			String startDate; //시작날짜
			String endDate; //끝나는날짜
			int time; //상영시간
			int price; //전시회가격
			String info; //설명
			String category; //분류
			int quantity; //수량
			
		    public reserve(String productId, String productName, String photo, String place, String startDate, String endDate, int time, int price, String info, String category, int quantity){
	        this.productId = productId;
	        this.productName = productName;
	        this.photo = photo;
	        this.place = place;
	        this.startDate = startDate;
	        this.endDate = endDate;
	        this.time = time;
	        this.price = price;
	        this.info = info;
	        this.category = category;
	        this.quantity = quantity;
			}
		}
		
		ArrayList<reserve> reservelist = new ArrayList<>();
	
	 	String url = "jdbc:mysql://localhost:3306/webp";
        String username = "root";
        String password = "12341234";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            
            String sql = "SELECT exhibition.id as id, name, photo, place, startDate, endDate, time, price, info, category, quantity FROM exhibition inner join reserve on exhibition.id = reserve.id";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String productId = rs.getString("id");
                String productName = rs.getString("name");
                String photo = rs.getString("photo");
                String place = rs.getString("place");
                String startDate = rs.getString("startDate");
                String endDate = rs.getString("endDate");
                int time = rs.getInt("time");
                int price = rs.getInt("price");
                String info = rs.getString("info");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                
                reservelist.add(new reserve(productId, productName, photo, place, startDate, endDate, time, price, info, category, quantity));            
            }

            // Close the resources
            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    %>
    <jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">예매 내역</h1>
		</div>
	</div>
	<div class="container">
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>전시회 이름</th>
					<th>관람 장소</th>
					<th>관람 기간</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
				</tr>
				<%
					int sum = 0;
					for (int i = 0; i < reservelist.size(); i++) { // 상품리스트 하나씩 출력하기
						reserve product = reservelist.get(i);
						int total = product.price * product.quantity;
						sum = sum + total;
				%>
				<tr>
					<td><%=product.productName%></td>
					<td><%=product.place%></td>
					<td><%=product.startDate%> ~ <%=product.endDate%></td>
					<td><%=product.price%></td>
					<td><%=product.quantity%></td>
					<td><%=total%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
				</tr>
			</table>
			<a href="./exhibits.jsp" class="btn btn-secondary"> &laquo; 전시회 더보기</a>
		</div>
		<hr>
	</div>
</body>
</html>