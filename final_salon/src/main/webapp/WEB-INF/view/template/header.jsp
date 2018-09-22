<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="gnbContainer">
	<a id="MOVE_TOP_BTN" href="#">TOP</a>
	<!-- 최근본 상품 -->
	<div id="leftSide">
		<div id="left_zzim">
			<div class="recTit">
				<a href="#" id="ford_list">최근본상품</a> <span id=recentCnt></span>
			</div>
			<div id="cookie_list">
				<ul></ul>
				<!-- 본 상품이 뿌려질 부분  -->
		
				<div id="paging">
					<a class="btn_prev" style="cursor: pointer">이전</a> <span
						id="currentPage"></span> <span id="totalPageCount"></span> <a
						class="btn_next" style="cursor: pointer">다음</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 끝 -->
	<div id="head_container">
		<div id="head_logo">
			<a href="index.do"> <img src="images/logo.png" alt="로고" />
			</a>
		</div>
		<div id="head_menu">
			<ul>

				<li><c:if test="${empty sessionScope.dto }">
						<a href="signin.do">로그인</a>
					</c:if> <c:if test="${!empty sessionScope.dto }">
						<a href="signout.do">로그아웃</a>
					</c:if></li>
				<li><a href="mypage.do">마이페이지</a></li>
				<c:if test="${empty sessionScope.dto }">
					<li><a href="signup_detail.do">회원가입</a></li>
				</c:if>
				<c:if test="${!empty sessionScope.dto }">
					<c:if test="${sessionScope.dto.id == 'admin' }">
						<li><a href="ad_proList.do">관리자 페이지</a></li>
					</c:if>
				</c:if>

				<c:if test="${!empty sessionScope.dto }">
					<li><a href="cart.do?id=${sessionScope.dto.id}">장바구니</a></li>
				</c:if>
				<li><a href="customer.do">고객센터</a></li>
			</ul>
		</div>

		<div class="global_search clearfix">
         <div class="searchGroup globalSearch">
            <div class="searchGroup">
               <form action="search.do" name="main_Srch">
                  <input type="text"  name="data"
                     class="input_search glb_input" />
                  <button onclick="javascript:main_Srch.submit();" type="button" id="searchAll" title="전체검색"
                     class="btn" style="cursor: pointer">
                     <img src="images/search.PNG" alt="전체검색" />
                  </button>
               </form>
            </div>
         </div>

      </div>
   
	</div>
	<!-- head_container -->


	<div class="inBox">
		<div class="category_btn">
			<a href="#" id ="cateBTN">카테고리<img src="images/down.png" /></a>
		</div> 

		<div class="gnb_menu" id="dvHeadGnbMenu">
			<ul class="clearfix">
				<li id="liGnb_BEST"><a href="bestpage.do">베스트<span class="line"></span></a></li>
				<li id="liGnb_NEW"><a href="newpage.do">신제품<span
						class="line"></span></a></li>
				<li id="liGnb_PIXLEE"><a href="insta.do">#인스타픽<span
						class="line"></span></a></li>
				<li id="liGnb_EVENT"><a href="event.do">이벤트<span
						class="line"></span></a></li>
				<li id="liGnb_COMU"><a href="commu.do">커뮤니티<span class="line"></span></a></li>
			</ul>
		</div>

		<!-- <div class="membershipArea">
			<a
				href="http://www.etudehouse.com/kr/ko/jsp/front/cstm_center/cstm_center_memship_tab2.jsp"
				onclick="fnOnclickTrack('GNB','MEMBERSHIP');">MEMBERSHIP</a>
		</div> -->
		<!-- end membershipArea -->
	</div>
	<!-- end inbox -->
	<!-- 카테고리 -->
	<div class="inBox_ctgr">
		<div class="categoryWrap js-parent">
			<div class="tab_group">
				<ul class="lineTab js-tab">
					<li class="on"><a href="#">제품 유형별</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //카테고리 -->

</div>