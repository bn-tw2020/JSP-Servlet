<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="ch7.PersonBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//PersonBean pb = new PersonBean();
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="pb" class="ch7.PersonBean"/>
<jsp:setProperty name="pb" property="*"/>

이름 : <jsp:getProperty name="pb" property="name"/>
이메일 : <jsp:getProperty name="pb" property="email"/>
주소 : <%=pb.getAddr() %>
생일 : <%=pb.getBirth() %>
나이 : <%=pb.getAge() %>
</body>
</html>