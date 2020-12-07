<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Connection conn=null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try{
		Context cp = new InitialContext();
		DataSource ds = (DataSource) cp.lookup("java:comp/env/jdbc/nov");
		conn = ds.getConnection();
		String sql = "select * from member where id = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		rs = ps.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){
				session.setAttribute("id", id);
				out.println("<script>");
				out.println("location.href='template.jsp'");
				out.println("</script>");
			}	
		}
		// 아이디나 패스워드가 틀린 경우
		out.println("<script>");
		out.println("location.href='loginForm.jsp'"); // history.back();, history.go(-1)
		out.println("</script>");	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!= null) conn.close();
	}
%>