$(document).ready(function(){
	$('.slick-items').slick({
		  dots: true,
		  infinite: true,
		  autoplay : true,
		  speed: 300,
		  slidesToShow: 1,
		  arrows: false,
		  adaptiveHeight: true,
	});
	
	$('.ni').slick({
		  slidesToShow: 3,
		  slidesToScroll: 3,
		  arrows: true
	});
	
});