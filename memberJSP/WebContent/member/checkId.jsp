<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO" %>
<%
String id = request.getParameter("id");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
boolean exist = memberDAO.isExistId(id);
%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/member.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(exist){ %>
<form name="" method="" action="">
	<%=id %>는 사용 불가능
	<br><br>
	아이디 <input type="text" name="id">
	<input type="submit" value="중복체크">
</form>
<%}else{ %>
	<%=id %>는 사용 가능
	<br><br>
	<input type="button" value="사용하기" onclick="checkIdClose('<%=id %>')">
<%} %>
</body>


</html>

