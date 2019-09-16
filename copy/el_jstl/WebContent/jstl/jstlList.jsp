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
	
	<!-- 필드 -->
	<c:forEach var="row" items="${rs.rowsByIndex }"><!-- 행 -->
		<tr>
		<c:forEach var="col" items="${row }"><!-- 열 -->
			<td align="center" width="100">${col }</td>
		</c:forEach>
		<td align="center" width="150">
				<input type="button" value="수정" onclick="location.href='jstlModifyForm.jsp?id=${row[1]}'">          
				<input type="button" value="삭제" onclick="del('${row[1]}')">
		</td>
		</tr>
	</c:forEach>
</table>
</body>
<script type="text/javascript">
function del(id){
	if(confirm("삭제하시겠습니까?")){
		location.href="jstlDelete.jsp?id="+id;
	}
}
</script>
</html>















