<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="container">
	<div class="content myetdArea">
		<div class="myetdCon">
			<form id="profile_form" action="updateProfile.do" method="post">
				<div class="joinWrap">
					<div class="joinCont mt50">
						<div class="joinForm mt10">
							<ul>
								<li>
									<div class="questBox writeTit">이름</div>
									<div class="ansBox">
										<input type="text" class="antxt"
											value="${sessionScope.dto.name}" readonly>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">생년월일</div>
									<div class="ansBox">
										<fmt:parseDate value="${sessionScope.dto.date_of_birth}"
											var='regDate' pattern="yyyy-MM-dd" />
										<input type="text" class="antxt"
											value='<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일"/>'
											readonly>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">성별</div>
									<div class="ansBox">
										<c:if test="${sessionScope.dto.gender eq 'male' or sessionScope.dto.gender eq 'M'}">
											<span class="type100">남</span>
										</c:if>
										<c:if test="${sessionScope.dto.gender eq 'female' or sessionScope.dto.gender eq 'W'}">
											<span class="type100">여</span>
										</c:if>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">휴대폰 번호</div>
									<div class="ansBox">
										<div class="antxt">
											<c:set var="tel"
												value="${fn:split(sessionScope.dto.phone,'-')}" />
											<div class="telBox">
												<select name="phone_first" id="phone_first">
													<option value="010"
														<c:if test="${tel[0] eq 010}">selected</c:if>>010</option>
													<option value="011"
														<c:if test="${tel[0] eq 011}">selected</c:if>>011</option>
													<option value="016"
														<c:if test="${tel[0] eq 016}">selected</c:if>>016</option>
													<option value="017"
														<c:if test="${tel[0] eq 017}">selected</c:if>>017</option>
													<option value="018"
														<c:if test="${tel[0] eq 018}">selected</c:if>>018</option>
													<option value="019"
														<c:if test="${tel[0] eq 019}">selected</c:if>>019</option>
												</select> <span>-</span> <input type="text" placeholder=""
													class="w240" id="phone_middle" name="phone_middle"
													value="${tel[1]}" maxlength=4><span>-</span> <input
													type="text" placeholder="" class="w240" id="phone_last"
													name="phone_last" value="${tel[2]}" maxlength=4>
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">닉네임</div>
									<div class="ansBox">
										<input type="text" placeholder="닉네임" name="nickname"
											id="cstmNick" value="${sessionScope.dto.nickname}"> <span
											class="button2"><a href="#" class="type5 middle">중복확인</a></span>
										<p class="error_txt" id="errCstmNick"></p>
									</div>
								</li>
								<c:if test="${sessionScope.dto.mem_group eq 'salon'}">
								<li>
									<div class="questBox writeTit">비밀번호</div>
									<div class="ansBox">
										<input type="password" id="pswd" name="password">
										<p class="error_txt" id="errPswd"></p>
										<span class="pwinfo">(영문, 숫자, 특수문자를 조합한 6~16자리)</span>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">비밀번호 확인</div>
									<div class="ansBox">
										<input type="password" id="pswd2" name="pswd2">
										<p class="error_txt" id="errPswd2"></p>
									</div>
								</li>
								</c:if>
								<li>
									<div class="questBox writeTit">주소</div>
									<div class="ansBox">
										<div class="addressBox">
											<input type="text" placeholder="지번입력" id="addr0"
												name="zipcode" value="${sessionScope.dto.zipcode}"
												readonly="readonly"> <span class="button3"> <a
												href="#" class="type4 middle">주소검색</a>
											</span> <br /> <input type="text" placeholder="주소를 입력해주세요."
												id="addr1" name="addr1" value="${sessionScope.dto.addr1}"
												readonly="readonly"> <input type="text"
												placeholder="나머지 주소를 입력해주세요." class="mt5" id="addr2"
												name="addr2" value="${sessionScope.dto.addr2}">
										</div>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">이메일</div>
									<div class="ansBox">
										<div class="mailBox">
											<c:set var="email"
												value="${fn:split(sessionScope.dto.email, '@')}" />
											<input type="text" placeholder="이메일" name="email1"
												id="email1" value="${email[0]}"> <span
												class="betweenTxt">@</span> <input type="text" id="email2"
												name="email2" value="${email[1]}" readonly="readonly">
											<select name="btnSelectEmail" id="btnSelectEmail">
												<option value="naver.com"
													<c:if test="${email[1] eq 'naver.com'}">selected</c:if>>naver.com</option>
												<option value="nate.com"
													<c:if test="${email[1] eq 'nate.com'}">selected</c:if>>nate.com</option>
												<option value="gmail.com"
													<c:if test="${email[1] eq 'gmail.com'}">selected</c:if>>gmail.com</option>
												<option value="직접입력"
													<c:if test="${email[1]!='gmail.com' && email[1]!='nate.com'
											&& email[1]!='naver.com'}">selected</c:if>>직접입력</option>
											</select>
										</div>
									</div>
								</li>
							</ul>
						</div>

						<div class="btnCenter mt30">
							<span class="button1"><a href="mypage.do"
								class="type4 large">취소</a></span> <span class="button1"> <a
								href="#" class="type1 large" id="profileSubmit">완료</a></span>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>