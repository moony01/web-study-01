<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<span>
	<img src="../image/zoom.png" onclick="bigImage()">
</span>

<table border="1" cellspacing="0" cellpadding="3">
<tr align="center">
	<td rowspan="4">
		<img src="../storage/${imageboardDTO.image1 }" width="200" height="200">
	</td>
	<th width="100">상품명</th>
	<td width="150">${imageboardDTO.imageName }</td>
</tr>
<tr align="center">
	<th>단가</th>
	<td>
		<fmt:formatNumber value="${imageboardDTO.imagePrice }" type="number"/>원
	</td>
</tr>
<tr align="center">
	<th>개수</th>
	<td>${imageboardDTO.imageQty }개</td>
</tr>
<tr align="center">
	<th>합계</th>
	<td>
		<fmt:formatNumber value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" type="number"/>원
	</td>
</tr>

<tr>
	<td colspan="3" height="200" valign="top">
		<pre>${imageboardDTO.imageContent }</pre>
	</td>
</tr>
</table>

<input type="button" value="목록" onclick="location.href='/miniproject/imageboard/imageboardList.do?pg=${pg}'">

<script>
function bigImage(){
	var newWindow = window.open("","","width=500 height=500");
	
	var img = newWindow.document.createElement("img");
	img.setAttribute("src", "http://localhost:8080/miniproject/storage/${imageboardDTO.image1 }");
	img.setAttribute("width", "500");
	img.setAttribute("height", "500");
	newWindow.document.body.appendChild(img);
}
</script>
