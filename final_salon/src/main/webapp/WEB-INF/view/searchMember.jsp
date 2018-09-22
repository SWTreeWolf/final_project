<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/searchmem.css" />
<script type="text/javascript">
	$(document).ready(function(){
		var pageMove = 'resultmove.do';
		
		$(document).keydown(function(key) {
			if (key.keyCode == 13){
				location();
			}
		});
		
		$('#search_mem_btn').on('click',function(e){
			e.preventDefault();
			location();
		})
		
		function location(){
			$.ajax({
				type :'POST',
				dataType:'json',
				url:'resultsearch.do',
				data:'name='+$('#name').val()+'&email='+$('#email').val()+'&id='+$('#signin_id').val(),
				success:function(res){
					console.log(res);
					if(res.length==0){
						alert('존재하지 않습니다!');
					}else{
						$('#search_mem_form').submit();
					}
				},
				error:function(error){
					alert('존재하지 않습니다!'); 
				}
			});
		}
	})
</script>
</head>
<body>
	<form action="resultmove.do" id="search_mem_form" method="post">
		<div class="loginWrap">
	        <div class="searchWrap">
	        	<c:choose>
	        		<c:when test="${division eq 'id'}">
		        		<p>아이디 찾기</p>
	        		</c:when>
	        		<c:when test="${division eq 'pass'}">
	        			<p>비밀번호 찾기</p>
	        		</c:when>
	        	</c:choose>
	            <input type="text" id="name" name="name" placeholder="이름입력">
	            <input type="text" id="email" name="email" placeholder="이메일주소 입력">
	            <c:if test="${division eq 'pass'}">
	            <input type="text" id="signin_id" name="id" placeholder="아이디 입력"/>
	            </c:if>

	            <div class="button_search_mem">
	                <a href="#" class="type1" id="search_mem_btn">확인</a>
	            </div>
	        </div>
	    </div>
    </form>
    
</body>
</html>