<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here^^ here^^ here^^</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/noupdate.css" /> 
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	
	$("#imgupdate").on('click',function(){ 
		   $('#frm').attr('action',"noupdate.do");
		   $('#frm').submit();    
		 
	});
	
	
	 
	
	
	 
	$("#back2").on('click',function(){  
		history.go(-1);
	});
	
	
	  $('#summernote').summernote({
		   placeholder: 'Hello bootstrap 4',
	        tabsize: 2,
	        height: 500,
	        callbacks: {
	            onImageUpload: function(files, editor, welEditable) {
	              for (var i = files.length - 1; i >= 0; i--) {
	               sendFile(files[i],this);

	              }
	            }
	        }
	  });
	});
	function sendFile(file, el) {
	      var form_data = new FormData();
	      form_data.append('file', file);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: 'imagein.do',
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function(url) {
	          $(el).summernote('editor.insertImage', url);
	          $('#image').append('<img src="'+url+'" width="auto" height="auto"/>');
	        },
	        error:function(e){
	        	console.log(e);
	        }
	      });
	    }
function see(){
	$('#show').append($('#summernote').summernote('code'));
    
    var code=$('#summernote').summernote('code');
    
    document.getElementById("test").value = "";
    document.getElementById("test").value = $('#summernote').summernote('code');   
    

}
  
</script>
</head>
<body> 
<form id="frm" method="post">
<div id="cscs">      
<input id ="cate1" type="text" name="noCate" size="120"  value="${dto.noCate}">
<input id ="title1" type="text" name="noTitle" size="120"   value="${dto.noTitle}">
</div> 
<input type="hidden" name="noContent" id="test" value=''>
<input type="hidden" name="noNum" value="${dto.noNum}" /> 
<input type="hidden" name="currentPage" value="${currentPage}" /> 
</form>       
<div id="summernote" ><p>${dto.noContent}</p></div>
<div id="image"></div> 

<div id="notice_write_btn">
	<button id="imgupdate" onclick="see()">수정</button>
	<button id="back2">뒤로가기</button>
</div>
<div id="show"></div>
</body>
</html>