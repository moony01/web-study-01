<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form name="loginForm" method="post" action="login.jsp">
<table border="1" cellspacing="0" cellpadding="5">
<tr>
	<th width="80">아이디</th>
	<td><input type="text" name="id" placeholder="아이디 입력" style="width: 200px;"></td>
</tr>
<tr>
	<th width="80">비밀번호</th>
	<td><input type="password" name="pwd" style="width: 230px;"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value="로그인" onclick="checkLogin()">
		<input type="button" value="회원가입" onclick="location.href='writeForm.jsp'">
	</td>
</tr>
</table>
</form>
</body>
<script src="../js/member.js" type="text/javascript"></script>
</html>


















