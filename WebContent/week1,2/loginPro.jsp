<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
	%>
	
	내 이름은 <%=name %>이고, 내가 사용하는 아이디는 <%=id %>입니다.<br>
	내 비밀번호는 <%=pwd %>이입니다.
</body>
</html>