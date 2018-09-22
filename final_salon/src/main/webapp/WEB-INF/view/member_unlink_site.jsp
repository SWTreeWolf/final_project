<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="mem_unlink">
<form action="unlink.do" id="unlink_form" method="POST">
	<input type="hidden" id="unlink_id" value="${sessionScope.dto.id}"/>
	<input type="password" name="password" id="unlink_txt" placeholder="비밀번호를 입력하세요"/>
	<input type="button" id="unlink_check_btn" value="탈퇴" />
</form>
</div>

