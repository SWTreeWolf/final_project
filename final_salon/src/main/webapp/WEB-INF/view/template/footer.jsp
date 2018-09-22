<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
	<div id="footer">
	
	<div id ="notia">
	  <div class="no">
	      <div id="not">
		      	<div id="notice_left_side">
		            <a id="gg">공지사항</a>
		        </div>     
			 	 <div class="slick-items1">
			 	   
			 	 <c:forEach var="dto" items="${noBaord}"> 
	                 <div>
	                   <c:url var="path" value="noview.do">
									<c:param name="currentPage" value="${pv.currentPage}" />
									<c:param name="num" value="${dto.noNum}" />  
					   </c:url> <a href="${path}" id="notice_slide" onclick="noview.do">${dto.noTitle}</a>
						 	<%-- 	<input id="teee" type="hidden" value="${dto.noNum}">   --%>
	                 </div>  
	             </c:forEach>  
	                </div>
	             <a id="mo" href="notice.do">더보기+</a>
	        </div>         
	  </div>
	 </div>   
	 
	   <div class="footerContainer">
      <!-- 유틸메뉴 -->
      <div class="foot_utilArea">
         <ul class='utilMenu'>
            <li><a href="gmd.do">매장찾기</a></li>
            <li></li>
            <li></li>
            <li></li>
         </ul>
      </div>

      <!-- sns -->
      <div class="foot_snsShare">
         <ul>
            <li><a href="#" title="페이스북-[새창]" ><img src="http://www.etudehouse.com/web_resource/front/images/common/foot_sns_facebook.png" alt="facebook" /></a></li>
            <li><a href="#" title="트위터-[새창]"><img src="http://www.etudehouse.com/web_resource/front/images/common/foot_sns_twitter.png" alt="twitter" /></a></li>
            <li><a href="#" title="유투브-[새창]" ><img src="http://www.etudehouse.com/web_resource/front/images/common/foot_sns_youtube.png" alt="youtube" /></a></li>
            <li><a href="insta.do" title="인스타그램-[새창]"><img src="http://www.etudehouse.com/web_resource/front/images/common/foot_sns_instagram.png" alt="instagram" /></a></li>
            <li><a href="#" title="블로그-[새창]"><img src="http://www.etudehouse.com/web_resource/front/images/common/foot_sns_blog.png" alt="blog" /></a></li>
         </ul>
      </div>

      <!-- 주소 -->
      <div class="addressArea">
         (주)salon de barbie 서울특별시 강남구 역삼동 823-25 <br/>
         <!-- 대표이사 권금주 &nbsp;&nbsp;사업자번호 135-81-05033 &nbsp;&nbsp;통신판매업신고번호 제2017-서울용산-1292<br/> -->
         고객상담 <em>1544-9970</em>(쇼핑몰) &nbsp;&nbsp;상담시간 월~금 09:00~1800(토/일공휴일 휴무) &nbsp;&nbsp;salonemall@salon.co.kr<br/>
      호스팅제공자 (주)salon de barbie <br/>
         
      
         
         <div class="inipayBox">
            저희 쇼핑몰은 고객님의 안전거래를 위해 카카오페이 거래에 대해 <em>(주)salon de barbie</em>에서 관련 법을 적용하고 있습니다.&nbsp;&nbsp;
            <!-- <a href="#" class="link" onclick='window.open("https://mark.inicis.com/mark/escrow_popup.php?no=68169&st=1413531842","mark","scrollbars=no,resizable=no,width=565,height=683"); return false;'><span>서비스가입 사실 확인</span></a> -->
         </div>

         가맹점 서비스에 대해 (주)salon de barbie는 통신판매중개 시스템의 제공자로서 통신판매의 당사자가 아닙니다.<br/>
         따라서 서비스 거래에 대한 주문, 환불 등과 관련한 책임은 각 매장에 있습니다.
      </div>

      <!-- 앱 
      <div class="appArea clearfix">
         <a href="https://play.google.com/store/apps/details?id=com.etudehouse&hl=ko" target="_blank"><img src="http://www.etudehouse.com/web_resource/front/images/common/ico_android.png" alt="안드로이드" /></a>
         <a href="https://itunes.apple.com/kr/app/id538275329" target="_blank"><img src="http://www.etudehouse.com/web_resource/front/images/common/ico_apple.png" alt="애플" /></a>
      </div-->
      <p class="copyright">Copyright ⓒ 2018 salon de barbie. All Rights Reserved.</p>   
   </div>
	<!-- 공통으로 submit 시키기 위한 폼 form 안에 input 항목을 명시 하지 말고 동적으로 넣어서 사용 -->
	<form name="commonFooterHidenForm" id="commonFooterHidenForm"></form>
	<!-- 공통 히든 프레임 -->
	<iframe name="commonFooterHidenFrame" id="commonFooterHidenFrame" width="0" height="0" frameborder="0" ></iframe>
	
</div>

