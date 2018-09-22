$(document).ready(function(){

	$("#btnSave").on('click',function(){
        
		var cate = $('#cate').val();
		  if (cate == null || cate == "") {
		    alert("카테고리를 입력하세요");
		    return false;
		  }
		  
		  var ques = $('#ques').val();
		  if (ques == null || ques == "") {
		    alert("질문을입력하세요");
		    return false;
		  }  
		
		$('[name=fnqContent]').val(
       		 $('[name=fnqContent]').val(). 
       		 replace(/\n/gi,'<br/>'));
		   
		 $('#frm').attr('action',"write.do").submit();	
	});  

	$("#btnList").on('click',function(){   
		 $('#frm').attr('action',"customer.do").submit();	
	});  
	
	
	
	
 
});

