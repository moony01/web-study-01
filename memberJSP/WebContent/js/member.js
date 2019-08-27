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
		window.open("http://localhost:8080/memberJSP/member/checkId.jsp?id="+sId,"","width=300 height=100");
}

function checkPost(){

}

function checkIdClose(id){
	opener.writeForm.id.value = id;
	window.close();
	opener.writeForm.pwd.focus();
}
