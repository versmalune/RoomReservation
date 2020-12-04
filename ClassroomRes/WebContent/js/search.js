function search(){
	if (document.search_form.starttime.value.length !== 4) {
		alert("PLEASE ENTER A VALID START TIME");
		search_form.starttime.focus(); //커서 id 입력 칸으로 자동 옮겨 줌
		return;
	}
	if (document.search_form.endtime.value.length !== 4) {
		alert("PLEASE ENTER A VALID END TIME");
		search_form.endtime.focus();
		return;
	}
	if (document.search_form.day.value.length == 0) {
		alert("PLEASE ENTER A VALID DAY");
		search_form.day.focus();
		return;
	}	
	document.search_form.submit();
	console.log("SUBMITTED")
}