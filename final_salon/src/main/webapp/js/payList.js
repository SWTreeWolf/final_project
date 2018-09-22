$(document).ready(function() {
	$(document).keydown(function(key) {
		if (key.keyCode == 13) {
			pay_list();
		}
	});
	
	$('#excel_down_btn').on('click', function() {
		$('#e_form').submit();
	});

	if($('#from').ready()[0] != null){
		var dateFormat = "yy-mm-dd", from = $("#from").datepicker({
			changeMonth : true, 
			dateFormat : "yy-mm-dd",
			monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			monthNamesShort : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#to").datepicker({
			changeMonth : true,
			dateFormat : "yy-mm-dd",
			monthNames : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			monthNamesShort : ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
		})
	}
	function getDate(element) {
		var date;
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}
		return date;
	}
	
	$('#all_day').on('click',function(){
		$('#from').val('');
		$('#to').val('');
	})
	
	$('#one_day').on('click',function(){
		var today = getToday();
		
		$('#from').val(today);
		$('#to').val(today);
	})
	
	$('#one_week').on('click',function(){
		var today = getToday();
		var week;
		if($('#day_sign').val() == '-'){
			week = lastWeek();
			$('#from').val(week);
			$('#to').val(today);
		}else{
			week = nextWeek();
			$('#from').val(today);
			$('#to').val(week);
		}
	})
	
	$('#one_month').on('click',function(){
		var today = getToday();
		var month;
		if($('#day_sign').val() == '-'){
			month = lastMonth();
			$('#from').val(month);
			$('#to').val(today);
		}else{
			month = nextMonth();
			$('#from').val(today);
			$('#to').val(month);
		}
	})
	
	$('#one_year').on('click',function(){
		var today = getToday();
		var year;
		if($('#day_sign').val() == '-'){
			year = lastYear();
			$('#from').val(year);
			$('#to').val(today);
		}else{
			year = nextYear();
			$('#from').val(today);
			$('#to').val(year);
		}
	})
	
	$('#payListshow').on('click',function(){
		pay_list()
	});
		
});

function pay_list(){
	var keyword = $('#e_form > #keyword').val();
	var keyword_txt = $('#e_form > #keyword_txt').val();
	$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'payListShow.do',
			data : {
				from : $('input[name=from]').val(),
				to : $('input[name=to]').val(),
				pv : 0,
				keyword : keyword,
				keyword_txt : keyword_txt
			},success :function(res){
				$('#showPayList').empty();
				$('#showPayList').append(res);
			}
	});
}

function pay_num_list(num){
	$('#pageNum').val(num);
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'payListShow.do',
		data : {
			from : $('input[name=from]').val(),
			to : $('input[name=to]').val(),
			currentPage : num
		},success :function(res){
			$('#showPayList').empty();
			$('#showPayList').append(res);
		}
	});
}

function pay_num_list2(num,keyword,txt){
	$('#pageNum').val(num);
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'payListShow.do',
		data : {
			from : $('input[name=from]').val(),
			to : $('input[name=to]').val(),
			keyword : keyword,
			keyword_txt : txt,
			currentPage : num
		},success :function(res){
			$('#showPayList').empty();
			$('#showPayList').append(res);
		}
	});
}

function pay_state_change(func){
	var num = $(func).parent().siblings('td:nth-of-type(1)').html()
	var prod = $(func).parent().siblings('td:nth-of-type(2)').html()
	var color = $(func).parent().siblings('td:nth-of-type(3)').html()
	var state = $(func).html()
	var page_num = $('#pageNum').val();
	var keyword = $('#e_form > #keyword').val();
	var keyword_txt = $('#e_form > #keyword_txt').val();
	//alert(prod + ',' + color + ',' + state)
	$.ajax({
		type : 'POST',
		dataType : 'text',
		url : 'payStateUpdate.do',
		data : {
			pay_num : num,
			pay_state : state,
			goods_color : color,
			prod_name : prod
		},success :function(res){
			if(keyword_txt != ""){
				//alert(num + ',' + keyword + ',' + keyword_txt);
				pay_num_list2(page_num,keyword,keyword_txt);
			}else{
				//alert(page_num);
				pay_num_list(page_num);
			}
			
		}
	});
}

function fn_leadingZeros(n, digits) {
	  var zero = '';
	  
	  n = n.toString();

	  if (n.length < digits) {
	    for (var i = 0; i < digits - n.length; i++){ zero += '0'; }
	  }

	  return zero + n;
}

function getToday(){
	var date = new Date();
	var nowDate = date.getFullYear() + '-' + fn_leadingZeros(date.getMonth() + 1, 2) + '-' + fn_leadingZeros(date.getDate(), 2);
	return nowDate;
}

function lastWeek(){
	var before = new Date();
	before.setDate(before.getDate() - 7);
 
	var y = before.getFullYear();
	var m = before.getMonth() + 1;
	var d = before.getDate();
	
	if(m < 10) { m = "0" + m; }
	if(d < 10) { d = "0" + d; }

	return before = y + "-" + m + "-" + d;
}

function nextWeek(){
	var nextDate = new Date();
	nextDate.setDate(nextDate.getDate() + 7);
 
	var y = nextDate.getFullYear();
	var m = nextDate.getMonth() + 1;
	var d = nextDate.getDate();
	
	if(m < 10) { m = "0" + m; }
	if(d < 10) { d = "0" + d; }

	return nextDate = y + "-" + m + "-" + d;
}

function lastMonth(){
	var before = new Date();
	before.setMonth(before.getMonth() - 1);
 
	var y = before.getFullYear();
	var m = before.getMonth() + 1;
	var d = before.getDate();
	
	if(m < 10) { m = "0" + m; }
	if(d < 10) { d = "0" + d; }

	return before = y + "-" + m + "-" + d;
}

function nextMonth(){
	var nextDate = new Date();
	nextDate.setMonth(nextDate.getMonth() + 1);
 
	var y = nextDate.getFullYear();
	var m = nextDate.getMonth() + 1;
	var d = nextDate.getDate();
	
	if(m < 10) { m = "0" + m; }
	if(d < 10) { d = "0" + d; }

	return nextDate = y + "-" + m + "-" + d;
}

function lastYear(){
	var before = new Date();
	before.setFullYear(before.getFullYear() - 1);
 
	var y = before.getFullYear();
	var m = before.getMonth() + 1;
	var d = before.getDate();
	
	if(m < 10) { m = "0" + m; }
	if(d < 10) { d = "0" + d; }

	return before = y + "-" + m + "-" + d;
}

function nextYear(){
	var nextDate = new Date();
	nextDate.setFullYear(nextDate.getFullYear() + 1);
 
	var y = nextDate.getFullYear();
	var m = nextDate.getMonth() + 1;
	var d = nextDate.getDate();
	
	if(m < 10) { m = "0" + m; }
	if(d < 10) { d = "0" + d; }

	return nextDate = y + "-" + m + "-" + d;
}