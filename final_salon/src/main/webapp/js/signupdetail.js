var overlap_id_times = 0;
var overlap_nick_times = 0;

$(document).ready(function() {
	//날짜수정
	   $('#cstmmonth').keyup(function(){
	      var month = parseInt($(this).val());
	      if(month > 12 || month < 0){
	         $(this).val('');
	      }
	   });
	   
	   $('#cstmday').keyup(function(){
	      var day = parseInt($(this).val());
	      if(day > 31 || day < 0){
	         $(this).val('');
	      }
	   }); 
	   
	//daum addr api
	$('.button3 .type4').on('click', sample4_execDaumPostcode)
	$('#btnSelectEmail').on('change', function(){
		var index = $("#btnSelectEmail option").index($("#btnSelectEmail option:selected"));
		var email2 = $('#btnSelectEmail option:selected').val();
		if(index == 4){
			$('#email2').val('');
			$('#email2').attr('readonly',false);
		}else{
			$('#email2').attr('readonly','readonly');
			$('#email2').val(email2);
		}
	});
	
	//captcha api
	$('.refuse .type5').on('click',refresh);
	$('#mk14agree').on('click',compare);
	
	//중복 확인
	$('.button1 > .type5').on('click',overlap_id);
	$('.button2 > .type5').on('click',overlap_nick);
	
	//focus...
	$('#phone_first').on('change',function(){
		$('#phone_middle').focus();
	})
	
	$('#phone_middle').keyup(function(){
		if($(this).val().length == 4){
			$('#phone_last').focus();
		}
	})
	
	//blur....
	$('#cstmNm').blur(function(){
		if($(this).val() != ''){
			$('#errCstmNm').html('');
		}else{
			$('#errCstmNm').html('이름이 비었습니다');
		}
	})
	
	$('#cstmyear').blur(function(){
		if($(this).val() != ''){
			$('#errCstmday').html('');
		}else{
			$('#errCstmday').html('년도가 비었습니다');
		}
	})
	
	$('#cstmmonth').blur(function(){
		if($(this).val() != ''){
			$('#errCstmday').html('');
		}else{
			$('#errCstmday').html('월이 비었습니다');
		}
	})
	
	$('#cstmday').blur(function(){
		if($(this).val() != ''){
			$('#errCstmday').html('');
		}else{
			$('#errCstmday').html('일이 비었습니다');
		}
	})
	
	$('#sex_m').change(function(){
		$('#errCstmgender').html('');
	})
	
	$('#sex_f').change(function(){
		$('#errCstmgender').html('');
	})
	
	$('#phone_middle').blur(function(){
		$('#errCstmPh').html('');
	})
	
	$('#phone_last').blur(function(){
		$('#errCstmPh').html('');
	})
	
	$('#cstmId').blur(function(){
		if($('#cstmId').val() ==''){
			$('#errCstmId').html('아이디가 빈 공간 입니다');
		}else{
			$('#errCstmId').html('');
		}
	})
	
	$('#cstmNick').blur(function(){
		if($('#cstmNick').val() ==''){
			$('#errCstmNick').html('닉네임이 빈 공간 입니다.');
		}else{
			$('#errCstmNick').html('');
		}
	})
	
	$('#pswd').blur(function(){
		if($(this).val() != ''){
			$('#errPswd').html('');
		}else{
			$('#errPswd').html('비밀번호가 비었습니다');
		}
	})
	
	$('#pswd2').blur(function(){
		if($(this).val() != ''){
			$('#errPswd2').html('');
		}else{
			$('#errPswd2').html('비밀번호가 비었습니다');
		}
	})
	
	$('#addr2').blur(function(){
		$('#errZip').html('');
	})
	
	$('#email1').blur(function(){
		$('#errEmail').html('')
	})
	
	//패스워드 정규식
	$('#pswd').blur(function(){
		var pass = $('#pswd').val();
		var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
		if(!(passwordRules .test(pass))){
			$('#errPswd').html('원치 않은 패스워드 입니다.')
		}else{
			$('#errPswd').html('')
		}
		
		if($('#pswd').val() == ''){
			$('#errPswd').html('')
		}
	})
	
	$('#pswd2').blur(function(){
		if($('#pswd').val() != $('#pswd2').val()){
			$('#errPswd2').html('패스워드가 일치하지 않습니다.');
		}else{
			$('#errPswd2').html('');
		}
	});
	
});

//다음 주소 api
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('addr0').value = data.zonecode; // 5자리
																	// 새우편번호
																	// 사용
			document.getElementById('addr1').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('addr2').focus();
		}
	}).open();
	
	return false;
}

