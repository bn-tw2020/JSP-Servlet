<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    	Connection conn=null; //
    	PreparedStatement pstmt = null; //SQL문 실행
    	String idd = request.getParameter("id");
    	String driver="com.mysql.jdbc.Driver";
    	String url="jdbc:mysql://localhost:3306/nov?serverTimezone=UTC";
    	try{
    		Class.forName(driver);
    		conn=DriverManager.getConnection(url,"root","80968096");
    		String sql = "delete from member where id = ?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, idd);
    		pstmt.executeUpdate(); // 성공하면 1, 실패하면 0 , 5개를 삭제하면 5를 반환합니다.
    		response.sendRedirect("mySQLjdbcTest.jsp");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	finally{
    		if(pstmt!=null) pstmt.close();
    		if(conn!=null) conn.close();
    	}
 %>
</body>
</html>