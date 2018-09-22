$(document).ready(function(){
	commuNum = $('#bno').val();
	reply_list_result(1); //처음에 게시글들어갈때 댓글리스트보이게
	/*if($('#replyareaa').length == 1){*/
		
			$('#comm_register').on('click',reply_list); //댓글추가되기
		
	
});

var commuNum = 1; 

function reply_list(){
	if($('#replyyyy').val()==''){
		alert('내용을 작성하세요.');
		return false;
	}
	 
	/*alert($('#bno').val()+$('#replyyyy').val()+$('#replyWriter').val());*/
	
	
	/*var commuview = new FormData();*/
  /*commuview.append('commuNum',$('#bno').val());
	commuview.append('reply',$('#replyyyy').val());
	commuview.append('replyWriter',$('#replyWriter').val());
	*/
	if($('#log_id').val() == ''){
		alert('로그인 하세요');
	}else{
		$.ajax({
			type : 'post',
			dataType : 'text',
			url : 'replyInsertList.do', //이 url컨트롤러를 지정해야함
			data :'commuNum='+$('#bno').val()+'&reply='+$('#replyyyy').val()+'&replyWriter='+$('#replyWriter').val(), //commuview데이터 넘기는걸 컨트롤러가 인자값으로 받아야한다.
/*			contentType:false,
			processData:false,
			enctype: 'multipart/form-data',*/
			success : reply_list_result(1),
			error: function(error){
			}
	 
		});
	
		//댓글창 초기화
		$('#replyyyy').val('');
		//$('#replyWriter').val('');
	}
}//reply_list()

function  reply_list_result(currentPage){ 
	/*alert('성공');*/
	$.ajax({
		type : 'post',
		url :  'replylist.do', //res가 commuNum임
		data : 'commuNum='+commuNum+'&currentPage='+currentPage,
		dataType : 'json', //리스트로 받는건 json을 데이터타입으로 해줘야 한다.
		success : function(res){ //res가 댓글 리스트,페이지번호, currentPage
			$('#replyareaa').empty();
			$('#pagee').empty();
			
			var pdto = res.pdto;
			var cdto = res.cdto; //이게 리스트
			$.each(cdto, function(index, value){
				/*alert("ddd");*/
				var source = 
				'<div class="smreply" id="smreply">'+
				'<div class="profileee">'+
	            '<div class="profile22">'+
	            '<img src="images/profile.jpg">'+
	            value.replyWriter
	            /*if($('#log_nick').val() == value.replyWriter){
	            +
	            '<button id="coreply_update">수정</button><button id="coreply_delete">삭제</button>'
	            }*/
	            +'</div>'+
	            '<div class="replycont">'+
	            '<img src="images/answer.png">'+
	            value.reply+
	            '</div>'+
	            '</div>'+
	            '</div>';
				$('#replyareaa').append(source);
			});
			 
			for(var i=pdto.startPage ; i <= pdto.endPage ; i++ ) { //+res+ 하는 이유는 ''안에있는 문자열안에 변수를 연결해주려고 +res+한거임
			    $('#pagee').append('<a href="#" onclick="reply_list_result('+i+')">'+i+'</a>');
			}
		},error:function(error){
		}
	});
}//end reply_list_result()//