//새로고침/////////////////////////////////////////////
function refresh(e){
	e.preventDefault();
	$.ajax({
		type:'POST',
		dataType:'json',
		url :'signup_refresh.do',
		success : result,
		error : function(error){
			console.log(error);
		}
	});
}

function result(res){
	$('.key').val(res.key);
	$('.ansBox > img').attr('src',res.img_name);
}

//비교/////////////////////////////////////////////////
function compare(e){
	   e.preventDefault();
	   if($('#cstmNm').val() == ''){
	      $('#cstmNm').focus();
	      $('#errCstmNm').html('이름이 비었습니다');
	   }else if($('#cstmyear').val() == '' ||
	         $('#cstmmonth').val() == '' ||
	         $('#cstmday').val() == ''){
	      $('#cstmyear').focus();
	      $('#errCstmday').html('생년월일이 비었습니다.');
	   }else if(!$('.gender').is(':checked') && $('.gender').ready()[0] != null){
	      $('.gender').focus();
	      $('#errCstmgender').html('성별을 선택하세요.');
	   }else if($('#phone_middle').val() == '' || 
	         $('#phone_last').val() == ''){
	      $('#phone_middle').focus();
	      $('#errCstmPh').html('핸드폰 번호가 비었습니다.')
	   }else if($('#cstmId').val() == '' && $('#cstmId').ready()[0] != null){
	      $('#cstmId').focus()
	      $('#errCstmId').html('아이디를 입력하세요.')
	   }else if($('#cstmNick').val() == ''){
	      $('#cstmNick').focus()
	      $('#errCstmNick').html('닉네임을 입력하세요.')
	   }else if($('#pswd').val() == '' && $('#errPswd').html() == ''){
	      $('#pswd').focus()
	      $('#errPswd').html('비밀번호를 입력하세요.')
	   }else if($('#pswd2').val() == '' && $('#errPswd2').html() == ''){
	      $('#pswd2').focus()
	      $('#errPswd2').html('비밀번호확인을 입력하세요.')
	   }else if($('#addr0').val() == '' ||
	         $('#addr1').val() == '' ||
	         $('#addr2').val() == ''){
	      $('#addr2').focus()
	      $('#errZip').html('주소를 입력하세요.')
	   }else if($('#email1').val() == '' ||
	         $('#email2').val() == ''){
	      $('#email1').focus();
	      $('#errEmail').html('이메일을 입력하세요.')
	   }else if(overlap_id_times == 0 && $('.button1 > .type5').ready()[0] != null){
	      $('.button1 > .type5').focus();
	      $('#errCstmId').html('중복확인 버튼을 누르세요.')
	   }else if(overlap_nick_times == 0 && $('.button2 > .type5').ready()[0] != null){
	      $('.button2 > .type5').focus();
	      $('#errCstmNick').html('중복확인 버튼을 누르세요.')
	   }else{
	      $.ajax({
	         type:'POST',
	         dataType:'json',
	         url :'signup_compare.do',
	         data : 'key='+$('.key').val() + '&secretWord=' + $('#secretWord').val(),
	         success : compare_result
	      });
	   }
}

function compare_result(res){
	if(res.result){
		$('#joinForm').submit();
	}else{
		$('.refuse .type5').trigger('click');
		$('#errCaptcha').html('보안문자입력에 실패하였습니다.');
		$('#secretWord').focus();
	}
}

//숫자만 입력 받기///////////////////////////////////////
function onlyNumber(event){
	$(event).on("keypress keyup blur",function (e) {    
	     $(this).val($(this).val().replace(/[^\d].+/, ""));
	      if ((e.which < 48 || e.which > 57)) {
	          e.preventDefault();
	      }
	});
}

function onlyChar(event){
	$(event).on("keypress keyup blur",function (e) {
	      if ((e.which >= 48 && e.which <= 57)) {
	          e.preventDefault();
	      }
	});
}

//중복 확인////////////////////////////////////////////
function overlap_id(e){
	e.preventDefault();
	overlap_id_times += 1;
	if($('#cstmId').val() == ''){
		$('#errCstmId').html('아이디가 빈 공간입니다.');
	}else{
	$.ajax({
		type:'POST',
		dataType:'json',
		url : 'overlap.do',
		data : 'id='+$('#cstmId').val(),
		success : function(res){
			if(res.length != 0){
				$('#errCstmId').html('중복되었습니다.');
			}else{
                alert('중복되지 않았습니다.');
				$('#errCstmId').html('');
			}
		}
	});
	}
}

function overlap_nick(e){
	e.preventDefault();
	overlap_nick_times += 1;
	if($('#cstmNick').val() == ''){
		$('#errCstmNick').html('닉네임이 빈 공간입니다.');
	}else{
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
}