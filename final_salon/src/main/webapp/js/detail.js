$(document).ready(function() {
	var location = window.location.pathname;
	var selectTarget = $('.selectbox #select');
	var count = '';
	var selectimg ;
	var id = $('#id').val();
	var inventory = '';
	// 재고받아오는 에이잭스
	if($('input[name=goods_code]').ready()[0] != null){
		$.ajax({
			type:'GET',
			dataType:'json',
			async:false,
			url:'nocolor.do?goods_code='+$('input[name=goods_code]').val(),
			success:function(res){
				inventory = parseInt(res);
			}
		});
	}
	
	selectTarget.change(function() {
		var select_name = $(this).children('option:selected').val();
		$(this).siblings('label').text(select_name);
	});
	
	$('.add').on('click', function() {
		var add = ' '+$('#select').val();
		var bigyo = null;
		var overlap = true;
		var goods_code2 = $('#select option:selected').attr('id'); 
		var check_count = 0 ;
		
		$.ajax({
			type:'GET',
			dataType:'json',
			async:false,
			url:'test.do?goods_code2='+goods_code2,
			success:function(res){
				check_count = parseInt(res);
			}
		}); 
		
		if(add==" 선택"){
			alert(add + "옵션을 선택하세요.");
			return false;
		}
		$('.option_sel').each(function(index){
			bigyo = $(this).children(':first').text();	
			if(add == bigyo){
				alert('이미 선택되어 있는 상품입니다.');
				$('.selectbox #select').siblings('label').text("선택");
				overlap = false;
				return false;
			}
		});
		
		if(overlap == true && check_count != 0){
			
			$('.option_list>a>input').each(function(index){
				console.log($(this))
				if($(this).val()== $('.selectbox #select').children('option:selected').val()){
					selectimg = $(this).siblings('img').attr("src");
				}
			});
			$('.opt_sel_add').append(
				'<div class="option_sel"><div class="left">'+
	               '<img alt="선택옵션이미지" src='+selectimg+'> <span class="name">'+$('#select').val()+'</span>'+
	            '</div><div class="right"><div class="countbox">'+           
	                  '<div class="count">'+ 
	                     '<input id="count_down" type="image" src="images/count_down.gif" />'+
	                     '<input id="count_text" type="text" title="선택품목갯수" value="1" maxlength="3" />'+
	                     '<input id="count_up" type="image" src="images/count_up.gif" /></div>'+
	                  '</div>'+
	               '<div class="price_result">'+
	                  '<span class="price_item"><a id="price_result_won">'+$('.won').text()+'</a><span class="result">원</span></span></div>'+
	               '<div class="delete">'+
	                  '<input type="image" src="images/delete.png"></div></div>'+  
	               '<input class="detail_goods_code2" type="hidden" value="'+goods_code2+'"/></div>'
	               ); 
			
			$('.detail_top').css('min-height','+=50');
			 
			 $('#select_opt').prop('selected',true);
			 $('.selectbox #select').siblings('label').text("선택");
			process($('#count_up').siblings('#count_text'));
		} 
		else if(check_count==0){
			alert('품절된 상품입니다.');
		}
		
		//alert('test');
	});
	
	$(document).on('change','#count_text',function(){
		var text = $(this).parent().parent().parent().prev().children('.name').text();
		var goods_code2 = $(this).parent().parent().parent().siblings('.detail_goods_code2').val();
		var goods_code =  $(this).siblings('#detail_goods_code').val();
		
		if($('.selectbox').length>0){
			$.ajax({
				type:'GET',
				dataType:'json',
				async:false,
				url:'test.do?goods_code2='+goods_code2,
				success:function(res){
					count = parseInt(res);
				}
			}); 
		}
		else{
			$.ajax({
				type:'GET',
				dataType:'json',
				async:false,
				url:'nocolor.do?goods_code='+goods_code,
				success:function(res){
					count = parseInt(res);
				}
			}); 
		}
		
		if($(this).val() > count){
			alert('수량을 다시선택하세요.');
			$(this).val('1');
			process($(this));
		}else{
			$(this).siblings('.detail_total_count').val($(this).val());
			process($(this));
		}
	})
	
	$(document).on('click','#count_up',function(){
		var num = parseInt($(this).siblings("#count_text").val());
		var goods_code2 = $(this).parent().parent().parent().siblings('.detail_goods_code2').val();
		var goods_code =  $(this).siblings('#detail_goods_code').val();
		if($('.selectbox').length>0){
			$.ajax({
				type:'GET',
				dataType:'json',
				async:false,
				url:'test.do?goods_code2='+goods_code2,
				success:function(res){
					count = parseInt(res);
				}
			}); 
		}
		else{
			//alert(goods_code);
			$.ajax({
				type:'GET',
				dataType:'json',
				async:false,
				url:'nocolor.do?goods_code='+goods_code,
				success:function(res){
					count = parseInt(res);
				}
			}); 
		}
		
		if(num >= count){
			alert('재고가 부족합니다.');
		}else{
			$(this).siblings("#count_text").val(num+1);
			$(this).siblings('.detail_total_count').val(num+1);
		}
		process($(this).siblings("#count_text"));
		return false;
	});
	
	function process(opt){
		var tot=0;
		var price = opt.parent().parent().siblings(".price_result").children('.price_item').children('#price_result_won').text();
		//alert(price);
		opt.parent().parent().siblings(".price_result").children('.price_item').children('#price_result_won').text(opt.val()*$('.won').text());
		if($('.selectbox').length>0){
		$('.option_sel').each(function(index){
			tot = Number(tot) + Number($(this).children('.right').children('.price_result').children('.price_item').children('#price_result_won').text());
		});
		}else{
			tot = Number(tot) + Number(opt.parents('.right').children('.price_result').children('.price_item').children('#price_result_won').text());
		}
		$('.tot_price').text(tot);
	}
	
	
	$(document).on('click','#count_down',function(){ 
		var num = parseInt($(this).siblings("#count_text").val());
		 if(num <= 1){
			  alert("1개 이상 선택하세요.");
		  } else {
			  $(this).siblings("#count_text").val(num-1);
			  $(this).siblings('.detail_total_count').val(num-1);
		  }
		 process($(this).siblings("#count_text"));
		return false;
	});
	
	$(document).on('click','.delete',function(){
		$(this).parents('.option_sel').remove();
		process($('#count_up').siblings('#count_text'));
	});
	
	
		
		$(document).on('click','.plus',function() {
			$(this).parents('.wrap4').children('.con').slideToggle();
		});
		
		if($('#goods_code').ready()[0] != null){
			$.ajax({
				type:'POST',
				dataType:'text',
				url:'table.do',
				data:'code='+$('#goods_code').val(),
				success:review,
				error : function(error){
					//alert('에러~');
				}
			});
		}
		
		$('.order').on("click",function(){
			if(id == ''){
				alert('로그인 후 이용이 가능합니다.');
				return false;
			}else{
				if(inventory == 0){
					alert('재고가 부족합니다.');
					return false;
				}
				var goods_color;
				var option_count;
				var option_color_img;
				var goods_code2;
				//alert(selectimg == undefined);  
				if($('.add').length != 0 && $('.option_sel').length == 0){
					alert("옵션을 선택하세요.");
					return false;
				}
				if(selectimg == undefined){
					$('#directFrm').append(
		                  '<input type="hidden" value ='+$('#count_text').val()+' name= "option_count"/>'
		            );
				}else{
					$(".option_sel").each(function(index){
						option_color_img  =$(this).children('.left').children('img').attr('src');
						option_count = $(this).children('.right').children('.countbox').children('.count').children('#count_text').val();
						goods_color = $(this).children('.left').children('.name').text();
						goods_code2 = $(this).children('.detail_goods_code2').val();
	           
						$('#directFrm').append(
								'<input type="hidden" value ='+goods_code2+' name="goods_code2"/>'+	
								'<input type="hidden" value ='+option_color_img+' name= "option_color_img"/>'+
								'<input type="hidden" value ='+goods_color+' name= "goods_color"/>'+
								'<input type="hidden" value ='+option_count+' name= "option_count"/>'
						);
					});
				} // 안쪽 else 끝
				$('#directFrm').submit();
			} // 바깥 else 끝
	     });		
});


