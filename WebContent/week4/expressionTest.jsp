<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public int sum(){
	int total=0;
	for(int i=0; i<=100; i++){
		total+=i;
	}
	return total;
}
%>
<%
String str = "1부터 100까지의 합";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=str %>은<%=sum() %>입니다.</h2>
<h2><%=str %>에 3을 곱하면<%=sum()*3 %>입니다.</h2>
<h2><%=str %>에 1000으로 나누면<%=sum()/1000 %>입니다.</h2>
</body>
</html>