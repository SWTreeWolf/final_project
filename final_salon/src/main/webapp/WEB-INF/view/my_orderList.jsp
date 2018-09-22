<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
<div id="my_oList-wrapper">
<div id="my_oList-content">
<div id="my_oList-top">
<h1><img id="my_oList-top-img" src="http://cdn.onlinewebfonts.com/svg/img_377642.png"/>나의 주문/배송<img id="my_oList-top-img2" src="images/heart3.png"/></h1>
</div>

<div id="my_oList-table">
<table>
<tr><th>주문일자</th><th>주문번호</th><th>주문대표상품</th><th>결제금액</th><th>주문상태</th></tr>
<c:forEach var="dto" items="${orderList}" varStatus="index">
<tr>
<td>${dto.pay_datet}</td>
<td>${dto.pay_num}</td>
<td><a href="my_orderView.do?pay_num=${dto.pay_num}">${dto.order_name }</a></td>
<td><fmt:formatNumber value="${dto.total_price}" type="number"/>원</td>
<td>
	<div class="my_oList-state">
	<input type="hidden" name="pay_num" value="${dto.pay_num}"/>
		<span class="my_oList-state-text">${dto.pay_state}</span>
		<c:if test="${dto.pay_state=='배송중'}">
			<a class="my_oList-delivery-end" href="#">수령완료</a>
			<input type="hidden" value="${dto.pay_num}"/>
		</c:if>  
		<c:if test="${dto.pay_state!='반품요청중' and dto.pay_state!='반품완료'}">    
			<a class="my_oList-refund" href="#">반품신청</a> 
		</c:if>
	</div>
</td>

</tr>
</c:forEach>
<c:if test="${orderList.size()<1}">
<td colspan="5">주문한 상품이 없습니다</td>
</c:if>
</table>
</div><!-- end my_oList-table -->
  <div id="my_oList-page">
    <a <c:if test="${pdto.startPage<=1}">class="nback"</c:if><c:if test="${pdto.startPage>1}">class="back" href="my_orderList.do?currentPage=${pdto.startPage-pdto.blockPage}" </c:if>>⍇</a>
    <c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}"> 
    <a class="ad_page" href="my_orderList.do?currentPage=${i}" <c:if test="${i==pdto.currentPage}">style="background:hotpink"</c:if> >${i}</a>
    </c:forEach>
       <c:forEach var="e" begin="${pdto.endPage+1}" end="${pdto.startPage+pdto.blockPage-1}"><a class="nad_page">${e}</a></c:forEach>
 <a <c:if test="${pdto.totalPage <= pdto.endPage}">class="nforward"</c:if><c:if test="${pdto.totalPage > pdto.endPage}">class="forward" href="my_orderList.do?currentPage=${pdto.endPage+1}" </c:if> >⍈</a>

</div><!-- end my_oList-page -->

</div><!-- end my_oList-content -->
</div><!-- end my_oList-wrapper -->



</body>
