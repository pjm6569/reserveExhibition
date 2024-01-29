<%@ page contentType="text/html; charset=utf-8"%>

<nav class = "navbar navbar-expand navbar-dark bg-dark">
		<div class ="container">
			<div class ="navbar-header">
				<a class ="navbar-brand" href="./exhibits.jsp">Home</a>
				
	<%
		Object sessionID = session.getAttribute("id");
		if(sessionID != null && sessionID.toString().equals("admin")){
			%>
 			<a href = "logout.jsp" class = "btn btn-sm btn-warning pull-right">logout</a>
 				<table width="1250px">
					<tr>
						<td align= "left"></td>
						<td align= "right"><a  class="btn btn-sm btn-primary pull-right" href="./reservelist.jsp">예매 내역</a></td>
					</tr>
				</table>
 			
			
		<% 	
		} else {
			%>
 			<a href = "Login.jsp" class = "btn btn-sm btn-success pull-right">Login</a>
			<%
		}
	%>
			
			
			
				
			</div>
		</div>
	</nav>