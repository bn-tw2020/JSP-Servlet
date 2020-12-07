<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

    	Connection conn=null;
    	PreparedStatement ps = null; // SQL 문 실행
    	
    	String idd = request.getParameter("id");
    	
    	Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
    	try{
    		String sql = "DELETE FROM member WHERE id=?";
 			ps = conn.prepareStatement(sql);
 			ps.setString(1, idd); //첫번째 물음표에 add 값을 대입.
 			int a = ps.executeUpdate(); // 테이블 변화 없음.. select
 			
 			// ps.executeUpdate() 테이블 변화 있음.. insert, update, delete
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	finally{
    		ps.close();
    		conn.close();
    		response.sendRedirect("DBCPmySQLjdbcTest.jsp");
    	}
 %>
</body>
</html>