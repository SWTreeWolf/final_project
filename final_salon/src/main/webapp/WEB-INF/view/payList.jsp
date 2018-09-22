<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${payList eq null}">
	<div id="image_wrap">
		<img src="images/found.png" />
		<p>찾을 수 없습니다</p>
	</div>
</c:if>
<c:if test="${payList ne null}">
<table border="1">
	<thead>
		<tr>
			<th>결제 코드</th>
			<th>상품 이름</th>
			<th>옵션</th>
			<th>주문 수량</th>
			<th>개당 가격</th>
			<th>결제 가격</th>
			<th>ID</th>
			<th>수령자 이름</th>
			<th>수령자 연락처</th>
			<th>수령자 주소</th>
			<th>결제 날짜</th>
			<th>주문 상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${payList}" var="payList">
			<tr>
				<td>${payList.pay_num}</td>
				<td>${payList.prod_name}</td>
				<td>${payList.goods_color}</td>
				<td>${payList.pay_count}</td>
				<td>${payList.goods_price}</td>
				<td>${payList.total_price}</td>
				<td>${payList.id}</td>
				<td>${payList.rec_name}</td>
				<td>${payList.rec_phone}</td>
				<td>(${payList.zipcode}) ${payList.addr1} ${payList.addr2}</td>
				<td><fmt:formatDate value="${payList.pay_date}"
						pattern="yyyy-MM-dd" /></td>
				<td><a href="#" onclick="pay_state_change(this)">${payList.pay_state}</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div id="pay_list_num">
	<!-- 이전 (prev) -->
	<c:if test="${pv.startPage>1}">
		<c:choose>
			<c:when test="${list_pay.id eq '' and list_pay.rec_name eq ''}">
				<span id="prev"><a id="prev_pay_page" href="#" onclick="pay_num_list(${pv.startPage-pv.blockPage},event)">이전</a></span>
				</c:when>
				<c:when test="${list_pay.id ne '' and list_pay.rec_name eq ''}">
				<span id="prev"><a id="prev_pay_page" href="#" onclick="pay_num_list2(${pv.startPage-pv.blockPage},'id','${list_pay.id}',event)">이전</a></span>
				</c:when>
				<c:when test="${list_pay.id eq '' and list_pay.rec_name ne ''}">
				<span id="prev"><a id="prev_pay_page" href="#" onclick="pay_num_list2(${pv.startPage-pv.blockPage},'rec_name','${list_pay.rec_name}',event)">이전</a></span>
				</c:when>
				<c:when test="${list_pay.id ne '' and list_pay.rec_name ne ''}">
				<span id="prev"><a id="prev_pay_page" href="#" onclick="pay_num_list2(${pv.startPage-pv.blockPage},'all','${list_pay.rec_name}',event)">이전</a></span>
				</c:when>
		</c:choose>
		
	</c:if>

	<!-- 페이지 -->
	<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
		<c:choose>
			<c:when test="${i eq pv.currentPage}"><span><p>${i}</p></span></c:when>
			<c:otherwise>
			<c:choose>
				<c:when test="${list_pay.id eq '' and list_pay.rec_name eq ''}">
				<span><a id="pay_page" href="#" onclick="pay_num_list(${i},event)">${i}</a></span>
				</c:when>
				<c:when test="${list_pay.id ne '' and list_pay.rec_name eq ''}">
				<span><a id="pay_page" href="#" onclick="pay_num_list2(${i},'id','${list_pay.id}',event)">${i}</a></span>
				</c:when>
				<c:when test="${list_pay.id eq '' and list_pay.rec_name ne ''}">
				<span><a id="pay_page" href="#" onclick="pay_num_list2(${i},'rec_name','${list_pay.rec_name}',event)">${i}</a></span>
				</c:when>
				<c:when test="${list_pay.id ne '' and list_pay.rec_name ne ''}">
				<span><a id="pay_page" href="#" onclick="pay_num_list2(${i},'all','${list_pay.rec_name}',event)">${i}</a></span>
				</c:when>
			</c:choose>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<!-- 클릭한 해당되는 레코드가 출력된다. -->

	<!-- 다음 (next)-->
	<c:if test="${pv.endPage<pv.totalPage}">
		<c:choose>
			<c:when test="${list_pay.id eq '' and list_pay.rec_name eq ''}">
			<span id="next"><a id="next_pay_page" href="#" onclick="pay_num_list(${pv.startPage+pv.blockPage},event)">이후</a></span>
			</c:when>
			<c:when test="${list_pay.id ne '' and list_pay.rec_name eq ''}">
			<span id="next"><a id="next_pay_page" href="#" onclick="pay_num_list2(${pv.startPage+pv.blockPage},'id','${list_pay.id}',event)">이후</a></span>
			</c:when>
			<c:when test="${list_pay.id eq '' and list_pay.rec_name ne ''}">
			<span id="next"><a id="next_pay_page" href="#" onclick="pay_num_list2(${pv.startPage+pv.blockPage},'rec_name','${list_pay.rec_name}',event)">이후</a></span>
			</c:when>
			<c:when test="${list_pay.id ne '' and list_pay.rec_name ne ''}">
			<span id="next"><a id="next_pay_page" href="#" onclick="pay_num_list2(${pv.startPage+pv.blockPage},'all','${list_pay.rec_name}',event)">이후</a></span>
			</c:when>
		</c:choose>
		
	</c:if>
</div>
</c:if>