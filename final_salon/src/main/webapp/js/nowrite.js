$(document).ready(function(){
 
	$("#nowrite").on('click',function(){
		   //alert("확인"); 
		    
		   $('[name=noContent]').val( 
		       		 $('[name=noContent]').val().replace(/\n/gi,'<br/>'));
		    
		   $('#frm').attr('action',"nowrite.do");
		   $('#frm').submit();    
	});

}); 