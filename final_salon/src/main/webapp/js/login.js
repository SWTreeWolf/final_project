$(document).ready(function(){
	var naverurl = $('#naver').val();
	if($('#loginConfirm').length !=0 ){
	$(document).keydown(function(key) {
		if (key.keyCode == 13) {
			$.ajax({
				type :'POST',
				dataType:'text',
				url:'salonLogin.do',
				data:'id='+$('#signin_id').val()+'&password='+$('#pswd').val()+'&mem_group=salon&returnUrl='+$('#url').val(),
				success:function(res){
					var id_value = id_cookie();
					if($('#saveId').prop('class') == 'on'){
						setCookie('store_id',JSON.stringify(id_value),1);
					}else{
						deleteCookie('store_id');
					}
					location.href=res;
				},
				error:function(error){
					alert("아이디/패스워드를 확인하세요 ^^"); 
				}
			});
			
		}

		});
	}
	//일반 형태
	$('#loginConfirm').on("click",function(){
		$.ajax({
			type :'POST', 
			dataType:'text',
			url:'salonLogin.do',
			data:'id='+$('#signin_id').val()+'&password='+$('#pswd').val()+'&mem_group=salon&returnUrl='+$('#url').val(),
			success:function(res){
				var id_value = id_cookie();
				if($('#saveId').prop('class') == 'on'){
					setCookie('store_id',JSON.stringify(id_value),1);
				}else{
					deleteCookie('store_id');
				}
				location.href=res;
			},
			error:function(error){
				alert("아이디/패스워드를 확인하세요 ^^"); 
			}
		});
	});
	
	//카카오
	$('#kakao').on('click',function(){
		window.open("https://accounts.kakao.com/login?continue=https%3a%2f%2fkauth.kakao.com%2foauth%2fauthorize%3fclient_id%3d5dcaf38de951806f38e7fb7409f0917b%26redirect_uri%3dhttp%3a%2f%2f192.168.10.214%3a8090%2fmytiles%2fkakaoLogin.do%26response_type%3dcode",
				"","width=400,height=400,left=600");
	});
	
	//네이버
	$('#naver').on('click',function(e){
		e.preventDefault();
		window.open(naverurl,"","width=400,height=400,left=600");
	});
	
	//쿠키 아이디 저장
	if(getCookie('store_id')){
		var store_id = getCookie('store_id');
		store_id = JSON.parse(store_id);
		$('#signin_id').val(store_id.id);
		$('#saveId').attr('class',store_id.rec);
	}
	
	$('#saveId').on('click',function(){
		if($(this).prop('class') != 'on'){
			$(this).attr('class','on');
		}else{
			$(this).attr('class','off');
		}
		id_cookie();
	})
	
	$('#signin_id').blur(id_cookie)
	
	//아이디 찾기
	$('.txtLink li:first-child a').on('click',function(e){
		e.preventDefault();
		window.open("searchMember.do?division=id","_blank","width=400,height=400,top=200,left=600,resizable=no");
	})

	//비밀번호 찾기
	$('.txtLink li:nth-child(2) a').on('click',function(e){
		e.preventDefault();
		window.open("searchMember.do?division=pass","_blank","width=400,height=600,top=200,left=600,resizable=no");
	})
});

function id_cookie(){
	var id_value = new Object();
	id_value.id = $('#signin_id').val();
	id_value.rec = $('#saveId').prop('class');
	
	return id_value;
}	

