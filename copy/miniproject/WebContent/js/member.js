function checkWrite() {
	if(document.writeForm.name.value=="")
		alert("이름을 입력하세요");
	else if(document.writeForm.id.value=="")
		alert("아이디를 입력하세요");
	else if(document.writeForm.pwd.value=="")
		alert("비밀번호를 입력하세요");
	else if(document.writeForm.pwd.value != document.writeForm.repwd.value)
		alert("비밀번호가 맞지 않습니다")
	else if(document.writeForm.check.value!=document.writeForm.id.value)
		alert("중복체크 하세요");
	else
		document.writeForm.submit();
}

function checkId(){
	var sId = document.writeForm.id.value;
	if(sId=="")
		alert("먼저 아이디를 입력하세요");
	else
		window.open("/miniproject/member/checkId.do?id="+sId,
				"",
				"width=300 height=100 left=500 top=150 locations=yes");
}

function checkIdClose(id){
	opener.writeForm.id.value = id;
	opener.writeForm.check.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}

function checkPost(){
	window.open("/miniproject/member/checkPost.do","","width=500 height=500 scrollbars=yes");
}

function checkPostClose(zipcode, address){
//	opener.writeForm.zipcode.value = zipcode;
//	opener.writeForm.addr1.value = address;
//	window.close();
//	opener.writeForm.addr2.focus();
	
//	opener.document.forms[0].zipcode.value = zipcode;
//	opener.document.forms[0].addr1.value = address;
//	window.close();
//	opener.document.forms[0].addr2.focus();
	
	opener.document.getElementById("daum_zipcode").value = zipcode;
	opener.document.getElementById("daum_addr1").value = address;
	window.close();
	opener.document.getElementById("daum_addr2").focus();
	
}

function checkLogin(){
	if(document.loginForm.id.value=="")
		alert("아이디를 입력하세요");
	else if(document.loginForm.pwd.value=="")
		alert("비밀번호를 입력하세요");
	else
		document.loginForm.submit();
}

function checkModify(){
	if(document.modifyForm.name.value=="")
		alert("이름을 입력하세요");
	else if(document.modifyForm.pwd.value=="")
		alert("비밀번호를 입력하세요");
	else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value)
		alert("비밀번호가 맞지 않습니다")
	else
		document.modifyForm.submit();
}













