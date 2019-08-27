<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.bean.MemberDTO" %>
<%@ page import="member.dao.MemberDAO" %>
<%
//데이터
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
MemberDTO memberDTO = new MemberDTO();
memberDTO.setId(id);
memberDTO.setPwd(pwd);

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
String name = memberDAO.login(id,pwd);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%if(name==null){ %>
	아이디 또는 비밀번호가 맞지 않습니다.
<%}else{ %>
<form name="login" method="post" action="./modifyForm.jsp">
	<%=name %>님이 로그인하였습니다.
	<br><br>
	<input type="button" name="id" value="로그아웃">
	<input type="submit" value="회원정보수정">
</form>
<%} %>

</body>
</html>