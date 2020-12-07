<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>구구단을 외자!!</h1>
<hr>
<form action="guguProc.jsp" method="post">

<input type="text" name="first"/>단 부터 <input type="text" name="second"/>단까지 출력하기
<br><br>
<input type="submit" value="출력"/>
<input type="reset" value="재입력"/>
</form>
</body>
</html>