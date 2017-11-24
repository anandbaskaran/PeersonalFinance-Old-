<script>
$('#bankTable').DataTable({
	lengthMenu : [ 5, 10, 20, 50 ],
	pageLength : 20,
	columnDefs : [ {
		type : 'any-number',
		targets : [ 0,1,2,3 ]
	} ],
});


var startDate = new Date();
var endDate = new Date();
var diff = 0;
$(document).ready(function() {
  $('#bankStartDate').daterangepicker({
    singleDatePicker: true,
    calender_style: "picker_4"
  }, function(start, end, label) {
  	startDate = start;
  	diff  = new Date(endDate - startDate),
  	diff  = (diff)/1000/60/60/24;
  	$(".bankDuration").html(Math.ceil(diff));
  	$("#bankDuration").val(Math.ceil(diff));
  	console.log(diff);
  });
  $('#bankEndDate').daterangepicker({
      singleDatePicker: true,
      calender_style: "picker_4"
    }, function(start, end, label) {
  	  endDate = start;
  	  diff  = new Date(endDate - startDate),
    	  diff  = diff/1000/60/60/24;
  	  $(".bankDuration").html(Math.ceil(diff));
  	  $("#bankDuration").val(Math.ceil(diff));
        console.log(diff);
    });
});

</script>