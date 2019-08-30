<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>

<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
//데이터
request.setCharacterEncoding("utf-8");

String subject = request.getParameter("subject");
String content = request.getParameter("content");

String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

BoardDTO boardDTO = new BoardDTO();
boardDTO.setId(id);
boardDTO.setName(name);
boardDTO.setEmail(email);
boardDTO.setSubject(subject);
boardDTO.setContent(content);

//DB
boardDAO.write(boardDTO);
%>
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
	alert("글쓰기 성공");
	location.href="../main/index.jsp";
	
}
</script>
</html>







