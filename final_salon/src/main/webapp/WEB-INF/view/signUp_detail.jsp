<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	Gender VARCHAR2(10), /* 성별 */*********
	Name VARCHAR2(30), /* 이름 */ *********
	Id VARCHAR2(20) NOT NULL, /* 아이디 */*********
	Nickname VARCHAR2(20), /* 닉네임 */*********
	Email VARCHAR2(50), /* 이메일 */
	Phone VARCHAR2(30), /* 핸드폰번호 */
	Password VARCHAR2(30), /* 비밀번호 */
	Date_of_Birth VARCHAR2(30), /* 생년월일 */
	*********************************************************************************
	Zipcode VARCHAR2(10), /* 우편번호 */
	addr1 VARCHAR2(50), /* 주소1 */
	addr2 VARCHAR2(50), /* 주소2 */
 -->

<form id="joinForm" name="joinForm" action="insmem.do" method="post">
	<input class="key" type="hidden" name="key"
		value="<c:out value="${key}"/>" />
	<c:if test="${empty mem_group}">
		<input class="mem_group" type="hidden" name="mem_group" value="salon">
	</c:if>
	<c:if test="${!empty mem_group}">
		<input class="mem_group" type="hidden" name="mem_group"
			value="${mem_group}">
		<input type="hidden" name="id" value="${id}">
	</c:if>
	<div id="container">
		<!-- 내용 -->
		<div class="content">
			<div class="pageTitleWrap">
				<h2 class="h2_title">회원가입하기</h2>
			</div>
			<div class="joinWrap">
				<div class="joinCont mt50">
					<div class="joinForm borTc3 mt10">
						<ul>
							<li>
								<div class="questBox writeTit">이름</div>
								<div class="ansBox">
									<c:if test="${empty map}">
										<input type="text" placeholder="이름입력" class="w240" id="cstmNm"
											name="name" value="" onclick="onlyChar(this)">
										<p class="error_txt" id="errCstmNm"></p>
									</c:if>
									<c:if test="${!empty map}">
										<span class="w240" id="name">${map.name}</span>
										<input type="hidden" name="name" value="${map.name}">
									</c:if>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">
									생년월일
								</div>
								<div class="ansBox">
									<span class="antxt"> <input type="tel"
										placeholder="1993" class="w240" id="cstmyear" name="birth_y"
										value="" maxlength=4 onclick="onlyNumber(this)"> <input type="tel"
										placeholder="12" class="w240" id="cstmmonth" name="birth_m"
										value="" maxlength=2 onclick="onlyNumber(this)"> <input type="tel"
										placeholder="31" class="w240" id="cstmday" name="birth_d"
										value="" maxlength=2 onclick="onlyNumber(this)">
									</span>
									<p class="error_txt" id="errCstmday"></p>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">성별</div>
								<div class="ansBox">
									<c:if test="${empty map}">
										<span class="ansex"> <input type="radio" name="gender"
											id="sex_m" class="gender" value="male" /><label for="sex_m">남자</label>
										</span> <span class="ansex"> <input type="radio" name="gender"
											id="sex_w" class="gender" value="female" /><label for="sex_w">여자</label>
										</span>
										<p class="error_txt" id="errCstmgender"></p>
									</c:if>
									<c:if test="${!empty map}">
										<c:if test="${map.gender eq 'M'}">
											<span class="type100">남</span>
										</c:if>
										<c:if test="${map.gender eq 'F'}">
											<span class="type100">여</span>
										</c:if>
										<input type="hidden" name="gender" value="${map.gender}">
									</c:if>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">휴대폰 번호</div>
								<div class="ansBox">
									<div class="antxt">
										<div class="telBox">
											<select name="phone_first" id="phone_first">
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select><span>-</span> <input type="text" placeholder="" class="w240"
												id="phone_middle" name="phone_middle" value="" maxlength=4 onclick="onlyNumber(this)"><span>-</span>
											<input type="text" placeholder="" class="w240"
												id="phone_last" name="phone_last" value="" maxlength=4 onclick="onlyNumber(this)">
										</div>
										<p class="error_txt" id="errCstmPh"></p>
									</div>
								</div>
							</li>
							<c:if test="${empty mem_group}">
								<li>
									<div class="questBox writeTit">
										아이디
									</div>
									<div class="ansBox">
										<input type="text" placeholder="아이디" name="id" id="cstmId">
										<span class="button1"> <a href="#" class="type5 middle">중복확인</a></span>
										<p class="error_txt" id="errCstmId"></p>
									</div>
								</li>
							</c:if>
							<li>
								<div class="questBox writeTit">
									닉네임
								</div>
								<div class="ansBox">
									<c:if test="${empty map}">
									<input type="text" placeholder="닉네임" name="nickname"
										id="cstmNick"> <span class="button2"><a
										href="#" class="type5 middle">중복확인</a></span>
									<p class="error_txt" id="errCstmNick"></p>
									</c:if>
									<c:if test="${!empty map}">
										<span class="type100">${map.nickname}</span>
										<input type="hidden" name="nickname" value="${map.nickname}">
									</c:if>
								</div>
							</li>
							<c:if test="${empty mem_group}">
								<li>
									<div class="questBox writeTit">
										비밀번호
									</div>
									<div class="ansBox">
										<input type="password" id="pswd" name="password">
										<p class="error_txt" id="errPswd"></p>
										<span class="pwinfo">(영문, 숫자, 특수문자를 조합한 6~16자리)</span>
									</div>
								</li>
								<li>
									<div class="questBox writeTit">
										비밀번호 확인
									</div>
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
											name="zipcode" value="" readonly="readonly"> <span
											class="button3"> <a href="#" class="type4 middle">주소검색</a>
										</span> <br /> <input type="text" placeholder="주소를 입력해주세요."
											id="addr1" name="addr1" value="" readonly="readonly">
										<input type="text" placeholder="나머지 주소를 입력해주세요." class="mt5"
											id="addr2" name="addr2"> <input type="hidden"
											name="homeZip1" id="homeZip1" value="">
										<p class="error_txt" id="errZip"></p>
									</div>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">이메일</div>
								<div class="ansBox">
									<div class="mailBox">
										<c:if test="${empty map}">
											<input type="text" placeholder="이메일" name="email1" id="email1">
											<span class="betweenTxt">@</span> <input type="text"
												placeholder="" id="email2" name="email2" readonly="readonly">
	
											<select name="btnSelectEmail" id="btnSelectEmail">
												<option value="">선택하세요</option>
												<option value="naver.com">naver.com</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="직접입력">직접입력</option>
											</select>
											<p class="error_txt" id="errEmail"></p>
										</c:if>
										<c:if test="${!empty map}">
											<span class="type100">${map.email1}@${map.email2}</span>
											<input type="hidden" name="email1" value="${map.email1}"/>
											<input type="hidden" name="email2" value="${map.email2}"/>
										</c:if>
									</div>
								</div>
							</li>
							<li>
								<div class="questBox writeTit">자동가입 방지</div>
								<div class="ansBox">
									<img src="<c:out value="${img_name}"/>">
									<div id="inputBox"> 
										<input type="text" placeholder="보안문자 입력" id="secretWord">
										<span class="refuse"><a href="#" class="type5" id="reload"><em></em>새로고침</a></span>
										<p class="error_txt" id="errCaptcha"></p>
									</div>
								</div>
							</li>
						</ul>
					</div>

					<div class="btnCenter mt30">
						<span class="button1"><a href="index.do"
							class="type4 large">취소</a></span> <span class="button1"> <a
							href="#" class="type1 large" id="mk14agree">완료</a></span>
					</div>
				</div>
			</div>
		</div>
		<!-- //내용 -->
	</div>
	<!-- //container -->
</form>