<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h3><img src="../image/peach.jpg" width="50" height="50" 
onclick="location.href='/miniproject/main/index.do'" style="cursor: pointer;">MVC를 이용한 미니프로젝트</h3>

<font size="2">
<c:if test="${memId!=null }">
	<a href="/miniproject/board/boardWriteForm.do">글쓰기</a>&emsp;
	
	<c:if test="${memId eq 'admin' }">
		<a href="/miniproject/imageboard/imageboardWriteForm.do">이미지등록</a>&emsp;
	</c:if>
	
	<a href="/miniproject/imageboard/imageboardList.do?pg=1">이미지목록</a>&emsp;
</c:if>
<a href="/miniproject/board/boardList.do?pg=1">목록</a>&emsp;

</font>











