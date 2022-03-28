$('.datepicker').datepicker({
    daysOfWeekHighlighted: "0",
    todayHighlight: true, 
    autoclose: true,
    format: 'dd/mm/yyyy', 
});

$('.datepicker').on('changeDate', function () {
    document.getElementById('datehf').value = $(this).val();
    //alert(document.getElementById('datehf').value);
});