<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style type="text/css">  
	#data_table {  
		text-align: center; 
	} 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<script type="text/javascript">
	/* $(document).ready(function(){
		$('#goods_reg').click(function(){ 
			var form_data = $('#frm').serialize();
			$.ajax({ 
				type:'POST',
				data: form_data, 
				dataType:'json',
				url:'fomr_sub.do',
				success:function(res){
					alert('성공');
				}

			});
		});	
 
	}); */
</script>
</head>
<body> 
	<a href="order.do">주문배송관리</a> 
	<div id="data_input">
	<form id="frm" action="fomr_sub.do" method="post" enctype="multipart/form-data">
		<label>상품명:</label>
		<input type="text" id="goods_name" name="goods_name" /><br/> 
		<label>가격:</label>
		<input type="text" id="goods_price" name="goods_price" /><br/> 
		<label>그룹1:</label>
		<input type="text" id="goods_group1" name="goods_group1" /><br/> 
		<label>그룹2:</label>
		<input type="text" id="goods_group2" name="goods_group2" /><br/> 
		<label>상품내용:</label>
		<input type="text" id="goods_content" name="goods_content" /><br/> 
		<label>색상:</label>
		<input type="text" id="goods_color" name="goods_color" /><br/>  
		<label>갯수:</label>
 		<input type="text" id="goods_count" name="goods_count" /><br/> 
		<label>메인이미지:</label>
		<input type="file" id="goods_main" name="goods_main" /><br/> 
		<label>디테일이미지:</label> 
		<input type="file" id="goods_detail" name="goods_detail" /><br/> 
		<input type="submit" id="goods_reg" value="등록" />
	</form>
	</div>
	<hr />
	<div id="data_table">
		<table id="tb" border="1" width="1400px">
			<tr>
				<th>상품명</th>
				<th>가격</th>
				<th>그룹1</th>
				<th>그룹2</th>
				<th>상품내용</th>
				<th>색상</th>
				<th>갯수</th>
				<th>메인이미지</th>
				<th>디테일이미지</th>
			</tr>

		</table>
	</div>
</body>
</html>