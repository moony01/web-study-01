function checkWrite() {
	if (document.guestbookWriteForm.name.value == "")
		alert("이름을 입력하세요");
	else if (document.guestbookWriteForm.subject.value == "")
		alert("제목을 입력하세요");
	else if (document.guestbookWriteForm.content.value == "")
		alert("내용을 입력하세요");
	else
		document.guestbookWriteForm.submit();
}