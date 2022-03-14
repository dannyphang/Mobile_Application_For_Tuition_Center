let date_pick = $('#calendar').datepicker({
	inline: true,
	firstDay: 1,
	showOtherMonths: true,
	dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
});
$('#calendar').on("change", function () {
	alert($(this).val());
	document.getElementById('datehf').value = $(this).val();
});

let date_pick2 = $('.calendar_dob').datepicker({
	inline: true,
	firstDay: 1,
	showOtherMonths: true,
	dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
});
$('.calendar_dob').on("change", function () {
	alert($(this).val());
	document.getElementById('datehf').value = $(this).val();
});