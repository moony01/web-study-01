<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

//DB
BoardDTO boardDTO = boardDAO.getBoard(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>글수정</h3>
<form name="boardModifyForm" method="post" action="boardModify.jsp">
<input type="hidden" name="seq" value="<%=seq%>">
<input type="hidden" name="pg" value="<%=pg%>">

	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" id="subject" value="<%=boardDTO.getSubject() %>" size="50">
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content" rows="15" cols="50"><%=boardDTO.getContent() %></textarea>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글수정" onclick="checkBoard()">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
</body>
<script src="../js/board.js" type="text/javascript"></script>
</html>












