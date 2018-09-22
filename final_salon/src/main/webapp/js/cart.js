$(document).ready(function() { 
	changeTotal();
	$('#cartAllChk').on('change', function() {
		$('.orderChk').each(function() {
			$(this).prop('checked', $('#cartAllChk').prop('checked'));
		});
		if ($(this).prop('checked')) {
			$('#cartAllChk-label').css('background-position', '0px -79px');
		} else {
			$('#cartAllChk-label').css('background-position', '0px 0px');
		}
		changeTotal();
	});
	
	/*$('#cartDel').on('mouseover', function() {
		$(this).stop().animate({
			backgroundColor : 'grey'
		}, 1000);
	});*/
	
	$('.orderChk').on('change', function() {
		changeTotal();
	});
	
	//결제하기 버튼버튼 눌렀을 때
	$('#orderBtn').on('click',function(){
		if($('.proInfo').length ==0){
			alert('장바구니에 목록을 넣어주세요');
			return false;
		}else{
		var orderForm = $('#order_form');
		var total_price = $(this).prev().children('input[name="total_price"]').val();
		var id = $('input[name=id]').val();
		orderForm.append('<input type="hidden" value='+total_price+' name="total_price"/>');
		orderForm.append('<input type="hidden" value='+id+' name="id"/>');
		var opt_chk = true;
		$('.orderChk:checked').each(function(index){
			jQuery.ajaxSettings.traditional = true;
			
			var goods_code = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proImg').children('a').children('#goods_code_del').val();
			var goods_name = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children().children('.proName').children('a').text();		
			var goods_main = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proImg').children('a').children('img').prop('src');
			//var goods_price =$('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children().children('.selBox').children('.sel')
			// 옵션없을때 
			var no_opt = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children('.proDetail').children('.no_option_cntBox');
			var no_opt_goods_price =  $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children('.proDetail').children('.no_option_cntBox').children('.dd').children('#goods_price').val();
			
			// 옵션카운트
			var opt_count = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children('.proDetail').children('.selBox').children('.sel').length;
			var opt = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children('.proDetail').children('.selBox').children('.sel');
			var opt_goods_price = $('.orderChk:checked:eq('+index+')').parent().parent().siblings('.proInfo').children('.proDetail').children('.selBox').children('.sel').children('.cntBox').children('.dd').children('#goods_price').val();
			
			/*옵션 있을때 체크 시작*/
			if(opt_count != 0){
				var cart_num = new Array();
				var goods_color_img = new Array();
				var goods_color = new Array();
				var option_count = new Array();
				var goods_codes2 = new Array();
				
				$.each(opt,function(index){
					var count = 0;
					var goods_code2 = $(this).children('#cart_goods_code2').val();
					$.ajax({
						type:'GET',
						dataType:'json',
						async:false,
						url:'test.do?goods_code2='+goods_code2,
						success:function(res){
							count = parseInt(res);
						} 
					}); 
					
					cart_num[index] = $(this).children('input[name=cart_num]').val();
					goods_color_img[index] = $(this).children('img').prop('src');
					goods_color[index] = $(this).children('.selName').text();
					goods_codes2[index] = $(this).children('#cart_goods_code2').val();
					option_count[index] = $(this).children('.cntBox').children('.dd').children('input[name=cnt]').val();
					
					if(count < option_count[index]){
						alert(goods_color[index]+'재고가 부족합니다.');
						opt_chk = false;
						return false;
					}
					
				});	
				$.ajax({
					type : 'POST',
					dataType : 'text',
					url :'cartAdd.do',
					data : {
						goods_name : goods_name,
						goods_main : goods_main,
						goods_code : goods_code,
						cart_num : cart_num,
						goods_color_img : goods_color_img,
						goods_color : goods_color,
						goods_code2 : goods_codes2,
						option_count : option_count,
						goods_price : opt_goods_price
					},
					success : function(){
					},
					error: function(){
					}
				})
			}/*옵션 있을때 체크 끝*/
			
			/*옵션 없을때 체크 시작*/
			else{
				var cart_num ;
				var option_count ;
				$.each(no_opt,function(index){
					var no_count = 0;
					var goods_code = $(this).parent('.proDetail').children('.proName').children('#cart_goods_code').val();
					
					$.ajax({
						type:'GET',
						dataType:'json',
						async:false,
						url:'nocolor.do?goods_code='+goods_code,
						success:function(res){
							no_count = parseInt(res);
						}
					}); 
				
					cart_num = $(this).parent().children('.proName').children('input[name=cart_num]').val();
					option_count = $(this).children('.dd').children('.cart_cnt').val();
					
					if(no_count < option_count){
						alert(goods_name+'재고가 부족합니다.');
						opt_chk = false;
						return false;
					}
				});
				
				$.ajax({
					type : 'POST',
					dataType : 'text',
					url :'cartAdd.do',
					data : {
						goods_name : goods_name,
						goods_main : goods_main,
						goods_code : goods_code,
						cart_num : cart_num,
						option_count : option_count,
						goods_price : no_opt_goods_price
					},
					success : function(){
					},
					error: function(){
					}
				})
				
			}/*옵션 없을때 체크 끝*/	
		});/*반복문 끝*/
		if(opt_chk == true ){
			orderForm.submit();
		}else{
			listDel();
		}
	  }
	});
	
});

