function checkWrite(){
	if(document.guestbookWriteForm.subject.value=="")
		alert("제목을 입력하세요");
	else if(document.guestbookWriteForm.content.value=="")
		alert("내용을 입력하세요");
	else
		document.guestbookWriteForm.submit();
}