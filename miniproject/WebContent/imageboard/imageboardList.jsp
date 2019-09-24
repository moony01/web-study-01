<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<link rel="stylesheet" href="../css/board.css">

<form name="imageboardListForm" method="" action="/miniproject/imageboard/imageboardDelete.do">
<table border="1" frame="hsides" rules="rows" cellspacing="0" cellpadding="3">
<tr>
	<th width="100"><input type="checkbox" id="all" onclick="checkAll()">번호</th>
	<th width="100">이미지</th>
	<th width="200">상품명</th>
	<th width="100">단가</th>
	<th width="100">개수</th>
	<th width="100">합계</th>
</tr>
<c:if test="${list != null }">
	<c:forEach var="imageboardDTO" items="${list }">
		<tr>
			<td align="center"><input type="checkbox" name="check" value="${imageboardDTO.seq }">${imageboardDTO.seq }</td>
			<td align="center">
			  <a class="onsubject" style="cursor: pointer;"> 
			   <img src="http://localhost:8080/miniproject/storage/${imageboardDTO.image1 }" 
			      onclick="location.href='/miniproject/imageboard/imageboardView.do?seq=${imageboardDTO.seq }&pg=${pg}'"   
			      width="70" height="70"/>
			  </a> 
			</td>
			<td align="center">${imageboardDTO.imageName }</td>
			<td align="center">
			<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imagePrice }"/>
			</td>
			<td align="center">
			<fmt:formatNumber pattern="#,###" value="${imageboardDTO.imageQty }"/>
			</td>
			<td align="center">
			<fmt:formatNumber pattern="#,###원" value="${imageboardDTO.imagePrice*imageboardDTO.imageQty }"/>
			</td>
		</tr>
	</c:forEach>
</c:if>
</table>

<div style="float: left; width: 80px;">
	<input type="button" value="선택삭제" onclick="checkDelete()">
</div>
</form>
<div style="float: left; width: 650px; text-align: center;">
	${imageboardPaging.pagingHTML }
</div>
</form>
<script>
function checkAll(){
	var check = document.getElementsByName("check")
	
	if(document.getElementById("all").checked){
		for(i=0; i<check.length; i++){
			check[i].checked = true;
		}
	}else{
		for(i=0; i<check.length; i++){
			check[i].checked = false;
		}
	}	
}

function checkDelete(){
	var check = document.getElementsByName("check")
	var count=0;
	for(i=0; i<check.length; i++){
		if(check[i].checked) count++;
	}
	
	if(count==0) 
		alert("항목을 선택하세요");
	else{
		if(confirm("정말로 삭제하시겠습니까?"))
			document.imageboardListForm.submit();
	}
}
</script>
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














	