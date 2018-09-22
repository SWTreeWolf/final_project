<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

		 
<c:forEach items="${rdto}" var="list">
	<div class="wrap4"> 
	 
		<div class="wrap3">
		
			<div class="box1">
					<p id="ratee">
					<c:forEach begin="1" end="${list.rate}">
					  <img src="images/heart4.png" id="heart3" />
					</c:forEach> 
					
					<c:forEach begin="1" end="${5-list.rate}">
					<img src="images/empheart.png" id="heart3" />
					</c:forEach>
					
					</p>
					<p>${list.nickname}</p> <!-- 나중에 nickname으로 변경 -->
					<p><fmt:formatDate value="${list.chk}" pattern="yyyy.MM.dd"/>
			</div>
			<!--end box1-->
                  
			<div class="box2">
				<p id="option2">${list.goods_option}</p>
				<p id="subject">[제목] ${list.sub}</p>
				<p class="plus">+더보기</p>
			</div>
			<!--end box2-->
			
			<c:if test="${sessionScope.dto.nickname eq list.nickname or sessionScope.dto.nickname eq 'admin'}"> <!-- 나중에 nickname으로 변경 -->
				<div class="box3">
					<input type="button" name="${list.review_num}" value="삭제" class="del" onclick="RevDel(this)" />
					<input type="button" name="${list.review_num}" value="수정" class="upt" onclick="RevUpt(this)"/>
				</div>
			</c:if>
			<!-- end box3 -->
		</div>
	
		<!--end wrap3-->
		
		<div class="con">
			${list.review_content}
		</div>
		
		<div class="wrap-line"></div>
	</div>
</c:forEach>
			
<c:if test="${pv.startPage > 1 }">
<a href="javascript:listReply('${pv.startPage - pv.blockPage}')"><span>이전</span></a>
</c:if>

<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
	<a href="javascript:listReply('${i}')"><span id="pagenum">${i}</span></a>
</c:forEach>

<c:if test="${pv.endPage < pv.totalPage }">
	<a href="javascript:listReply('${pv.endPage + pv.blockPage}')"><span>다음</span></a>
</c:if>
					

	<%-- <div class="wrap1">
	$('.plus').on('click', function() {
			$(this).parents('.wrap4').children('.con').slideToggle();
			 $('.con').css({"text-align : center";});
		<div class="space"></div>

		<div class="option">
			<select>
				<option>옵션선택</option>
				<option>옵션</option>
			</select> 
			<select>
				<option>최근등록순</option>
				<option>베스트순</option>
				<option>높은평점순</option>
			</select> <span id="write"><a href="reviewWrite.do" id="aa">리뷰 & 팁 작성</a></span>
		</div>

		<div class="space"></div>
		<br />
		
		<div class="hr2"></div>
		
		<c:forEach begin="0" end="5">
		<c:forEach items="${list}" var="list">
			<div class="wrap4">
			
				<div class="wrap3">
				
					<div class="box1">
						
						    <p>${list.num}</p>
							<p id="ratee">
							<c:forEach begin="1" end="${list.rate}">
							  <img src="images/heart4.png" id="heart3" />
							</c:forEach> 
							
							<c:forEach begin="1" end="${5-list.rate}">
							<img src="images/empheart.png" id="heart3" />
							</c:forEach>
							
							</p>
							<p>${list.id}</p>
							<p><fmt:formatDate value="${list.chk}" pattern="yyyy.MM.dd"/>
					</div>
					<!--end box1-->
                    
					<div class="box2">
						<p id="option2">옵션 : BR416 머슬마니아</p>
						<p id="subject"><a href="revView.do?num=${list.num}">${list.sub}</a></p>
						<p class="plus">+더보기</p>
					</div>
					
					<!--end box2-->
					
				</div>
			
				<!--end wrap3-->
				
				<div class="con">
					${list.revcon}
				</div>
				
				<div class="wrap-line"></div>
			</div>
			</c:forEach>
			<!--wrap4-->
		

		<c:if test="${pv.startPage > 1 }">
			<a href="table.do?currentPage=${pv.startPage - pv.blockPage}"><span>이전</span></a>
		</c:if>
		
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<a href="table.do?currentPage=${i}"><span id="pagenum">${i}</span></a>
		</c:forEach>
		
		<c:if test="${pv.endPage < pv.totalPage }">
			<a href="table.do?currentPage=${pv.endPage + pv.blockPage}"><span>다음</span></a>
		</c:if>

	</div> --%>
