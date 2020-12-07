<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pass");
	
	Connection conn=null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;
	try{
		Context cp = new InitialContext();
		DataSource ds = (DataSource) cp.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
		sql = "select password from member where id = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		rs = ps.executeQuery();
		rs.next();
		
		
		if(pw.equals(rs.getString("password"))){
			sql = "delete from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,id);
			int a = ps.executeUpdate();
			if(a!=0){
				session.invalidate();
				out.println("<script>");
				out.println("alert('탈퇴었습니다!')");
				out.println("location.href='template.jsp'");
				out.println("</script>");
			}
		}
		else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸거나 탈퇴에 문제가 발생')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!= null) conn.close();
	}
%>