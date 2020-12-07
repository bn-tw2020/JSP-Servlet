<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = null;
id=(String) session.getAttribute("id");
if(id!=null){ //로그인 된 경우
	%>
<h3><a href="./template.jsp?page=update.jsp?id=<%=id%>"><%=id %></a>님이 로그인되었습니다.
	<a href="logout.jsp">로그아웃</a>
	</h3><%
}
%><% 
else{%>
<a href="./template.jsp?page=loginForm.jsp">Login</a>
<a href="./template.jsp?page=joinForm.jsp">Join</a>
<% }%>    
    