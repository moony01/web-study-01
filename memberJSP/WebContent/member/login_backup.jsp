<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%
//데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
String name = memberDAO.login(id,pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" action="modifyForm.jsp">
<input type="hidden" name="id" value="<%=id %>">
<img src="../image/lionpng.png" width="50" onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
<%if(name==null){ %>
	아이디 또는 비밀번호가 틀립니다
<%}else{ %>
	<%=name %>님 로그인
	<br><br>
	<input type="button" value="로그아웃" onclick="">
	<input type="submit" value="회원정보수정">
<%} %>
</form>

</body>
</html>














