<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=name %>님 로그인
<br><br>
<input type="button" value="로그아웃" onclick="">
<input type="submit" value="회원정보수정">
</body>
</html>