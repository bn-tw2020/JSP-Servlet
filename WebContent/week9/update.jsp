<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
   table{
      margin : auto;
      width : 400px;
      border : 1px solid gray;
      text-align: center;
   }
   .td_title{
      font-weight: bold;
      font-size: x-large;
   }
</style>
</head>
<body>
<%
   String id = request.getParameter("id");
   Connection conn = null;
   PreparedStatement ps = null;
   ResultSet rs = null;
   
   try{
      Context cp = new InitialContext();
      DataSource ds = (DataSource)cp.lookup("java:comp/env/jdbc/nov");
      conn = ds.getConnection();
      String sql = "SELECT * FROM member WHERE id = ?";
      ps = conn.prepareStatement(sql);
      ps.setString(1,id);
      rs = ps.executeQuery();
      
      if(rs.next()){%>
         
         <form name="updateform" action="updateProcess.jsp" method="post">
         <table border=1>
            <tr>
               <td colspan="2" class = "td_title">
                  회원정보 수정 페이지
               </td>
            </tr>
            <tr>
               <td><label for = "id">아이디 : </label></td>
               <td><input type="text" name="id" value='<%=rs.getString("id") %>' id = "id" readonly/></td>
            </tr>
            <tr>
               <td><label for = "pass">비밀번호 : </label></td>
               <td><input type="password" name="pass"  id = "pass"/></td>
            </tr>
            <tr>
               <td><label for = "name">이름 : </label></td>
               <td><input type="text" name="name" id = "name" value='<%=rs.getString("name") %>'/></td>
            </tr>
            <tr>
               <td><label for = "age">나이 : </label></td>
               <td><input type="text" name="age" id = "age" value='<%=rs.getString("age") %>'/>
               </td>
            </tr>
            <tr>
               <td><label for = "gender1"></label>성별 : </td>
               <td>
                  <%if(rs.getString("gender").equals("남자")){
                  %>
                  <input type="radio" name="gender" value="남자" checked id = "gender1"/>남자
                  <input type="radio" name="gender" value="여자" id = "gender2"/>여자
                  <%}else{%>
                  <input type="radio" name="gender" value="남자"  id = "gender1"/>남자
                  <input type="radio" name="gender" value="여자" checked id = "gender2"/>여자
                  <% }
                  %>
               </td>
            </tr>
            <tr>
               <td><label for = "email">이메일 주소 : </label></td>
               <td><input type="text" name="email" id = "email" value='<%=rs.getString("email") %>'/></td>
            </tr>
            <tr>
               <td colspan="2">
                  <a href="javascript:updateform.submit()">회원정보수정</a>&nbsp;&nbsp;
                  <a href="delete.jsp?id=<%=rs.getString("id")%>">회원탈퇴</a>
               </td>
            </tr>
         </table>
         </form>
         
      <%}
   }
   catch(Exception e){
      
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
</body>
</html>