<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
//데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

//조회수-새로고침 방지
Cookie[] ar = request.getCookies();//모든 쿠키 얻어오기
if(ar!=null){
	for(int i=0; i<ar.length; i++){
		if(ar[i].getName().equals("memHit")){
			boardDAO.boardHit(seq);
			
			ar[i].setMaxAge(0);//쿠키 삭제
			response.addCookie(ar[i]);
		}
	}
}

//조회수-쿠키 시간을 30분 사용
/*
String memId = (String)session.getAttribute("memId");
boolean sw = false;

Cookie[] ar = request.getCookies();//모든 쿠키 얻어오기
if(ar!=null){
	for(int i=0; i<ar.length; i++){
		if(ar[i].getName().equals(memId+seq)){
			sw = true;
		}
	}//for
	
	if(!sw){
		boardDAO.boardHit(seq);
		
		Cookie cookie = new Cookie(memId+seq, seq+"");
		System.out.println("쿠키명="+(memId+seq)+", 값="+seq);
		cookie.setMaxAge(30*60);
		response.addCookie(cookie);//클라이언트에게 보내기
	}
}//if
*/

BoardDTO boardDTO = boardDAO.getBoard(seq);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subject {font-size: 30pt; font-weight: bold; }
</style>
</head>
<body>
<%if(boardDTO!=null){ %>
	<table border="1" width="450" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<td colspan="3" id="subject"><%=boardDTO.getSubject() %></td>
		</tr>
		<tr>
			<th width="150">글번호 : <%=boardDTO.getSeq() %></th>
			<th width="150">작성자 : <%=boardDTO.getId() %></th>
			<th width="150">조회수 : <%=boardDTO.getHit() %></th>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
			<pre style="white-space: pre-line; word-break: break-all;"><%=boardDTO.getContent() %></pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg%>'">
	<%if(session.getAttribute("memId").equals(boardDTO.getId())){ %>
		<input type="button" value="글수정" onclick="location.href='boardModifyForm.jsp?seq=<%=seq%>&pg=<%=pg%>'">     
		<input type="button" value="글삭제" onclick="">
	<%} %>
<%} %>
</body>
</html>















