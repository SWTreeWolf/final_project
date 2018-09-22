<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/detail.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/revView.css" />
</head>
<body>
	<input type="hidden" id="goods_code" name="goods_code" value="${dto.goods_code}" />
	<div>
		<img src="">
	</div>
    
	<div class="box">
		<div class="space"></div>
		<p>리뷰 & 팁!</p>
		<p id="xx">x</p>
		<div class="clear"></div>
		<div class="space2"></div>

		<div class="space"></div>
		
		
		<div class="cont">
		
			<p id="rate">
			<c:forEach begin="1" end="${dto.rate}">
			   <img src="images/heart4.png" id="heart3" />
			</c:forEach>
			<c:forEach begin="1" end="${5-dto.rate}">
			<img src="images/empheart.png" id="heart3" />
			</c:forEach>
			</p> <!-- rate -->
			
			<p>${dto.id}</p> <!-- id -->
			<p>&nbsp;ㅣ&nbsp;</p>
		</div>
		<div class="clear"></div>
		
		<div class="revTitle">
		  <p>제품명</p> <!-- goods code -->
		  <p>옵션</p> <!-- option -->
		</div>
		<div class="revBtn">
			<input type="button" name="${dto.review_num}" value="삭제" onclick="RevDel(this)" />
			<input type="button" name="${dto.review_num}" value="수정" onclick="RevUpt(this)" />
		</div>
		<div class="space4"></div>
		
		<div class="sub">
		  <p>[글제목]${dto.sub}</p> <!-- 제목 -->
		</div>
		
		<div class="space4"></div>
		
		<div class="content">
		  <p>[내용]${dto.review_content}</p> <!-- 내용 -->
		</div>
		
	</div>
</body>
</html>