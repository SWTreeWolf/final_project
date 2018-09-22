<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div class="lnb">
				<h2 class="lnbTit">
					<a href="mypage.do"><img
						src="images/mypage.gif" alt="MY PAGE" onclick=""></a>
				</h2>
				<ul class="lnbList">
					<li id="lnb01"><a href="profile.do">개인정보관리</a>
						<ol>
						    <li><a href="profile.do">회원정보수정</a></li>
							<c:if test="${sessionScope.dto.id ne 'admin' and sessionScope.dto.mem_group eq 'salon'}">
		                     	<li><a href="member_unlink_site.do">회원탈퇴</a></li>
                  			</c:if>
                  			<c:if test="${sessionScope.dto.mem_group ne 'salon'}">
                  				<li><a href="#" onclick="unlinkfunc(this)">회원탈퇴</a></li>
                  			</c:if>
						</ol>
					</li>
					<li><a href="my_orderList.do">주문/배송 조회</a>
						<ol>
							<li id="lnb0201"><a
								href="my_orderList.do">주문/배송</a></li>		
						</ol></li> 
					<li><a href="#">나의 게시물 조회</a>
						<ol>
							<li id="lnb0301"><a href="my_post.do">나의 리뷰/커뮤니티</a></li>
							<li id="lnb0302"><a href="my_email.do">나의 Q/A 메일</a></li>
					</ol>
					</li>
	
					
				</ul>
			</div>
			<!-- end lnb -->