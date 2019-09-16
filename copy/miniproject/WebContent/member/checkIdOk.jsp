<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

${id }는 사용 가능
<br><br>
<input type="button" value="사용하기" onclick="checkIdClose('${id}')">
</body>
<script type="text/javascript" src="../js/member.js">
function checkIdClose(){
	opener.writeForm.id.value = "${id}";
	window.close();
	opener.writeForm.pwd.focus();
}
</script>
