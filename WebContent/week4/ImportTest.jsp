<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>현재 시간은 <%=new Date() %>입니다.</h1>
<h1>현재 시간은 <%=new SimpleDateFormat().format(new Date()) %>입니다.</h1>
</body>
</html>