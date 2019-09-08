<%@page import="board.bean.BoardPaging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="board.bean.BoardDTO" %>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO" />

<%
//세션
String memId = "";
if(session.getAttribute("memId")!=null)
	memId = (String)session.getAttribute("memId");

//데이터
int pg = Integer.parseInt(request.getParameter("pg"));

//DB-1페이지당 5개씩
int endNum = pg*5;
int startNum = endNum-4;
List<BoardDTO> list = boardDAO.boardList(startNum, endNum);

//페이징 처리
BoardPaging boardPaging = new BoardPaging();
int totalA = boardDAO.getTotalA();//총글수
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();

//조회수-새로고침 방지
if(session.getAttribute("memId")!=null){
	Cookie cookie = new Cookie("memHit", "0");
	cookie.setMaxAge(30*60);
	response.addCookie(cookie);//클라이언트에게 보내기
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/board.css">
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
			<td width="200">
				<a href="javascript:void(0)" id="subjectA" 
				onclick="isLogin(<%=boardDTO.getSeq() %>,<%=pg%>)">
				<%=boardDTO.getSubject() %>
				</a>
			</td>
			<td align="center" width="100"><%=boardDTO.getId() %></td>
			<td align="center" width="100"><%=boardDTO.getLogtime() %></td>
			<td align="center" width="100"><%=boardDTO.getHit() %></td>
		</tr>
	<%}//for %>
</table>
<%}//if %>
<div style="float: left; width: 50px;">
	<img src="../image/dog.png" width="50" height="50" 
	onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
</div>
<div style="float: left; width:600px; text-align: center;">
<%=boardPaging.getPagingHTML() %>
</div>
</body>
<script type="text/javascript">
function isLogin(seq,pg){
	if("<%=memId%>"=="")
		alert("먼저 로그인하세요");
	else
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;		
}
</script>
</html>



















