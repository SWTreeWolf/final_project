<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here^^ here^^ here^^</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<div id="my_oView-wrapper">
<div id="my_oView-content">
<div id="my_oView-top">
<fmt:parseDate value="20150702030405" pattern="yyyyMMddHHmmss" var="sample" scope="page"/>
<h1><img id="my_oList-top-img2" src="images/heart3.png" style="margin-right: 20px;">주문상세조회<img id="my_oList-top-img2" src="images/heart3.png"/></h1>
<table id="my_oView-top-table">
<tr><th>주문일</th><td><fmt:formatDate value="${payList[0].pay_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td><th>주문번호</th><td>${payList[0].pay_num}</td></tr>
</table>

</div><!-- end my_oView top -->

<div id="my_oView-table">
<h3>온라인 쇼핑 상품(수량:<span style="color:hotpink">${payList.size()}개</span>)</h3>
<table id="my_oView-table-table">
<c:forEach items="${payList}" var="dto">
<tr><td><img src="${dto.goods_main}"/>
<div class="my_oView-table-content">
<p>${dto.prod_name}</p><p>${dto.pay_count}개</p><p><fmt:formatNumber value="${dto.pay_count*dto.goods_price}" type="number"/>원</p>
<c:if test="${dto.goods_color!=null}">
<p>색상: ${dto.goods_color}</p>
</c:if>
<c:if test="${dto.pay_state=='배송완료'}"><a id="my_oView-review" href="reviewWrite.do?goods_code=${dto.goods_code}&goods_name=${dto.prod_name}">리뷰 작성하기 😍</a></c:if>
</div><!-- my_oView-table-content -->
</td>
</tr>
</c:forEach>
</table>

</div><!-- end my_oView-table -->
 
 <div id="my_oView-bottom">
 <div>최종 결제금액 <fmt:formatNumber value="${payList[0].total_price}" type="number"/>원</div>

 
 <div>결제수단 </div>
<div>카카오페이</div>
 
 <div>배송 정보  </div>
<table>
<tr><th>이름</th><td>${payList[0].rec_name}</td></tr>
<tr><th>휴대폰</th><td>${payList[0].rec_phone}</td></tr>
<tr><th>주소</th><td>${payList[0].zipcode} ${payList[0].addr1} ${payList[0].addr2}</td></tr>
<tr><th>배송 메세지</th><td>${payList[0].del_sub}</td></tr>
</table>

 
 <div id="my_oView-button">
 	<a href="my_orderList.do">목록으로</a>
 </div>
  </div><!-- end my_oView-bottom -->
</div><!-- end content -->
</div><!-- end wrapper -->



</body>
</html>