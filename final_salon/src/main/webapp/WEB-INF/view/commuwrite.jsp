<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<link rel="stylesheet" type="text/css" href="css/commuwrite.css" />

<script type="text/javascript">
$(document).ready(function() {
    $('#commusummernote').summernote({
        placeholder: '내용을 입력하세요.',
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
    
    function sendFile(file, el) {
        var form_data = new FormData();
        form_data.append('file', file);
        $.ajax({
          data: form_data,
          type: "POST",
          url: 'imageins.do',
          cache: false,
          contentType: false,
          enctype: 'multipart/form-data',
          processData: false,
          success: function(url) {
            $(el).summernote('editor.insertImage', url);
          },
          error:function(e){
             alert("...아..");
             console.log(e);
          }
        });
      }
    
    
    
    $('.worry').on('click',function(e){
    	var her=$('.worry').index(this);
    	$('.worry').css('border','solid 1px black');
    	$(this).css('border','solid 2px #FA5882');
    	
    	if(her==0){
    		$('#category').val('피부고민');
    	};
    	
    	if(her==1){
    		$('#category').val('메이크업');
    	};
    	
    	if(her==2){
    		$('#category').val('제품정보');
    	};
    	
    	if(her==3){
    		$('#category').val('기타');
    	};
    	
    	/* alert(her); */
    });
    
    //섬머노트 안의 내용
    $('#community_write_btn').on('click',function(){
    	$('#commusummernote').val($('#commusummernote').summernote('code'));
    });
    
    
    
  });
</script>
</head>
<body> 
<form action="comm_writePro.do" id="community_write" method="post">
<input type="hidden" value="${sessionScope.dto.id}" name="id"/>
<input type="hidden" value="${sessionScope.dto.email}" name="email"/>
  <div class="commuwritewrap">
    <div class="commuspace2"></div>
    
    <div class="question">
      <span id="flower">✿&nbsp;</span>질문하기
      <p id="id">
         <span id="flower">✿&nbsp;</span>
         <input type="text" id="nickname" name="nickname" value="${sessionScope.dto.nickname}" readonly="readonly"/>
      </p>
    </div>
    
    <div class="space2"></div>
    <div class="commusub">
       <div class="subbb"><span id="flower">✿&nbsp;</span>문의유형을 선택하여 주세요.<span id="flower">&nbsp;✿</span></div>
       
       <div class="imageee">
          <img src="images/worry (1).jpg" class="worry"/>
          <img src="images/worry (1).png" class="worry"/>
          <img src="images/worry (2).png" class="worry"/>
          <img src="images/worry (3).png" class="worry"/>
       </div>
       
       <input type="hidden" id="category" name="category" value="" />
       <br/>
       <div class="titleee"><span id="flower">✿&nbsp;</span>제목<span id="flower">&nbsp;✿</span></div>
       
       <div class="textboxx">
         <input type="text" id="sub" name="subject" placeholder="최대 30자리 까지 생성 가능합니다"/>
       </div>
       
       <div class="space"></div>
       
       <div class="conttentt"><span id="flower">✿&nbsp;</span>내용<span id="flower">&nbsp;✿</span></div>
       <textarea class="summer" id="commusummernote" name="content"></textarea>
       <div class="buttonn">
         <input type="reset" value="취소" id="cancel" />
         <input type="submit" value="등록하기" id="community_write_btn"/>
       </div>
    </div>
    
  </div>
</form>
</body>
</html>