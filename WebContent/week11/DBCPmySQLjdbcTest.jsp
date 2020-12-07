<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td{border: 1px solid black;}

</style>
<meta charset="UTF-8">
<title>디비연동</title>
</head>
<body>

<%
    	Connection conn=null;
    	PreparedStatement ps = null; // SQL 문 실행
    	ResultSet rs = null; // select 한 결과를 담은 객체    	
    	try{
    		Context init = new InitialContext();
    		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/nov");
    		conn = ds.getConnection();
    		
    		String sql = "SELECT * FROM member";
 			ps = conn.prepareStatement(sql);
 			rs = ps.executeQuery(); // 테이블 변화 없음.. select
 			// ps.executeUpdate() 테이블 변화 있음.. insert, update, delete
 			%>
 			<table>
 			<thead>
 			<tr><th>아이디</th> <th>패쓰워드</th><th> 이름</th><th> 나이</th> <th>성별</th> <th>이메일</th><tr></thead> <br>
<%
	while(rs.next()){ %>
	<tr>
		<td><%= rs.getString("id") %></td>
		<td><%= rs.getString("password") %></td>
		<td><%= rs.getInt("age") %></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("gender") %></td>
		<td><%= rs.getString("email") %></td>
		<td>
		<a href="DBCPdeletemember.jsp?id=<%=rs.getString("id")%>">삭제</a></td>	
	</tr>	
		
		<%
	}
%>
</table>

 			<% 
    	}
    	catch(Exception e){
	    	e.printStackTrace();
    	}
   		finally{
   			if(rs != null) rs.close();
   			if(ps != null) ps.close();
   			if(conn != null) conn.close();
   		}
    %>
</body>
</html>