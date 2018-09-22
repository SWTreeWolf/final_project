<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	
</script>
</head>
<body>
	<div id="ad_searchpay_wrap">
	<div id="ad_searchpay-top">
	<h1>주문조회</h1>
	</div>
	
		<input type="hidden" id="pageNum" value="1" />
		<div id="day_button_wrap">
			<input type="button" id="all_day" value="전체" />
			<input type="button" id="one_day" value="1일" /> <input type="button"
				id="one_week" value="일주일" /> <input type="button" id="one_month"
				value="한달" /> <input type="button" id="one_year" value="1년" /> <select
				id="day_sign">
				<option value="+">+ (이후)</option>
				<option value="-">- (이전)</option>
			</select>
		</div>

		<form action="excelDownload.do" id="e_form">
			<input type="text" id="from" name="from" autocomplete=off> <span>~</span>
			<input type="text" id="to" name="to" autocomplete=off>
			<select name="keyword" id="keyword">
				<option value="all">전체</option>
				<option value="id">아이디</option>
				<option value="rec_name">수령자 이름</option>
			</select>
			<input type="text" id="keyword_txt" autocomplete=off>
			<input type="button" value="저장" id="excel_down_btn" />
			<input type="button" value="확인" id="payListshow"/>
		</form>
		<div id="showPayList"></div>
	</div>
</body>