<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css" href="css/reviewWrite.css" />
</head>

<script type="text/javascript">
$(document).ready(function() {
	$('.a').on('click',function(e) {
		e.preventDefault();
		$('.a').children('img').attr('src','images/empheart.png');
		var her = $('.a').index(this) + 1; //index -> 순서..?갯수..? a클래스에서 내가(this) 몇번째인지
		$('.a').children('img:lt(' + her + ')')
				.attr('src','images/heart4.png'); //attr 어트리부트 속성 //find로도 찾을수 있음
		$('#rate').val(her);
	});
	
	$('#reset').on('click',function(e){
		e.preventDefault();
		var pagemove = 'detail.do?code=' + $('#goods_code').val();
		location.href= pagemove;
	});
	
	$('.xx').on('click',function(){
		var pagemove = 'detail.do?code=' + $('#goods_code').val();
		location.href= pagemove;
	})

				/* $('.a').on('mouseout',function(){
					$('.a').children('img').attr('src','images/empheart.png');
				}); */

			/* 	$('.a').on(
						'click',
						function(e) {
							e.preventDefault();
							$('.a').children('img:lt(' + her + ')').attr('src',
									'images/heart4.png');
							var her = $('.a').index(this) + 1;
							$('#rate').val(her);
						}); */

			});
</script>

<body>
	<div class="images">
		<img src="images/back.jpg" />
	</div>

	<form action="updatePro.do" method="POST">
	<input type="hidden" id="goods_code" name="goods_code" value="${rdto.goods_code }"/>
		<div class="wrap">
			<div class="line"></div>

			<div class="review">
				<h4>리뷰 & 팁 작성하기</h4>
			</div>
			<div class="xx">
				<h4>X</h4>
			</div>
			<div id="clear"></div>
			<div class="line2"></div>

			<div class="line3"></div>
			<div id="goods_name">${prod.goods_name}</div>
			<!-- <div id="love"><img src="images/heart.jpg"></div> -->

			<div id="heart">
				<c:forEach begin="1" end="${rdto.rate}">
					<a href="#" class="a"><img src="images/heart4.png" class="empheart"></a>
				</c:forEach>
				<c:forEach begin="1" end="${5-rdto.rate}">
					<a href="#" class="a"><img src="images/empheart.png" class="empheart"></a>
				</c:forEach>
			</div>

			<input type="hidden" name="rate" id="rate" value="1" />

			<div class="clear2"></div>
			<div class="sub">제품을 평가해주세요!</div>
			<div class="line3"></div>
			<div class="opWrap">
				<div id="opt">옵션</div>
				<div class="line4"></div>
				
				
				<select class="option1" name="goods_option">
				<c:if test="${!empty odto }">
				<option>옵션을 선택해주세요</option>
				
				<c:forEach items="${odto}" var="odto">
						<option value ="${odto.goods_color}">${odto.goods_color }</option>
					</c:forEach>
				</c:if>
				<c:if test="${empty odto }">
					<option>옵션이 없는 제품 입니다.</option>
				</c:if>
				</select>
				
			</div>

			<div class="line3"></div>

			<div>
				<p id="sub">제목
				<c:if test="${empty rdto}">
					<p>
						<input type="text" name="sub" id="subject"
							placeholder="최대 30자까지 입력 가능합니다" />
				</c:if>
				<c:if test="${!empty rdto}">
					<p>
						<input type="text" name="sub" id="subject" value="${rdto.sub}"
							placeholder="최대 30자까지 입력 가능합니다" />
				</c:if>
			</div>

			<div class="line3"></div>

			<div>
				<p id="content">내용</p>
				<c:if test="${empty rdto}">
				<textarea cols="15" rows="8" id="textarea" name="review_content"
					placeholder="내용을 작성해주세요.">
    	    	</textarea>
    	    	</c:if>
    	    	<c:if test="${!empty rdto}">
    	    	<textarea cols="15" rows="8" id="textarea" name="review_content"
					placeholder="내용을 작성해주세요.">
					${rdto.review_content}
    	    	</textarea>
    	    	</c:if>
			</div>

			<div class="clear2"></div>

			<div class="line5"></div>

			<div class="register">
				<input type="reset" value="취소" id="reset" /> 
				<input type="submit" value="등록하기" id="submit" name="submit" />
			</div>

			<div class="line6"></div>

			<div class="line7"></div>
			<div class="cont">
				<p>
					＊타인의 글 도운 및 올바르지 않은 리뷰작성의 경우, 게시판 성격과 관련없는 게시물은 임의로 삭제될 수 있으며 적립된
					진주알의 3배만큼 차감될 수 있습니다. <br />
				<div class="line8"></div>
				＊저작권등 다른 사람의 권리를 침해하거나 게시판 성격과 관련 없는 성격의 게시물은 임의로 삭제 될 수 있습니다.
				</p>
			</div>
			<input type="hidden" name="review_num" value="${rdto.review_num}" />
		</div>
	</form>
</body>
</html>