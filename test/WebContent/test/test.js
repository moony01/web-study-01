/**
 * 
 */

function navClick(evt, tabName){
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

function checkWrite() {
	if(document.signUp.name.value=="")
		alert("이름을 입력하세요");
	else if(document.signUp.id.value=="")
		alert("아이디를 입력하세요");
	else if(document.signUp.pwd.value=="")
		alert("비밀번호를 입력하세요");
	else if(document.signUp.pwd.value != document.signUp.repwd.value)
		alert("비밀번호가 맞지 않습니다")
	else
		document.writeForm.submit();
}

function checkLogin(){
	if(document.login.id.value=="")
		alert("아이디를 입력하세요");
	else if(document.login.pwd.value=="")
		alert("비밀번호를 입력하세요");
	else
		document.loginForm.submit();
}