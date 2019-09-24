<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
#subject {font-size: 30pt; font-weight: bold; }
</style>

<c:if test="${boardDTO!=null }">

	<table border="1" width="450" cellspacing="0" cellpadding="5" frame="hsides" rules="rows">
		<tr>
			<td colspan="3" id="subject">${boardDTO.subject }</td>
		</tr>
		<tr>
			<th width="150">글번호 : ${boardDTO.seq }</th>
			<th width="150">작성자 : ${boardDTO.id }</th>
			<th width="150">조회수 : ${boardDTO.hit }</th>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
			<pre style="white-space: pre-line; word-break: break-all;">${boardDTO.content }</pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='/miniproject/board/boardList.do?pg=${pg}'">
	<input type="button" value="답글" onclick="location.href='/miniproject/board/boardReplyForm.do?pseq=${boardDTO.seq }&pg=${pg }'">             
	
	<c:if test="${sessionScope.memId == boardDTO.id }">
		<input type="button" value="글수정" onclick="location.href='boardModifyForm.do?seq=${boardDTO.seq }&pg=${pg }'">     
		<input type="button" value="글삭제" onclick="location.href='boardDelete.do?seq=${boardDTO.seq }'">
	</c:if>
</c:if>
















