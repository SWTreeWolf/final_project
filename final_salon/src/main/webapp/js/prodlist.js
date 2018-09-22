$(document).ready(function(){
	  $(".slide_click").click(function() {
		  var size =0;
		  $(this).parent().siblings('.opt_img').children('img').each(function(){
			  size +=1;
		  });
		  var plusSize = (size/6);
		 // alert($('.opt_img').css("height"));
		  if( $(this).parent().siblings('.opt_img').css("height")=='92px'){
		  $(this).parent().siblings('.opt_img').animate({
             height : '+='+parseInt(plusSize)*42
          }, 400);
		  $(this).parents("#doubleBox").animate({
	             height : '+='+parseInt(plusSize)*42
	          }, 400);
          return false;
		  }else{
			  $(this).parent().siblings('.opt_img').animate({
		             height : 92
		          }, 400);
			  $(this).parents("#doubleBox").animate({
		             height : 225
		          }, 400);
		          return false;
		  }
      });
}); 