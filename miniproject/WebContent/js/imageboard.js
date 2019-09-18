function checkWrite() {
	if(document.imageboardForm.imageId.value == '')
	{
		alert("상품코드를 입력해주세요.");
		document.imageboardForm.imageId.focus();
	}
	else if(document.imageboardForm.imageName.value == '')
	{
		alert("상품명을 입력해주세요.");
		document.imageboardForm.imageName.focus();
	}
	else if(document.imageboardForm.imagePrice.value == '')
	{
		alert("단가를 입력해주세요.");
		document.imageboardForm.imagePrice.focus();
	}
	else if(document.imageboardForm.imageQty.value == '')
	{
		alert("개수를 입력해주세요.");
		document.imageboardForm.imageQty.focus();
	}
	else if(document.imageboardForm.imageContent.value == '')
	{
		alert("내용을 입력해주세요.");
		document.imageboardForm.imageContent.focus();
	}
	else
	{
		document.imageboardForm.submit();
	}
}












