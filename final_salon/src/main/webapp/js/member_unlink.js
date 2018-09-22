$(document).ready(function() {
	$('#unlink_form').on('keyup keypress', function(e) {
		  var keyCode = e.keyCode || e.which;
		  if (keyCode === 13) { 
		    e.preventDefault();
		    return false;
		  }
	});
	
	$(document).keydown(function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : 'passwordCheck.do',
				data : {
					'id' : $('#unlink_id').val(),
					'password' : $('#unlink_txt').val()
				},
				success : function(res) {
					console.log(res);
					if(res == true) {
						$('#unlink_form').submit();
						alert('회원탈퇴가 완료되었습니다.');
					}else if(res == false){
						alert('비밀번호가 틀립니다.');
					}
				}
			});
		}
	});
	
	$('#unlink_check_btn').on('click', function() {
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : 'passwordCheck.do',
			data : {
				'id' : $('#unlink_id').val(),
				'password' : $('#unlink_txt').val()
			},
			success : function(res) {
				console.log(res);
				if(res == true) {
					$('#unlink_form').submit();
					alert('회원탈퇴가 완료되었습니다.');
				}else if(res == false){
					alert('비밀번호가 틀립니다.');
				}
			}
		});
	});
});

function unlinkfunc(value){
	var con_value = confirm('회원탈퇴를 하시겠습니까?');
	if(con_value == true){
		location.href = 'unlink.do';
	}
}