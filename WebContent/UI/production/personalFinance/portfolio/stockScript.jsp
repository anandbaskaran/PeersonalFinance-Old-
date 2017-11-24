<script>
	$('#stockTable').DataTable({
		lengthMenu : [ 5, 10, 20, 50 ],
		pageLength : 20,
		columnDefs : [ {
			type : 'any-number',
			targets : [ 1, 2, 3, 4, 5, 6 ]
		} ],
	});
	// Investment chart
	var ctx = document.getElementById("canvasDoughnut");
	var data = {
		labels : [ "Dark Grey", "Purple Color", "Gray Color", "Green Color",
				"Blue Color" ],
		datasets : [ {
			data : [ 120, 50, 140, 180, 100 ],
			backgroundColor : [ "#455C73", "#9B59B6", "#BDC3C7", "#26B99A",
					"#3498DB" ],
			hoverBackgroundColor : [ "#34495E", "#B370CF", "#CFD4D8",
					"#36CAAB", "#49A9EA" ]

		} ]
	};

	var canvasDoughnut = new Chart(ctx, {
		type : 'doughnut',
		tooltipFillColor : "rgba(51, 51, 51, 0.55)",
		data : data,
		options : {
			legend : {
				display : false
			}
		}
	});
</script>