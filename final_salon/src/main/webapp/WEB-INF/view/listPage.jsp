<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/listPage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo"
	rel="stylesheet">
</head>
<body>
	<div class="list_view">
		<div class="listWrap">
			<div class="space"></div>
			<div class="newproduct">
				<h2>${title}</h2>
			</div>
			<div class="hr"></div>

			<ul class="category">
				<c:forEach items="${group2 }" var="group2">
					<li><a
						href="listPage.do?goods_group1=${group1}&goods_group2=${group2}">${group2}</a></li>
				</c:forEach>
			</ul>

			<div class="space3"></div>

			<div class="chong">
				<span id="56">총 ${productcount }개의 상품이 있습니다.</span>
			</div>

			<div class="hr"></div>
			<div class="sel_list_view">
				<dl class="sel_menu">
					<div class="sel_menu_list">상품 정렬 :</div>
					<!-- <dt class="sel_menu_list">상품 정렬</dt> -->
					<dd>
						<ul>

							<li><a
								href="listPage.do?goods_group1=${param.goods_group1}&goods_group2=${param.goods_group2}&order=row">낮은가격순</a>
							</li>
							<li><a
								href="listPage.do?goods_group1=${param.goods_group1}&goods_group2=${param.goods_group2}&order=high">높은가격순</a>
							</li>
							<li><a
								href="listPage.do?goods_group1=${param.goods_group1}&goods_group2=${param.goods_group2}&order=new">신상품</a>
							</li>

						</ul>
					</dd>
				</dl>
			</div>


			<div class="space3"></div>
			<div class="sel_list_view_line"></div>
			<div id="doubleBox">
			<c:forEach items="${product}" var="dto" begin="0" end="7" varStatus="status">
				<div class="box">
					<div class="image">
						<c:if test="${dto.sel_count >= 50}"> <!-- test는 조건을쓰는거 eq,  -->
                       		<p id="boxboxbox">베스트</p>
                   		</c:if>
						<a href="detail.do?code=${dto.goods_code }" onclick="newproduct(this)"><img
							src="${dto.picture.goods_main }" /></a>
					</div>

					<div class="text">
						<p>
							<a href="detail.do?code=${dto.goods_code }" onclick="newproduct_2(this)">${dto.goods_name}</a>
						</p>
					</div>

					<div class="color_option_view">
						<div class="opt_img">
							<c:forEach items="${dto.odto}" var="i">
								<img src="${i.goods_color_img}" />
							</c:forEach>
						</div>
						<c:if test="${dto.odtosize>6}">
						<%-- 	<c:if test="${dto.odtosize>12}">
								<div class="more_message">more ...</div>
							</c:if> --%>

							<div class="slide_view">
								<button class="slide_click">more view</button>
							</div>

						</c:if>
					</div>


					<div class="opt1">
						<c:if test="${dto.total_count != 0}">
							<div class="price">${dto.goods_price }원</div>
						</c:if>
						<c:if test="${dto.total_count == 0}">
							<div class="price">
								<span style="display: inline-block; text-decoration:line-through;">${dto.goods_price }원</span>
								<span style="display: inline-block;">품절</span>
							</div>
						</c:if>
						<div>
							<img src="images/box.jpg" id="iconbox">
						</div>
						<div class="cnt">${dto.reviewCount }</div>
						
					</div>
				</div>
				<c:if test="${status.index%2 !=0 }"></div>
					<c:if test="${status.index == productSize-1 }">
					<div>
					</c:if>
					<c:if test="${status.index != productSize-1 }">
					<div id="doubleBox">
					</c:if>
				</c:if>
			</c:forEach>
			</div>
		</div>
		<!-- end list-wrap -->

		<div class="pagenum">
			<c:if test="${pv.totalPage > 1}">
				<div class="pagenum2">
					<c:if test="${pv.startPage>1}">
						<a href="listPage.do?currentPage=${pv.startPage-pv.blockPage }">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage }">
						<a
							href="listPage.do?currentPage=${i}&goods_group1=${param.goods_group1}&goods_group2=${param.goods_group2}&order=${param.order}"><span>[${i}]</span></a>
					</c:forEach>
					<c:if test="${pv.endPage < pv.totalPage}">
						<a href="listPage.do?currentPage=${pv.endPage-pv.blockPage }">다음</a>
					</c:if>
				</div>
			</c:if>

		</div>
		<!-- <div class="space3"></div> -->
	</div>
</body>
</html>