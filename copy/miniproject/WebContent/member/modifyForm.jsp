<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="modifyForm" method="post" action="/miniproject/member/modify.do">
<table border="1" cellspacing="0" cellpadding="5">
<tr>
	<th width="80">이름</th>
	<td><input type="text" name="name" id="name" value="${requestScope.memberDTO.getName() }"></td>
</tr>
<tr>
	<th width="80">아이디</th>
	<td>
		<input type="text" name="id" value="${memberDTO.id }" style="width: 200px;" readonly>
	</td>
</tr>
<tr>
	<th width="80">비밀번호</th>
	<td><input type="password" name="pwd" style="width: 230px;"></td>
</tr>
<tr>
	<th width="80">재확인</th>
	<td><input type="password" name="repwd" style="width: 230px;"></td>
</tr>
<tr>
	<th width="80">성별</th>
	<td>
		<input type="radio" name="gender" value="0">남
		<input type="radio" name="gender" value="1">여
	</td>
</tr>
<tr>
	<th width="80">이메일</th>
	<td>
		<input type="text" name="email1" value="${memberDTO.email1 }" style="width: 150px;">
		@
		<input type="text" name="email2" id="email22" placeholder="직접입력" list="list">
		<datalist id="list">
			<option value="naver.com">naver.com</option>
			<option value="daum.net">daum.net</option>
			<option value="google.com">google.com</option>
			<option value="nate.net">nate.net</option>
		</datalist>
	</td>
</tr>
<tr>
	<th width="80">핸드폰</th>
	<td>
		<select name="tel1" id="tel11" style="width: 50px;">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="012">019</option>
		</select>
		-
		<input type="text" name="tel2" value="${memberDTO.tel2 }" style="width: 50px;">
		-
		<input type="text" name="tel3" value="${memberDTO.tel3 }" style="width: 50px;">
	</td>
</tr>
<tr>
	<th width="80">주소</th>
	<td>
		<input type="text" name="zipcode" id="daum_zipcode" value="${memberDTO.zipcode }" style="width: 70px;" readonly>
		<input type="button" value="우편번호검색" onclick="checkPost()"><br>
		<input type="text" name="addr1" id="daum_addr1" value="${memberDTO.addr1 }" style="width: 350px;" placeholder="주소" readonly><br>
		<input type="text" name="addr2" id="daum_addr2" value="${memberDTO.addr2 }" style="width: 350px;" placeholder="상세 주소">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value="회원정보수정" onclick="checkModify()">
		<input type="reset" value="다시작성">
	</td>
</tr>
</table>
</form>

<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload=function(){
	document.modifyForm.gender['${memberDTO.gender}'].checked = true;
	
	//document.modifyForm.email2.value = '${memberDTO.email2}';
	document.getElementById("email22").value = '${memberDTO.email2}';
	
	//document.modifyForm.tel1.value = '${memberDTO.tel1}';
	document.getElementById("tel11").value = '${memberDTO.tel1}';
}
</script>



























