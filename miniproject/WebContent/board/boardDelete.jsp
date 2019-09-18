<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="../css/board.css">

<c:if test="${list!=null }">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="5">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>

	<c:forEach var="boardDTO" items="${list }">
		<tr>
			<td align="center" width="100">${boardDTO.seq }</td>
			<td width="200">
				<c:forEach var="i" begin="1" end="${boardDTO.lev }" step="1">
					&emsp;
				</c:forEach>
				<c:if test="${boardDTO.pseq!=0 }">
					<img src="../image/reply.gif">
				</c:if>
				<a href="javascript:void(0)" id="subjectA" 
				onclick="isLogin(${boardDTO.seq },${pg })">
				${boardDTO.subject }
				</a>
			</td>
			<td align="center" width="100">${boardDTO.id }</td>
			<td align="center" width="100">${boardDTO.logtime }</td>
			<td align="center" width="100">${boardDTO.hit }</td>
		</tr>
	</c:forEach>
</table>
</c:if>

<div style="float: left; width:700px; text-align: center;">
	${boardPaging.pagingHTML }
</div>

<script type="text/javascript">
function isLogin(seq, pg){
	if("${memId}"=="")
		alert("먼저 로그인하세요");
	else
		location.href="/miniproject/board/boardView.do?seq="+seq+"&pg="+pg;		
}
</script>



















