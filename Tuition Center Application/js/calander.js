var date_pick = $('#calendar').datepicker({
	dateFormat: 'dd,MM,yyyy'
});
$('#calendar').on("change", function () {
	
	var selected = $(this).val();
	selected = selected.dateFormat('dd/MM/yyyy');
	document.getElementById('datehf').value = selected;
});

//function date_func() {
//	if (date_pick != null) {
//		date_pick instanceof Date;
//		var date_str = date_pick.getDate();
//		alert("hi");
//		alert(date_str);
//	}
//	return false;
//}