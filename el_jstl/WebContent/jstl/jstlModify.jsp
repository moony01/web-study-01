<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:requestEncoding value="utf-8"/>
<sql:update dataSource="jdbc/oracle">
	<%-- update usertable set name='${param.name }', pwd='${param.pwd }' where id='${param.id }' --%>
	
	update usertable set name=?, pwd=? where id=?
	<sql:param value="${param.name }"/>
	<sql:param value="${param.pwd }"/>
	<sql:param value="${param.id }"/>
</sql:update>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">
window.onload=function(){
	alert("수정 완료");
	location.href="jstlList.jsp";
}
</script>
</html>









