<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fmt:requestEncoding value="UTF-8"/>

<ul>
<li>이름 : ${param.name }<br><br>

<li>나이 : ${param.age }살

<c:if test="${param.age>=20 }">
	성인
</c:if>
<c:if test="${param.age<20 }">
	청소년
</c:if>
<br><br>

<li>색깔 :
<c:choose>
	<c:when test="${param.color == 'red' }">빨강</c:when>
	<c:when test="${param.color == 'green' }">초록</c:when>
	<c:when test="${param.color == 'blue' }">파랑</c:when>
	<c:when test="${param.color == 'magenta' }">보라</c:when>
	<c:otherwise>하늘</c:otherwise>
</c:choose>
<br><br>

<li>취미 : 
<c:forEach var="i" begin="0" end="4" step="1">
	${paramValues['hobby'][i] }
</c:forEach>
<br>
<li>취미 : 
<c:forEach var="data" items="${paramValues.hobby }">
	${data }
</c:forEach>
</ul>
</body>
</html>

























