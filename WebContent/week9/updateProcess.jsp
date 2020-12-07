<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   String pass = request.getParameter("pass");
   String name = request.getParameter("name");
   int age = Integer.parseInt(request.getParameter("age"));
   String gender = request.getParameter("gender");
   String email = request.getParameter("email");
   Connection conn = null;
   PreparedStatement ps = null;
   ResultSet rs = null;
   
   try{
      Context cp = new InitialContext();
      DataSource ds = (DataSource)cp.lookup("java:comp/env/jdbc/nov");
      conn = ds.getConnection();
      String sql_select = "SELECT password FROM member WHERE id = ?";
      ps = conn.prepareStatement(sql_select);
      ps.setString(1, id);
      System.out.println("a");
      rs = ps.executeQuery();
      rs.next();
      System.out.println("c");
      if(rs.getString("password").equals(pass)){
    	  System.out.println("b");
         String sql = "UPDATE member SET name = ?, age = ?, gender = ?, email = ? WHERE id = ?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, name);
         ps.setInt(2, age);
         ps.setString(3, gender);
         ps.setString(4, email);
         ps.setString(5, id);
         int check = ps.executeUpdate();
         //response.sendRedirect("loginForm.jsp");
         if(check!=0){
            out.println("<script>");
            out.println("location.href='./template.jsp?page=mypage.jsp'");
            out.println("</script>");
         }
      }
      
      out.println("<script>");
      out.println("history.back()");
      out.println("</script>");
      
      
      
   }
   catch(Exception e){
      e.printStackTrace();
   }
   finally{
      if(rs!=null)
         rs.close();
      if(ps!=null)
         ps.close();
      if(conn!=null)
         conn.close();
   }
   
%>