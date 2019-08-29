<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="boardWriteForm" method="post" action="">
<table border="1" cellspacing="0" cellpadding="5">
<tr>
	<th width="80">제목</th>
	<td><input type="text" name="submit" placeholder="제목을 입력하세요" style="width: 200px;"></td>
</tr>
<tr>
	<th width="80">내용</th>
	<td>
		<!-- <input type="text" name="content" placeholder="내용을 입력하세요" style="width: 200px;"> -->
		<textarea name="content" placeholder="내용을 입력하세요" style="width: 200px; height: 200px;" ></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value="글쓰기" onclick="checkBoardWrite()">
		<input type="reset" value="다시작성" onclick="">
	</td>
</tr>
</table>
</form>
</body>
<script>
	function checkBoardWrite(){
		if(document.boardWriteForm.submit.value=="")
			alert("제목을 입력하세요");
		else if(document.boardWriteForm.content.value=="")
			alert("내용을 입력하세요");
		else
			document.boardWriteForm.submit();
	}
</script>
</html>