function price_change(index){
	process(this,index);
}
function cartDel(e){
	var del_code = $(e).parent().parent().prev().children().children().val();
	var id = $('input[name=id]').val();
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'cartDel.do?goods_code='+del_code+'&id='+id,
		success:function(res){
			alert('장바구니에서 삭제 시켰습니다.');
			$(e).parents('.proBoxOpt').remove();
		}
	});
} // end cartDel

//start cart_count_down
function cart_count_down(index) {
   var cart_cnt = Number($('#cart_cnt'+index).val())-1;
   if(cart_cnt < 1){
	   alert('1개이상 고르셔야됩니다.')
	   cart_cnt = 1;
   }
 
   $('#cart_cnt'+index).val(cart_cnt);
 
   process(this,index);
}//end cart_count_down

// start cart_count_up
function cart_count_up(index) {
   var cart_cnt = Number($('#cart_cnt'+index).val())+1;
   var temp = '#cart_cnt'+index;

   $('#cart_cnt'+index).val(cart_cnt);
   process(this,index);
   
}//end cart_count_up



function process(data,index){
	var goods_price = $('#cart_cnt'+index).prev().val();
	var goods_count = $('#cart_cnt'+index).val();
	$('#cart_cnt'+index).parent().parent().next().children('span').text(goods_price*goods_count+'원')
	$('#cart_cnt'+index).parent().parent().next().children('input').val(goods_price*goods_count)
	changeTotal();
}


function changeTotal(){ 
	//전체가격
	var prs = 0;
			$('input[name=gt_price]').each(function(index){
				
				if($('input[name=gt_price]:eq('+index+')').parents('.proBoxOpt').children().children().children().prop('checked') == true){
				prs +=Number($(this).val());
				}
			});
		
	$('#totalPriceContent').text(prs+"원");
	$('input[name=total_price]').val(prs);
} //end changeTotal

