$(document).ready(function(){

$('.my_oList-delivery-end').on('click',function(){
	var end=$(this);
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url:'my_delivery_chk.do',
		data:"pay_num="+$(this).next().val(),
		success : function(res){
			if(res>0){
				$(end).siblings('.my_oList-state-text').text('배송완료');
				$(end).css('display','none');
			}
		}
	});

}); // end .my_oList-delivery-end click

$('.my_oList-refund').on('click',function(){
	var end=$(this);
	$.ajax({
		type : 'POST',
		dataType : 'json',
		url:'my_return_chk.do',
		data:"pay_num="+$(this).parent().children('input[name=pay_num]').val(),
		success : function(res){
			if(res>0){
				$(end).siblings('.my_oList-state-text').text('반품요청중');
				$(end).css('display','none');
			}
		}
	}) // end ajax
});

});