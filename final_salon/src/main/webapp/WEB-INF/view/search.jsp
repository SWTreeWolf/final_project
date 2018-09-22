<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css" href="css/listPage.css" />

<div class="list_view">
	<div class="listWrap">
		<div class="space"></div>
		<div class="newproduct">
			<h2>검색 결과 입니다.</h2>
		</div>
		<div class="hr"></div>

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
						<li><a href="search.do?data=${data}&order=row">낮은가격순</a></li>
						<li><a href="search.do?data=${data}&order=high">높은가격순</a></li>
						<li><a href="search.do?data=${data}&order=new">신상품</a></li>
					</ul>
				</dd>
			</dl>
		</div>
		<div class="space3"></div>

		<div class="sel_list_view_line"></div>
		<div id="doubleBox">
			<!-- 	begin="0" end="7" -->
			<c:forEach items="${dto}" var="dto" varStatus="status">
				<div class="box">
					<div class="image">
						<a href="detail.do?code=${dto.goods_code }"><img
							src="${dto.picture.goods_main }" /></a>
					</div>

					<div class="text">
						<%-- <p>${search.goods_name}</p> --%>
						<p>
							<a href="detail.do?code=${dto.goods_code }">${dto.goods_name}</a>
						</p>
					</div>

					<div class="color_option_view">
						<div class="opt_img">
							<c:forEach items="${dto.odto}" var="i">
								<img src="${i.goods_color_img}" />
							</c:forEach>
						</div>
						<c:if test="${dto.odtosize>6}">
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
								<span
									style="display: inline-block; text-decoration: line-through;">${dto.goods_price }원</span>
								<span style="display: inline-block;">품절</span>
							</div>
						</c:if>
						<div>
							<img src="images/box.jpg" id="iconbox">
						</div>
						<div class="cnt">${dto.reviewCount }</div>
						
					</div>
				</div>
				<c:if test="${status.index%2 !=0 }">
		</div>
		<c:if test="${status.index == productSize-1 }">
			<div>
		</c:if>
		<c:if test="${status.index != productSize-1 }">
			<div id="doubleBox">
		</c:if>
		</c:if>
		</c:forEach>
	</div>
	<div class="pagenum">
		<c:if test="${pv.totalPage > 1}">
			<div class="pagenum2">
				<c:if test="${pv.startPage>1}">
					<a
						href="search.do?currentPage=${pv.startPage-pv.blockPage }&data=${data}">이전</a>
				</c:if>
				<c:forEach var="now" begin="${pv.startPage}" end="${pv.endPage }">
					<a
						href="search.do?currentPage=${now}&data=${data}&order=${param.order}"><span>[${now}]</span></a>
				</c:forEach>
				<c:if test="${pv.endPage < pv.totalPage}">
					<a
						href="search.do?currentPage=${pv.endPage-pv.blockPage }&data=${data}">다음</a>
				</c:if>
			</div>
		</c:if>

	</div>
</div>
