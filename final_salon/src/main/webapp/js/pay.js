 
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

 