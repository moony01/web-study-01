<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" dataSource="jdbc/oracle">
	select * from usertable
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<!-- 필드명 -->
	<c:forEach var="colName" items="${rs.columnNames }">
		<th>${colName }</th>
	</c:forEach>
		<th>비고</th>

	<c:forEach var="row" items="${rs.rowsByIndex }"><!-- 행 -->
		<tr>
		<c:forEach var="col" items="${row }"><!-- 열 -->
			<td align="center" width="100">${col }</td>
		</c:forEach>
		<td align="center" width="100">
			<input type="button" value="수정">
			<input type="button" value="삭제">
		</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>















