<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dataDTO" class="exam.bean.DataDTO" scope="session"/>
<jsp:setProperty property="x" name="dataDTO"/>
<jsp:setProperty property="y" name="dataDTO"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Sum</title>
	</head>
	<body>
		<form name="sumForm" method="get" action="mul.jsp">
			<p>
			<jsp:getProperty property="x" name="dataDTO"/> + 
			<jsp:getProperty property="y" name="dataDTO"/> = 
			<%=dataDTO.getX() + dataDTO.getY() %>
			</p>
			
			<input type="submit" value="곱구하기">
			<input type="button" value="곱구하기" onclick="location.href='mul.jsp">
		</form>
	</body>
</html>








