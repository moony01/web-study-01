<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="../css/board.css">
<form name="imageboardListForm" method="post" action="">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="3">
	<tr>
		<th width="100"><input type="checkbox"> 번호</th>
		<th width="100">이미지</th>
		<th width="100">상품명</th>
		<th width="100">단가</th>
		<th width="100">개수</th>
		<th width="100">합계</th>
	</tr>
	<c:if test="${list != null }">
		<c:forEach var="imageboardDTO" items="${list }">
			<tr>
				<td align="center"><input type="checkbox">${imageboardDTO.seq }</td>
				<td align="center">
				   <a class="onsubject" style="cursor: pointer; ">
				      <img src="http://localhost:8080/miniproject/storage/${imageboardDTO.image1 }" 
				      	onclick="location.href='/miniproject/imageboard/imageboardView.do?seq=${imageboardDTO.seq }&pg=${pg}'"
				      	width="70" height="70"/>
				   </a>
				</td>
				<td align="center">${imageboardDTO.imageName }</td>
				<td align="center"><fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice }" /></td>
				<td align="center"><fmt:formatNumber pattern="#,###" value="${imageboardDTO.imageQty }" /></td>
				<td align="center"><fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imagePrice * imageboardDTO.imageQty }" /></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<input type="button" value="선택삭제">

<br>
<div style="float: left; width: 450px; text-align: center;">
	${imageboardPaging.pagingHTML }
</div>
</form>
<script>
	let subjects = document.getElementsByClassName('onsubject');
	let id = "${memId}";

	for(let i = 0; i < subjects.length; i++)
	{
		subjects[i].addEventListener("click", function(e) {
			if(id != "null")
			{
				let seq = this.parentElement.previousElementSibling.innerText;
				location.href = "/miniproject/imageboard/imageboardView.do?seq=" + seq + "&pg=${pg}";
			}
			else
			{
				alert("먼저 로그인하세요.");
			}
		});
	}
</script>
	
	
	
	
	
	
	
	
	
	
	