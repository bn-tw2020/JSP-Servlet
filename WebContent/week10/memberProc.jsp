<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="BeanTest" class="mid.MemberBean"/>
<jsp:setProperty name="BeanTest" property="*"/>
<body bgcolor="#996600">
<table width="650" align="center" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table  border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="member.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b><jsp:getProperty name="BeanTest" property="name"/> 회원님이 작성하신 내용입니다. 확인해 주세요</b></font></td>
          </tr>
          <tr> 
            <td width="150">아이디</td>
            <td colspan="2" width="250"><jsp:getProperty name="BeanTest" property="id"/></td>
          </tr>
          <tr> 
            <td>패스워드</td> 
            <td colspan="2" width="250"><jsp:getProperty name="BeanTest" property="pwd"/></td>
          </tr>
          
          <tr>  
            <td>이름</td>
            <td colspan="2" width="250"><jsp:getProperty name="BeanTest" property="name"/></td>
          </tr>
          
          <tr> 
            <td>생년월일</td>
            <td colspan="2" width="250"><jsp:getProperty name="BeanTest" property="birthday"/></td>
          </tr>
          <tr>  
            <td>이메일</td>
            <td colspan="2" width="250"><jsp:getProperty name="BeanTest" property="email"/></td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> 
             <input type="submit" value="확인완료"> &nbsp; 
             <input type="submit" value="다시쓰기"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>