 $(document).ready(function() { 
	   
		$("#cust").one('click',function(){ 
			location.href="customer.do";
		});
		   		 
	$("#mail").on('click',function(){
	        //alert("실험"); 
			var email = $('#e_mail').val();
			  if (email == null || email == "") {
			    alert("이메일을 입력하세요");
			    return false; 
			  } 
			  
			  var title = $('#e_title').val(); 
			  if (title == null || title == "") {
			    alert("제목을 입력하세요");
			    return false;
			  }   
			  
			 $('#frm').attr('action',"mailSending.do").submit();	
		});  
		 
		 
	});

	
 
