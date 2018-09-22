<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css"> 
<meta charset="UTF-8">
<title>Insert title here^^ here^^ here^^</title>
<style type="text/css">

#notice_write_btn #imgwrite{ 
    background-color: #f54a7e;
    border: none;
    color: white;
    padding: 5px 14px;
    text-align: center;
    display: inline-block;
    text-decoration: none;
    font-size: 20px;
    margin: 50px 90px 50px 0;
    cursor: pointer;
    width: 100px;
}

#cs{
    margin: 50px auto;
    width: 1400px;
    font-size: 20px;
    text-align: left;
}

#cs #cate1 {
	width : 30%;
} 

#cs #title1 {
	width : 68%;
}

#notice_write_btn #back1{
	background-color: #f54a7e;
    border: none;
    color: white;
    padding: 5px 1px;
    text-align: center;
    display: inline-block;
    text-decoration: none;
    font-size: 20px;
    cursor: pointer;
    width: 100px;
}

#title1{
 margin-left: 10px;
} 

.note-editor{
	width : 1400px;
	margin : 0 auto;
}

#notice_write_btn{
	width : 1400px;
	margin : 0 auto;
	text-align : center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#imgwrite").on('click',function(){
		var cate = $('#cate1').val();
		if (cate == null || cate == "") {
		  alert("카테고리를 입력하세요");
		  return false;
		}

		var title = $('#title1').val();
		if (title == null || title == "") {
		  alert("제목을입력하세요");
		  return false;
		}   
 
		   $('#frm').attr('action',"imgwrite.do");
		   $('#frm').submit(); 
		
	});
	
	
	$("#back1").on('click',function(){  
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
<!-- 
<input type="text" name="noCate"  value=''>
<input type="text" name="noTitle"  value=''>
 -->  
 <div id="cs">  
<input id="cate1" type="text" name="noCate" size="120" placeholder="카테고리를 입력하세요">
<input id="title1" type="text" name="noTitle" size="120" placeholder="제목을 입력하세요">
<input type="hidden" name="noContent" id="test" value=''>
</div>
</form>  
<div id="summernote"><p>.</p></div>
<!--  <div id="image"></div> -->  
<!--  <button id="see" onclick="see()">코드보기</button> -->

<div id="notice_write_btn">
	<button id="imgwrite" onclick="see()" >등록</button>
	<button id="back1" >뒤로가기</button>
	 <!--  <div id="show"></div>  -->  
</div>


</body>
</html>