$(document).ready(function() {
	$("#eventcome").on('click', function() {
		$('#frm').attr('action', "event.do");
		$('#frm').submit();
	});

	$("#eventup").on('click', function() {
		$('#frm').attr('action', "eventup.do");
		$('#frm').submit();
	});
	$("#eventdel").on('click', function() {
		$('#frm').attr('action', "eventdel.do");
		$('#frm').submit();
	});
});
