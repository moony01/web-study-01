<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="board.bean.BoardDTO" %>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" />

<%
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//DB-1페이지당 5개씩
int endNum = pg*5;
int startNum = endNum-4;
List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%if(list!=null){ %>
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="5">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%for(BoardDTO boardDTO : list){ %>
		<tr>
			<td align="center" width="100"><%=boardDTO.getSeq() %></td>
			<td width="200"><%=boardDTO.getSubject() %></td>
			<td align="center" width="100"><%=boardDTO.getId() %></td>
			<td align="center" width="100"><%=boardDTO.getLogtime() %></td>
			<td align="center" width="100"><%=boardDTO.getHit() %></td>
		</tr>
	<%}//for %>
</table>
<%}//if %>
<img src="../image/dog.png" width="50" height="50" 
onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
</body>
</html>








