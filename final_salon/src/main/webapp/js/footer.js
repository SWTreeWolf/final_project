$(document).ready(function() {

	if ($('#teee').val() == null) {
		$.ajax({
			type : 'GET',
			url : 'not.do',
			dataType : 'text',
			success : function(res) {
				$('.no').remove();
				$('#notia').append(res);

				$('.slick-items1').slick({
					dots : false,
					infinite : true,
					autoplay : true,
					vertical : true,
					speed : 300,
					slidesToShow : 1,
					arrows : false,
					adaptiveHeight : true
				});

			}
		});

	} else {
		/* alert("값있음"); */
	}

	$('.slick-items1').slick({
		dots : false,
		infinite : true,
		autoplay : true,
		vertical : true,
		speed : 300,
		slidesToShow : 1,
		arrows : false,
		adaptiveHeight : true
	});

});