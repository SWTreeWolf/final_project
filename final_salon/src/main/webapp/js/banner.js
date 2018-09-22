$(document).ready(function(){
	//top_button
	   $(function() {
	       $(window).scroll(function() {
	           if ($(this).scrollTop() > 300) {
	               $('#MOVE_TOP_BTN').fadeIn();
	           } else {
	               $('#MOVE_TOP_BTN').fadeOut();
	           }
	       });
	       
	       $("#MOVE_TOP_BTN").click(function() {
	           $('html, body').animate({
	               scrollTop : 0
	           }, 400);
	           return false;
	       });
	   });
	
	$('#cateBTN').on('click',function(){
		$.ajax({
			type:'GET',
			url:'head.do',
			dataType:'text',
			success:function(res){
				$('.ctgr_con').remove();
				$('.tab_group').append(res);
			}
		})
	}) 
	/*
	$('.slick-items').slick({
		  dots: true,
		  infinite: true,
		  autoplay : true,
		  speed: 300,
		  slidesToShow: 1,
		  arrows: false,
		  adaptiveHeight: true,
	});
	*/ 
	$('.new_image').slick({
		  slidesToShow: 5,
		  slidesToScroll: 1,
		  arrows: true,
	} );
	
});