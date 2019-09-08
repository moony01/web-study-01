<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="" method="post" enctype="multipart/form-data" action="fileUpload.jsp">
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
		<td colspan="2">
		<input type="file" name="upload1" size="50">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<input type="file" name="upload2" size="50">
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="파일업로드">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</body>
</html>








