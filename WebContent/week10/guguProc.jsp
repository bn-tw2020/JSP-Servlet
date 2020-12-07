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
	response.setContentType("text/html;charset=utf-8");
	request.setCharacterEncoding("utf-8");
	int first = Integer.parseInt(request.getParameter("first"));
	int second = Integer.parseInt(request.getParameter("second"));
	for(int i=1; i<10; i++) {
		for(int j=first; j<=second; j++){
				out.println(j); out.println("*"); out.println(i); out.println("="); out.println(j*i); out.println("\t\t");
			}out.println("<br>");
		}
%>
</body>
</html>