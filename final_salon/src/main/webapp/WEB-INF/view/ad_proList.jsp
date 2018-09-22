<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>



<div id="proList-wrapper">
  <div id="proList-content">
	<div id="proList-sub">
	<h1>상품리스트</h1>     
    </div>
    <div id="proList-search">
    <form id="list_form" method="post" action="ad_proListSearch.do">
      <div id="searchByGroup">
    
      <label class="search_sub">카테고리</label>
           <label>그룹1:</label>
  <input type="text" id="goods_group1" name="goods_group1" value="${regiDTO.goods_group1}">
      <label>그룹2:</label>
       <input type="text" id="goods_group2" name="goods_group2" value="${regiDTO.goods_group2}"/>
      </div>
      <div id="searchByCount"><label class="search_sub">재고여부</label>
        <input id="countChk" name="total_count" type="number" value="${regiDTO.total_count}"/>개 이하
      </div>
      <div id="searchByName">
      <label class="search_sub">검색조건</label><select id="searchBy" name="searchBy"><option value=
"상품이름">상품이름</option><option value="상품코드">상품코드</option>
      </select><input id="searchPro" name="search" type="text" value="${regiDTO.search}"/>
      
      <input type="hidden" id="currentPage" name="currentPage" value="1"/>   
      </div><!--end searchByName-->
      <input id="list_search_btn" type="submit" value="검색"/>
          </form>
    </div><!-- end proList-search -->
    <div id="proTable-wrapper">
    	
    	<div id="proTable-top"><p id="proTable-count">총 ${pdto.totalCount}개의 상품</p></div>
    	
      <table id="proTable">   <tr><th>상품코드</th> <th><img width="25px" height="25px"src="https://static.thenounproject.com/png/60313-200.png"/></th><th>상품이름</th>
          <th>상품분류</th><th>가격</th><th>수량</th><th>상태</th><th>기능</th>
        </tr>
     <c:if test="${pdto.totalPage>0}">
      <c:forEach var="dto" items="${requestScope.rlist}">
        <tr><td>${dto.goods_code}</td><td><img class="ad_proList-thumnail" src="${dto.goods_main}"/></td><td>${dto.goods_name}</td>
          <td>${dto.goods_group1}/${dto.goods_group2}</td><td>${dto.goods_price}</td><td>${dto.total_count}</td><td>판매중</td>
          <td><a class="ad_proViewBtn" href="ad_proListView.do?goods_code=${dto.goods_code}">상세보기</a><a class="ad_proDelBtn" href="ad_delete.do?goods_code=${dto.goods_code}">삭제</a></td> 
        </tr>
        </c:forEach>
   	</c:if>
   	 <c:if test="${pdto.totalPage<1}">
   	 <tr><td colspan="8">상품이 없습니다</td></tr>
   	 </c:if>
      </table>
    </div><!--end proTable-wrapper-->
    
    
    <!-- 그냥페이지 -->
    <c:if test="${searchChk==null}">
    <div class="proList-page">
    <a <c:if test="${pdto.startPage<=1}">class="nback"</c:if><c:if test="${pdto.startPage>1}">class="back" href="ad_proList.do?currentPage=${pdto.startPage-pdto.blockPage}" </c:if>>⍇</a>
    <c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}"> 
    <a class="ad_page" href="ad_proList.do?currentPage=${i}" <c:if test="${i==pdto.currentPage}">style="background:hotpink"</c:if> >${i}</a>
    </c:forEach>
       <c:forEach var="e" begin="${pdto.endPage+1}" end="${pdto.startPage+pdto.blockPage-1}"><a class="nad_page">${e}</a></c:forEach>
 <a <c:if test="${pdto.totalPage <= pdto.endPage}">class="nforward"</c:if><c:if test="${pdto.totalPage > pdto.endPage}">class="forward" href="ad_proList.do?currentPage=${pdto.endPage+1}" </c:if> >⍈</a>

    </div>
    </c:if>
    
    <!-- 검색페이지 -->
    <c:if test="${searchChk!=null}">
     <div class="proList-page">
    <a  <c:if test="${pdto.startPage<=1}">class="nback"</c:if> <c:if test="${pdto.startPage>1}">class="back" href="#" onclick="searchPage(${pdto.endPage+1})"</c:if>>⍇</a>
    <c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}"> 
    <a class="ad_page" href="#" onclick="searchPage(${i})" <c:if test="${i==pdto.currentPage}">style="background:hotpink"</c:if> >${i}</a>
    </c:forEach>
<c:forEach var="e" begin="${pdto.endPage+1}" end="${pdto.startPage+pdto.blockPage-1}"><a class="nad_page">${e}</a></c:forEach>
    <a <c:if test="${pdto.totalPage <= pdto.endPage}">class="nforward"</c:if><c:if test="${pdto.totalPage > pdto.endPage}">class="forward" href="#" onclick="searchPage(${pdto.startPage-1})" </c:if>>⍈</a>

    </div>
    </c:if>
    
  </div><!--end proList-content-->
</div><!--end proList-wrapper-->
</body>