function countEditProcess(e,data){
	//개별 상품가격 장바구니 테이블 변경 
	var changeCount = $(e).siblings('input[name=cnt]').val();
	var id = $('input[name=id]').val();
	var cart_num = $(e).parent().parent().parent().children('input[name=cart_num]').val();
	var goods_code2 = $(e).parents('.sel').children('#cart_goods_code2').val();
	var prod_count =0;
	var index = $(e).parent().parent().parent().children('input[name=cart_num]').val();
	$.ajax({
		type:'GET',
		dataType:'json',
		async:false,
		url:'test.do?goods_code2='+goods_code2,
		success:function(res){
		prod_count = parseInt(res);
		}
	}); 
	if(Number(prod_count) < Number(changeCount)){
		var chk =confirm("재고 보다 선택하신 수량이 많습니다.\n재고의 최대갯수 만큼 장바구니에 저장 하시겟 습니까?\n해당 상품 재고 : "+ prod_count);
		if(chk == true){
			$.ajax({
				type : 'GET',
				dataType:'text',
				url : 'cartEditCount.do?id='+id+'&prod_count='+prod_count+'&cart_num='+cart_num,
				success : function(res){
					$(e).siblings('input[name=cnt]').val(prod_count);
					process(this,index);
					if(data==1){
					alert(data+"장바구니가 수정되었습니다.");
					}
					
				}
			});
		}else{
			$(e).siblings('input[name=cnt]').val(prod_count);
			process(this,index);
			return false;
		}
	}else{
		$.ajax({
			type : 'GET',
			dataType:'text',
			url : 'cartEditCount.do?id='+id+'&prod_count='+changeCount+'&cart_num='+cart_num,
			success : function(res){
				if(data==1){
				alert(data+"장바구니가 수정되었습니다.");
				}
			}
		});
	}
} 

// href로 보내는 객체는 this로 못받아오기때문에 void(0)으로 해주고 onclick에 이것들 넣어주면 된다.
function option_Del(e,index){ 
	var id = $('input[name=id]').val();
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'optDel.do?cart_num='+index+'&id='+id,
		success: function(res){
			var count = $(e).parent().parent().children('div').length;
			if(count != 1){
				$(e).parent().remove();
			} 
			else if(count == 1){
				$(e).parent().parent().parent().parent().parent().remove();
				$(e).parent().remove();
			}
		}
	});
}

function no_cnt_check(e,data){
	var goods_code = $(e).parents('.proDetail').children('.proName').children('#cart_goods_code').val();
	var prod_count = 0;
	var cart_count = $(e).siblings('.cart_cnt').val();
	var index = $(e).parents('.proDetail').children('.proName').children('input[name=cart_num]').val();
	//var changeCount = $(e).siblings('input[name=cnt]').val();
	var id = $('input[name=id]').val();
	var cart_num = $(e).parent().parent().parent().children('.proName').children('input[name=cart_num]').val();
	//alert(changeCount + " : "+id+" : "+cart_num);
	//alert('sdss');
	$.ajax({
		type:'GET',
		dataType:'json',
		async:false,
		url:'nocolor.do?goods_code='+goods_code,
		success:function(res){
			prod_count = parseInt(res);
		},error:function(error){
		}
	}); 
	if(Number(prod_count) < Number(cart_count)){
		var chk =confirm("재고 보다 선택하신 수량이 많습니다.\n재고의 최대갯수 만큼 장바구니에 저장 하시겟 습니까?\n해당 상품 재고 : "+ prod_count);
		if(chk == true){
			$.ajax({
				type : 'GET',
				dataType:'text',
				url : 'cartEditCount.do?id='+id+'&prod_count='+prod_count+'&cart_num='+cart_num,
				success : function(res){
					$(e).siblings('input[name=cnt]').val(prod_count);
					process(this,index);
					if(data==1){
					alert(data+"장바구니가 수정되었습니다.");
					}
					
				}
			});
		}else{
			$(e).siblings('input[name=cnt]').val(prod_count);
			process(this,index);
			return false;
		}
	}else{
		$.ajax({
			type : 'GET',
			dataType:'text',
			url : 'cartEditCount.do?id='+id+'&prod_count='+cart_count+'&cart_num='+cart_num,
			success : function(res){
				if(data==1){
					alert(data+"장바구니가 수정되었습니다.");
					}
			}
		});
	}
}

//컨트롤러에서 리스트 초기화 해주는 메소드.
function listDel(){
	$.ajax({
		type : 'GET',
		dataType:'text',
		url : 'listDelete.do',
		success : function(res){
		}
	})
}