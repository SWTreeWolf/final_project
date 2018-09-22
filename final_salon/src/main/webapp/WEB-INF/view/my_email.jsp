<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="myemail-wrapper">
<div id="myemail-content">


<div id="myemail-top">
    <h1>📪나의 Q/A 메일📪</h1>
    </div>


  <div id="myemail-count"><p id="myemail-count">${emailList.size()}개의 메일</p></div>
    <table id="myemail-table">
    <c:forEach items="${emailList}" var="dto">
    <tr><th>번호</th><th>날짜</th><th>제목</th><th>이메일</th></tr>
    <tr class="mail_tr"><td>${dto.e_num}</td><td><fmt:formatDate value="${dto.e_date}" pattern="yyyy-MM-dd"/></td><td>${dto.e_title}</td><td>${dto.e_mail}</td></tr>
    <tr><td class="mail_content" colspan="4">${dto.e_content}</td></tr>
    </c:forEach>
    <c:if test="${emailList.size()<1}">
    <tr><th>번호</th><th>날짜</th><th>제목</th><th>이메일</th></tr>
<tr><td colspan="4">발송한 메일이 없습니다</td></tr>
</c:if>
    </table>


    <div class="myemail-page">
    <a <c:if test="${pdto.startPage<=1}">class="nback"</c:if><c:if test="${pdto.startPage>1}">class="back" href="my_email.do?currentPage=${pdto.startPage-pdto.blockPage}" </c:if>>⍇</a>
    <c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}"> 
    <a class="ad_page" href="my_email.do?currentPage=${i}" <c:if test="${i==pdto.currentPage}">style="background:hotpink"</c:if> >${i}</a>
    </c:forEach>
       <c:forEach var="e" begin="${pdto.endPage+1}" end="${pdto.startPage+pdto.blockPage-1}"><a class="nad_page">${e}</a></c:forEach>
 <a <c:if test="${pdto.totalPage <= pdto.endPage}">class="nforward"</c:if><c:if test="${pdto.totalPage > pdto.endPage}">class="forward" href="my_email.do?currentPage=${pdto.endPage+1}" </c:if> >⍈</a>
    </div>
 

</div>
</div>
</body>
</html>