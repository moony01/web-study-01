<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
   
<jsp:useBean id="boardDAO" class="board.dao.BoardDAO"/>

<%
//데이터
request.setCharacterEncoding("utf-8");

int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));
String subject = request.getParameter("subject");
String content = request.getParameter("content");

//DB
Map<String,String> map = new HashMap<String,String>();
map.put("seq", seq+"");
map.put("subject", subject);
map.put("content", content);

boardDAO.boardModify(map);

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
	alert("글수정 완료");
	location.href="boardList.jsp?pg=<%=pg %>";
}
</script>
</html>

















