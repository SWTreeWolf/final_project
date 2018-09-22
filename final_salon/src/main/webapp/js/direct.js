$(document).ready(function(){
	var message = $("#dlvMsg option:selected").text();  
	var id = $('input[name=id]').val();
	var name;
	var phone;
	var zipcode;
	var addr1;
	var addr2;
	var email = $('input[name=email]').val();
	var tot_p = $('#sttlPrcId1').text(); // 총 결제가격
	var order_name = "'"+$('.prdList:eq(0)').children('.prdInfo').children('.prdDetail').children('.prdName').children().text()+"'"+ " 제품 포함  "+  $('.prdList').length+"종";

	$('#dlvMsg').on('change',function(){
		// 요청사항
		message = $("#dlvMsg option:selected").text();
	});
	var buy_point = 0;
	  // 연습끝
   IMP.init('imp05818091');
   var count = 1;
   $('#dlv1CstmInfo').on('click',function(){
	   count++;
	  if($('#dlv1CstmInfo').prop('checked')==true && count == 2){
      $('#recvNm').remove();
      $('#recvName').append('<span> : '+$('input[name=name]').val()+'</span>');
      $('#telBox').children().remove();
      $('#telBox').append('<span> : '+$('input[name=phone]').val()+'</span>');
      $('#addressBox').children().remove();
      $('#addressBox').css('display','inline');
      $('#addressBox').append('<span> : ('+$('input[name=zipcode]').val()+")"+$('input[name=addr1]').val()+" "+$('input[name=addr2]').val()+'</span>');
      $('#dlvMsg option:eq(0)').prop('selected',true); 
	  }
	   count = 0;
	   
   });
    
   $('#dlv1NewIns').on('click',function(){
	   count++;
	  if($('#dlv1NewIns').prop('checked')== true && count == 1 ){
      $('#recvName').children('span').remove();
      $('#recvName').append('<input type="text" id="recvNm" name="recvNm" maxlength="50">');
      $('#telBox').children('span').remove();
      $('#telBox').append('<div id="noOpt">'+
      '<input type="text" id="mbl1" name="mbl1" maxlength="3" />'+
         '</div><span class="betweenTxt">-</span> <input type="tel"'+
            'id="mbl2" name="mbl2" maxlength="4"'+
            'onkeydown="return onlyNumber(event)"'+
            'onkeyup="numAutoFocus(event)"> <span'+
            'class="betweenTxt">-</span> <input type="tel" id="mbl3"'+
            'name="mbl3" maxlength="4"'+
            'onkeydown="return onlyNumber(event)"'+
            'onkeyup="numAutoFocus(event)">');
      $('#addressBox').children('span').remove();
      $('#addressBox').css('display','block');
      $('#addressBox').append('<input type="text" id="addr0" name="zipcode"'+
         'onkeydown="return onlyNumber(event)"'+
            'onkeyup="removeChar(event)" readonly="readonly">'+
         '<span class="button1 grayBtn"><b href="#" class="type4 middle" id="orderZipSrch"'+
                'onclick="sample4_execDaumPostcode(); return false;">우편번호'+
                   '찾기</b></span> <input type="text" class="mt5" id="addr1"'+
            'name="addr1" value=""> <input type="text"'+
            'class="mt5" id="addr2" name="addr2" value="">');
      $('#dlvMsg option:eq(0)').prop('selected',true); 
	  }
	   count = 1;
	   
   });
  
   
   // 결제하기 눌렀을때 발생하는 이벤트
   $('#type1').click(function(){
	   if($('#u-agreeChk').prop('checked') == false){
		   alert('약관에 동의하셔야 합니다.');
		   return false;
	   }
	   else{
		   //alert("import api 실행전");
		   if($('#dlv1NewIns').is(':checked')==true){
				name = $('#recvNm').val(); 
				phone = $('#mbl1').val()+'-'+$('#mbl2').val()+'-'+$('#mbl3').val();
				zipcode = $('#addr0').val();
				addr1 = $('#addr1').val();
				addr2 = $('#addr2').val();
				
			}else{
				name = $('input[name=name]').val();
				phone = $('input[name=phone]').val();
				zipcode = $('input[name=zipcode]').val();
				addr1 = $('input[name=addr1]').val();
				addr2 = $('input[name=addr2]').val();
			}
		   //alert(zipcode+ addr1+addr2+name+phone);
		   requestPay(zipcode,addr1,addr2,name,phone,tot_p,order_name,email,id,message,buy_point);
	   }
   })
          
   // 포인트 입력
   $('#pos_point').on('change',function(e){
	   /*var tot_p = $('#sttlPrcId1').text();*/
		var point = $('#spnTotDcPrice').text();
		// alert(tot_p + ',' + point + ',' + $(this).val());
		if (Number(tot_p) < Number($(this).val())) {
			alert('금액보다 높습니다.');
		} else if (Number(point) < Number($(this).val())) {
			alert('포인트보다 높습니다.');
		} else {
			var sum = Number($('#spnDlvPrice').text())
					+ Number($('#lastOrderPrice').text())
					- Number($('#pos_point').val());
			$('#sttlPrcId1').text(sum);
			tot_p = $('#sttlPrcId1').text();
			buy_point = $('#pos_point').val();
		}
   });
});

