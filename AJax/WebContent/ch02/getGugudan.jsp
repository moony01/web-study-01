<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<strong>
<font color="magenta">
<c:forEach var="i" begin="1" end="9" step="1">
	${param.dan} * ${i} = ${param.dan*i}<br>
</c:forEach>

</font>
</strong>

