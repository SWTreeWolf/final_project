<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<div class="loginWrap">
	<div class="loginBox">
		<div class="joinMember" id="member">
				<input type="hidden" name="method" id="method1" value="login" />
				<input type="text" name="cstmId" id="signin_id" placeholder="아이디 입력"/>
				<input type="password" name="pswd" id="pswd" placeholder="비밀번호 입력"/> <!-- onkeydown 이벤트 입력 -->
				<input type="hidden" name="returnUrl" id = "url" value="${param.returnUrl }"/>
				<div class="button_login">
					<a href="#" class="type1" id="loginConfirm">로그인</a>
				</div>
				<div class="log_chk">
					<span>아이디저장<span id="saveId"></span>
					</span>
				</div>
				<ul class="txtLink">
					<li><a href="#">아이디찾기</a></li>
					<li><a href="#">비밀번호찾기</a></li>
					<li><a href="signup_detail.do">회원가입</a></li>
				</ul>
				<div class="lrBox">
					<div class="lrBox_left">
						<span class="button">
							<input type="image" id="naver" class="naver" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"
                     		value="${url}"/>
						</span>
					</div>
					<div class="lrBox_right">
						<span class="button">
							<input type="image" id="kakao" class="kakao" src="https://developers.kakao.com/assets/img/about/logos/login/kr/kakao_account_login_btn_medium_narrow.png"/>
						</span>
					</div>
				</div>
		</div>
	</div>
</div>