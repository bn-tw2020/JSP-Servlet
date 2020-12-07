<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연동 테스트 예제</title>
<style>
	table{
		width:600px;
		border: 1px solid #222222;
	}
	tr, th, td{
		border: 1px solid #444444;
		text-align : center;
	}
	
	th {
		color: yellow;
		height: 40px;
	}
</style>
</head>
<body>
   <%
    	Connection conn=null; //
    	PreparedStatement pstmt = null; //SQL문 실행
    	ResultSet rs = null; //select한 결과를 답는
    	
    	String driver="com.mysql.jdbc.Driver";
    	String url="jdbc:mysql://localhost:3306/nov?serverTimezone=UTC";
    	try{
    		Class.forName(driver);
    		conn=DriverManager.getConnection(url,"root","80968096");
    		String sql = "select * from member";
    		pstmt = conn.prepareStatement(sql);
    		rs = pstmt.executeQuery(); // 테이블 변환가 안됨, select
    		//pstmt.executeUpdate(); // 테이블에 변화가 발생, update, delete, insert
    		%>
    		<table border="1px">
    		<tr>
    				<th>아이디</th><th>패스워드</th>
    				<th>이름</th>
    				<th>나이</th>
    				<th>성별</th>
    				<th>이메일</th><th>관리</th>
    			</tr>
    		<%while(rs.next()){%>
    			<tr>
    				<td><%=rs.getString("id")%></td><td><%=rs.getString("password")%></td>
    				<td><%=rs.getString("name")%></td><td><%=rs.getInt("age")%></td>
    				<td><%=rs.getString("gender")%></td><td><%=rs.getString("email")%></td>
    				<td><a href="deletemember.jsp?id=<%=rs.getString("id")%>">삭제</a></td>
    			</tr>
    		<%	} %>
    	</table>
<%}
    	catch(Exception e){
	    	e.printStackTrace();
    	}
    	finally{
    		if(rs!=null) rs.close();
    		if(pstmt!=null) pstmt.close();
    		if(conn!=null) conn.close();
    	}
%>


</body>
</html>