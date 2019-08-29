<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="java.net.URLEncoder" %>
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

<img src="../image/dog.png" width="50" height="50" 
onclick="location.href='../main/index.jsp'" style="cursor: pointer;">

<%if(name==null){
	response.sendRedirect("loginFail.jsp");	
	
}else{
	response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name,"UTF-8"));
	
	//쿠키
	
	//세션
	
}%>
</form>
</body>
</html>














