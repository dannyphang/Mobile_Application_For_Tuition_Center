let date_pick = $('#calendar').datepicker({
	inline: true,
	firstDay: 1,
	showOtherMonths: true,
	dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
});
$('#calendar').on("change", function () {
	let selected = $(this).val();
	document.getElementById('datehf').value = selected;
});

let date_pick2 = $('#calendar2').datepicker({
	inline: true,
	firstDay: 1,
	showOtherMonths: true,
	dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
});
$('#calendar2').on("change", function () {
	let selected2 = $(this).val();
	document.getElementById('datehf2').value = selected2;
});

function date_func() {
	if (date_pick != null) {
		date_pick instanceof Date;
		var date_str = date_pick.getDate();
		//alert("hi");
		alert(date_str);
	}
	return false;
}