function listreview(){
	$.ajax({
		type:'POST',
		dataType:'text',
		url:'table.do',
		data:'code='+$('#goods_code').val(),
		success:review,
		error : function(error){
			//alert('에러~');
		}
	});
}

function listReply(num){ 
	$.ajax({
		type:'POST',
		dataType:'text',
		url:'table.do',
		data:'code='+$('#goods_code').val()+'&currentPage='+num,
		success:review,
		error : function(error){
			//alert('에러~');
		}
	});
} 

function options(color){
	var s = $('.selectbox #select').val(color).prop('selected',true); 
	$('.selectbox #select').siblings('label').text($('.selectbox #select').val());
} 

function review(res){
	$('.tj').html(res);
}

function cartIns(id){//장바구니 넘긴다
	   if(id == ''){
		   alert('로그인 후 사용이 가능합니다.');
		   return false;
	   }else{
		   var formData = new FormData();
		   //옵션이 있다
		   var optLength=$('.option_sel').length;
		   for(var i=0;i<optLength;i++){
			   formData.append("cartList["+i+"].prod_count", $('.option_sel:eq('+i+') input[id="count_text"]').val());
			   //alert($('.option_sel:eq('+i+') input[id="count_text"]').val());
			   formData.append("cartList["+i+"].goods_code2",$('.option_sel:eq('+i+') input[class="detail_goods_code2"]').val());
			   //alert($('.option_sel:eq('+i+') input[class="detail_goods_code2"]').val()); 
		   }
		   formData.append("goods_code", $('input[id="detail_goods_code"]').val()); 
		   formData.append("goods_price", $('input[id="detail_goods_price"]').val());
		   formData.append("goods_name", $('input[id="detail_goods_name"]').val());
		   formData.append("id", $('input[id="detail_id"').val());
		   //alert($('input[id="detail_goods_code"').val()+","+$('input[id="detail_goods_price"').val()+","+
			   //$('input[id="detail_goods_name"').val()+","+$('input[id="detail_id"').val());
		   //옵션없다
		   if(optLength<1){
		   	  	//alert($('input[class="detail_total_count"').val());
		   	  	formData.append("total_count", $('input[class="detail_total_count"').val());
		      	}
		   $.ajax({
			   type:'POST',
			   dataType:'text',
			   url:'cartIns.do',
			   data:formData,
			   cache:false,
			   asynsc:true,
			   contentType:false,
			   processData:false,
			   success:function(){
				   //alert("장바구니 넣기 성공");
				   $('#cartInsModal').css('display','block');
			   },
			   error:function(){
				   //alert('error');
			   }

		   });
	   }
	}//end cartIns

function cart_close_modal(){
	   $('#cartInsModal').css('display','none');
}

function RevDel(e){
	var num = $(e).attr('name');
	var goods_code = $('#goods_code').val();
	
	var pageMove = 'detail.do?code=' + goods_code;
	//alert('num : ' + num + ', goods_code : ' + goods_code);
	//alert(location);
	
	$.ajax({
	      type:'POST',
	      dataType:'text',
	      url:'revDel.do',
	      data:'review_num=' + num + '&code=' + goods_code + '&location=' + location, 
	      success:function(res){
	    	 console.log(res);
	    	 if(res){
	    		 $('.tj').empty();
	    		 $('.tj').html(res);
	    	 }else{
	    		 location.href=pageMove;
	    	 }
	      },
	      error:function(){
	    	  //alert('error');
	      }
	});
}

function RevUpt(e){
	var num = $(e).attr('name');
	var goods_code = $('input[name=goods_code]').val();
	var pageMove = 'revUpt.do?review_num=' + num;
	
	location.href = pageMove;
}