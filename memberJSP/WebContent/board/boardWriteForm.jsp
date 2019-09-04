<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기</title>
	</head>
	<body>
		<h3>글쓰기</h3>
		<form name="boardWriteForm" method="post" action="boardWrite.jsp">
			<table border="1" cellspacing="0" cellpadding="5">
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" id="subject" size="50">
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="content" id="content" rows="15" cols="50"></textarea>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="글쓰기" onclick="checkBoard()">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</body>
	
	<script src="../js/board.js" type="text/javascript"></script>
</html>













