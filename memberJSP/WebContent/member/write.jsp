<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>

<jsp:useBean id="memberDTO" class="member.bean.MemberDTO" scope="session"/>
<jsp:setProperty property="*" name="memberDTO"/>


<%
//DB
MemberDAO memberDAO = MemberDAO.getInstance();
int su = memberDAO.write(memberDTO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su==1){ %>
	회원가입을 축하합니다
	<br><br>
	<input type='button' value='로그인' onclick=location.href='loginForm.jsp'>
	
<%}else{ %>
	다시 작성해주세요
<%} %>
</body>
</html>











