<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="mList-top">
	<h1>회원리스트</h1>
</div>

<div id="ad_mList-table">
	<div id="ad_mList-standard">
		<a href="#" onclick="standard_change('no')">등급 순으로보기 /</a> <a href="#"
			onclick="standard_change('buy_price')">총 구매금액 순으로보기 /</a> <a href="#"
			onclick="standard_change('point')">포인트 순으로 보기</a>
	</div>

	<table>
		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>닉네임</th>
			<th>등급</th>
			<th>가입한 날짜</th>
			<th style="width: 150px">주소</th>
			<th>총구매금액</th>
			<th>포인트</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${memList}" var="dto">
			<tr>
				<td class="id-td">${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.gender}</td>
				<td>${dto.date_of_birth}</td>
				<td>${dto.nickname}</td>
				<td>${dto.mem_grade}</td>
				<td><fmt:formatDate value="${dto.join_date}"
						pattern="yyyy-MM-dd" /></td>
				<td style="width: 150px">${dto.addr1}</td>
				<td><fmt:formatNumber value="${dto.buy_price}" type="number" />원</td>
				<td class="point-td"><span>${dto.point}</span> 포인트<a
					class="add_point" href="#" onclick="add_point('${dto.id}')">포인트증정</a><input
					type="hidden" class="point${dto.id}" value="${dto.point}" /></td>
				<td><c:if test="${dto.id=='admin'}">관리자</c:if> <c:if
						test="${dto.mem_group=='kakao'}">카카오</c:if> <c:if
						test="${dto.mem_group=='naver'}">네이버</c:if> <c:if
						test="${dto.mem_group=='salon'&&dto.id!='admin'}">일반회원</c:if></td>
			</tr>
		</c:forEach>
	</table>

</div>
<!-- end ad_mList-table -->
<div id="ad_mList-page">
	<a <c:if test="${pdto.startPage<=1}">class="ad_mList-nback"</c:if>
		<c:if test="${pdto.startPage>1}">class="ad_mList-back" href="#" onclick="ad_mList(${pdto.startPage-pdto.blockPage})"</c:if>>⍇</a>
	<c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
		<a class="ad_mList-ad_page" href="#" onclick="ad_mList(${i})"
			<c:if test="${i==pdto.currentPage}">style="background:hotpink"</c:if>>${i}</a>
	</c:forEach>
	<c:forEach var="e" begin="${pdto.endPage+1}"
		end="${pdto.startPage+pdto.blockPage-1}">
		<a class="ad_mList-nad_page">${e}</a>
	</c:forEach>
	<a
		<c:if test="${pdto.totalPage <= pdto.endPage}">class="ad_mList-nforward"</c:if>
		<c:if test="${pdto.totalPage > pdto.endPage}"> href="#" class="ad_mList-forward" onclick="ad_mList(${pdto.endPage+1})" </c:if>>⍈</a>

</div>
<!-- end ad_mList-page -->


