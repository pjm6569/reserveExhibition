<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %> 
<%@ page import = "java.sql.*" %> 
<%@ include file = "dbconn.jsp" %>
<%@ page import = "java.sql.Date"%>
<%@ page import = "java.text.ParseException" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = "./resources/images";
	realFolder = request.getSession().getServletContext().getRealPath(realFolder);
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String Id = multi.getParameter("Id");
	String name = multi.getParameter("name");
	String place = multi.getParameter("place");
	String startDate = multi.getParameter("startDate");
	String endDate = multi.getParameter("endDate");
	String ticketPrice = multi.getParameter("ticketPrice");
	String time = multi.getParameter("time");
	String info = multi.getParameter("info");
	String category = multi.getParameter("category");
	String condition = multi.getParameter("condition");
	
	Integer price;	
	if(ticketPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(ticketPrice);
	
	Integer Time;
	
	if(time.isEmpty())
		Time = 0;
	else
		Time = Integer.valueOf(time);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String photo = multi.getFilesystemName(fname);
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	java.util.Date parsedDate = format.parse(startDate);
	java.sql.Date sqlStartDate = new java.sql.Date(parsedDate.getTime());
	
	parsedDate = format.parse(endDate);
	java.sql.Date sqlEndDate = new java.sql.Date(parsedDate.getTime());
	
	
	String sql = "insert into Exhibition values(?,?,?,?,?,?,?,?,?,?)";
	out.println(endDate);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, Id);
	pstmt.setString(2, name);
	pstmt.setString(3, photo);
	pstmt.setString(4, place);
	pstmt.setDate(5, sqlStartDate);
	pstmt.setDate(6, sqlEndDate);
	pstmt.setInt(7, Time);
	pstmt.setInt(8, price);
	pstmt.setString(9, info);
	pstmt.setString(10, category);
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	response.sendRedirect("exhibits.jsp");
	
%>
