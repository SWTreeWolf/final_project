$(document).ready(function(){
	
	
	$('#profileSubmit').on('click',function(e){
		e.preventDefault();
		if($('#errPswd').ready()[0] != null){
			if($('#errPswd').html() != '' || $('#errPswd2').html() != ''){
				$('#pswd').focus();
				alert('비밀번호를 제대로 입력해주세요')
			}else{
				$('#profile_form').submit();
			}
		}else{
			$('#profile_form').submit();
		}
	})
	
	$('.button2 > .type5').on('click',overlap_nick);
});

var overlap_nick_times = 0;

function overlap_nick(e){
	e.preventDefault();
	overlap_nick_times += 1;
	
	$.ajax({
		type:'POST',
		dataType:'json',
		url : 'overlap.do',
		data : 'id='+$('#cstmId').val() + '&nickname=' + $('#cstmNick').val(),
		success : function(res){
			if(res.length != 0){
				$('#errCstmNick').html('중복되었습니다.');
			}else{
                alert('중복되지 않았습니다.');
				$('#errCstmNick').html('');
			}
		}
	});
}