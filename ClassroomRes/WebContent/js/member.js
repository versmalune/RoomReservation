function infoConfirm(){
	
	if (document.reg_form.id.value.length == 0) {
		alert("PLEASE ENTER A VALID ID.");
		reg_form.id.focus(); //커서 id 입력 칸으로 자동 옮겨 줌
		return;
	}
	if (document.reg_form.id.value.length < 4) {
		alert("ID SHOULD BE MORE THAN 4 LETTERS.");
		reg_form.id.focus();
		return;
	}
	if (document.reg_form.pw.value.length == 0) {
		alert("PLEASE ENTER A VALID PASSWORD.");
		reg_form.pw.focus();
		return;
	}
	if (document.reg_form.pw.value != document.reg_form.pw_check.value){
		alert("PASSWORD MISMATCH.");
		reg_form.pw.focus();
	}
	if (document.reg_form.name.value.length == 0){
		alert("PLEASE ENTER A NAME.");
		reg_form.name.focus();
	}
	if (document.reg_form.email.value.length == 0){
		alert("PLEASE ENTER AN EMAIL.");
		reg_form.email.focus();
	}
	
	document.reg_form.submit();
	
}