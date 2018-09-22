$(document).ready(function() {
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'ad_memList_table.do',
		data : {
			standard : $('#ad_mList-standard').val(),
			currentPage : 1
		},
		success : function(res) {
			$('#ad_mList-content').append(res);
		}
	});// end ajax
	
	
	$('#newPoint').on('keyup', function() {
		var point = 0;
		var myPoint = Number($('#myPoint').val());
		var newPoint = Number($('#newPoint').val());
		point = myPoint + newPoint;
		$('#myPointText').text(point);
	});
	
});

function add_point(id) {
	var myPoint = $('.point' + id).val();
	$('#myId').val(id);
	$('#myPoint-owner').text(id + '님의 포인트 : ');
	$('#myPointText').text(myPoint);
	$('#myPoint').val(myPoint);
	$('#pointModal').css('display', 'block');
}

function point_close_modal() {
	$('#pointModal').css('display', 'none');
}

function add_point_ajax() {
	var id = $('#myId').val();
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'ad_addPoint.do?id=' + id + '&point=' + $('#newPoint').val(),
		success : function(newPoint) {
			$('#pointModal').css('display', 'none');
			$('.id-td').each(
					function() {
						if ($(this).text() == id) {
							$(this).siblings('.point-td').children('span')
									.text(newPoint);
							$('.point' + id).val(newPoint);
						}
					});

		}
	});// end ajax
}

function ad_mList(currentPage) {
	$('#ad_mList-currentPage').val(currentPage);
	//$('#ad_mList-form').submit();
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'ad_memList_table.do',
		data : {
			standard : $('#ad_mList-standard').val(),
			currentPage : currentPage
		},
		success : function(res) {
			$('#ad_mList-content').empty();
			$('#ad_mList-content').append(res);
		}
	});// end ajax
}

function standard_change(standard) {
	$('#ad_mList-standard').val(standard);
	ad_mList(1);
}