function requestPay(zipcode,addr1,addr2,name,phone,tot_p,order_name,email,id,message,buy_point) {
	IMP.request_pay({
	    pg : 'kakao', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : order_name,
	    amount : tot_p,
	    buyer_email : email,
	    buyer_name : name,
	    buyer_tel : phone,
	    buyer_addr : addr1+" "+addr2,
	    buyer_postcode : zipcode,
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        $.ajax({
	    		type: 'POST',
	    		url : 'payNumSet.do',
	    		async: false,
	    		success :function(res){
	    			//alert("paynumset");
	    		}
	    	})
	        orderSave(zipcode,addr1,addr2,name,phone,tot_p,order_name,email,id,message);
	        memTotSave(tot_p,id,buy_point);
	        location.href='index.do';
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    //alert(msg);
	});
}	

function fnPullDownButton(obj) {
   var _group = $(obj).parents('.pull_down_group');
   if ($(_group).hasClass('open')) {
      $(_group).removeClass('open');
      $(_group).find('#pull_down_con').slideUp(150);
      $(_group).find('#pull_down_con2').slideUp(200);
      $(_group).find('#pull_down_con3').slideUp(200);  
   } else {
      $(_group).addClass('open');
      $(_group).find('#pull_down_con').slideDown(150);
      $(_group).find('#pull_down_con2').slideDown(200);
      $(_group).find('#pull_down_con3').slideDown(200);
   }
   return false;
} 

function setPaymentMethod(obj){
		$(obj).siblings('li').removeClass('on');
		$(obj).addClass('on');
}

//결제 완료시 디비 저장 함수.
function orderSave(zipcode,addr1,addr2,name,phone,tot_p,order_name,email,id,message){
	
	$('.prdList').each(function(index){  
			
			// 2개있으면 index 2번 출력됨 
			// 상품 이름
			
		    var goods_code = $(this).children('.prdImg').children('#goods_code').val();
			var prod_name = $(this).children('.prdInfo').children('.prdDetail').children('.prdName').children().text();
			var opt = $(this).children('.prdInfo').children('.prdDetail').children('.mt10').children('.opt_mt10').children('.ul10').children('.li10');  
			var opt_count = $(this).children('.prdInfo').children('.prdDetail').children('.mt10').children('.opt_mt10').children('.ul10').children('.li10').length; 
			
			// 각 제품들의 총가격
			//var total_price = $(this).children('.prdInfo').children('.prdDetail').children('.prdPrice').children('#tot_prices').text();
			// 옵션있을 때 
			if(opt_count >0){
				$.each(opt,function(index){
					// goods_code2
					var goods_code2 = $(this).children('#goods_code2').val();
					// 장바구니에서 삭제하기 위해서 보내는 cart_num
					var cart_num = $(this).children('#cart_num').val();
					// 옵션 이름
					var color_name =  $(this).children('.color_name').text();
					// 수량
					var color_cnt = $(this).children('.optName').children('.optCount').children('.opt_counts').text();
					// 개당 가격
					var color_price = $(this).children('.optPrice').children('#good_prices').val();
					// 옵션당 총 가격
					//var total_price = $(this).children('.optPrice').children('#option_price').text();
					$.ajax({
						type: 'POST',
						url : 'payAdd.do',
						async: false,
						data : {
							prod_name : prod_name,
							goods_code : goods_code,
							goods_code2 : goods_code2,
							goods_color : color_name,
							pay_count : color_cnt, 
							goods_price : color_price,
							total_price : tot_p,
							id : id,
							rec_name : name,
							rec_phone: phone,
							zipcode: zipcode,
							addr1:addr1,
							addr2:addr2,
							del_sub: message,
							cart_num : cart_num,
							order_name : order_name
						},success :function(res){
							//alert("paytable 내용 저장.");
						}
					});
				});
			}else{// 옵션 없을 때
				// 옵션 없을 때 수량
				var no_cnt = $(this).children('.prdInfo').children('.prdDetail').children('.prdCount').children('span').text();
				// 옵션 없을 때 개당 가격
				var no_price = $(this).children('.prdInfo').children('.prdDetail').children('.prdPrice').children('input[name=nogoods_price]').val();
				var cart_num = $(this).children('.prdInfo').children('.prdDetail').children('#cart_num').val();
				$.ajax({
					type: 'POST',
					url : 'payAdd.do',
					async: false,
					data : {
						prod_name : prod_name,
						goods_code : goods_code,
						pay_count : no_cnt,
						goods_price : no_price,
						total_price : tot_p,
						id : id,
						rec_name : name,
						rec_phone: phone,
						zipcode: zipcode,
						addr1:addr1,
						addr2:addr2,
						del_sub: message,
						cart_num : cart_num,
						order_name : order_name
					},success :function(res){
						//alert("paytable 내용 .");
					}
				})
			}//end else
			
	});
	
}//orderSave()

function memTotSave(tot_p,id,buy_point){
	$.ajax({
		type: 'POST',
		url : 'mem_tot_price.do',
		async: false,
		data : {
			total_price : tot_p,
			id : id,
			point : buy_point
		},success :function(res){
			
		}
	});
}
 