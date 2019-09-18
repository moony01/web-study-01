<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="imageboardForm" method="post" enctype="multipart/form-data" 
action="/miniproject/imageboard/imageboardWrite.do">
	<table border="1" cellspacing="0" cellpadding="3">
		<tr>
			<th width="80">상품코드</th>
			<td><input type="text" name="imageId" placeholder="상품코드 입력"></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name="imageName" placeholder="상품명 입력"></td>
		</tr>
		<tr>
			<th>단가</th>
			<td><input type="text" name="imagePrice" placeholder="단가 입력"></td>
		</tr>
		<tr>
			<th>개수</th>
			<td><input type="text" name="imageQty" placeholder="개수 입력"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="15" cols="50" name="imageContent" placeholder="내용 입력"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="file" name="image1" size="60">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="이미지등록" onclick="checkWrite()">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
	
<script src="../js/imageboard.js" type="text/javascript"></script>








