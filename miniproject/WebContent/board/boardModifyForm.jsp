<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>글수정</h3>
<form name="boardModifyForm" method="post" action="/miniproject/board/boardModify.do">
<input type="hidden" name="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" value="${pg }">

<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" id="subject" value="${boardDTO.subject }">
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id="content" rows="20" cols="40">${boardDTO.content }</textarea>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="글수정" onclick="checkBoard()">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
	
<script src="../js/board.js" type="text/javascript"></script>







