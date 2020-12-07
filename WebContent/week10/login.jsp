<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/MaySak/sessionLogin" method="post">
	<table>
		<tr>
			<td><label for = "id">아이디 : </label></td>
			<td><input type="text" name = "id" id= " id"></td>
		</tr>
		
		<tr>
			<td><label for = "pass">비밀번호 : </label></td>
			<td><input type="password" name = "pass" id= " pass"></td>
		</tr>
		
		<tr>
			<td><label for = "name">이름 : </label></td>
			<td><input type= "text" name = "name" id= "name"></td>
		</tr>

		<tr>
			<td colspan="2">
				<input type= "submit" value="가입">
				<input type= "reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body>
</html>