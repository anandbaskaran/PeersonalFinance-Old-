<script>
_anyNumberSort = function(a, b, high) {
	var reg = /[+-]?((\d+(\.\d*)?)|\.\d+)([eE][+-]?[0-9]+)?/;        
	a = a.replace(',','').match(reg);
	a = a !== null ? parseFloat(a[0]) : high;
	b = b.replace(',','').match(reg);
	b = b !== null ? parseFloat(b[0]) : high;
	return ((a < b) ? -1 : ((a > b) ? 1 : 0));    
}

jQuery.extend( jQuery.fn.dataTableExt.oSort, {
	"any-number-asc": function (a, b) {
		return _anyNumberSort(a, b, Number.POSITIVE_INFINITY);
	},
	"any-number-desc": function (a, b) {
		return _anyNumberSort(a, b, Number.NEGATIVE_INFINITY) * -1;
	}
});

function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
</script>