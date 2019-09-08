<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" dataSource="jdbc/oracle">
	select * from usertable where id='${param.id }'
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" action="jstlModify.jsp">

<%-- <c:forEach var="row" items="${rs.rowsByIndex }"> --%>
<c:forEach var="row" items="${rs.rows }">

	<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th width="80">이름</th>
		<td><input type="text" name="name" id="name" value="${row.name }" placeholder="이름 입력"></td>
	</tr>
	<tr>
		<th width="80">아이디</th>
		<td><input type="text" name="id" value="${row.id }" placeholder="아이디 입력" style="width: 200px;"></td>
	</tr>
	<tr>
		<th width="80">비밀번호</th>
		<td><input type="password" name="pwd" value="${row.pwd }" style="width: 230px;"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
			<input type="button" value="목록" onclick="location.href='jstlList.jsp'">
		</td>
	</tr>
	</table>
</c:forEach>
</form>
</body>
</html>



