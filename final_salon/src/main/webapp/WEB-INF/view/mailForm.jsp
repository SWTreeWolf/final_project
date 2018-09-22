<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Bootstrap -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<link rel="stylesheet" type="text/css" href="css/mailForm.css" />
<div class="container">
	<br>
	<form id="frm" action="mailSending.do" method="post">
		<div align="center">
			<!-- 받는 사람 이메일 -->
			<input type="text" name="manage" size="120" style="width: 100%"
				placeholder="관리자" readonly class="form-control"> <input
				type="hidden" name="tomail" size="120" style="width: 100%"
				value="tgrat92@naver.com" class="form-control"> <input
				type="hidden" name="id" size="120" style="width: 100%"
				value="${sessionScope.dto.id}" class="form-control">



		</div>
		<div align="center">
			<!-- 보내는 사람 이메일 -->

			<input id="e_mail" type="text" name="e_mail" size="120"
				style="width: 100%" placeholder="보내는 사람 이메일" class="form-control">

			<!-- 제목 -->
			<input id="e_title" type="text" name="e_title" size="120"
				style="width: 100%" placeholder="제목을 입력해주세요" class="form-control">
		</div>
		<div align="center">
			<!-- 제목 -->
		</div>
		<p>
		<div align="center">
			<!-- 내용 -->
			<textarea name="e_content" id="e_content" cols="120" rows="12"
				style="width: 100%; resize: none" placeholder="내용:"
				class="form-control"></textarea>
		</div>

		<div id="amail" align="center">
			<input type="button" id="mail" value="메일 보내기" class="btn btn-warning">
			<input type="button" id="cust" value="고객센터로" class="btn btn-warning">
		</div>
	</form>
</div>

