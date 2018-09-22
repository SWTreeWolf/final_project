<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/searchmem.css" />
</head>
<body>
	<div class="loginWrap">
        <div class="searchWrap">
        	<p>결과</p>
            <input type="text" name="result" value="${dto.id}" readonly="readonly">
            <c:if test="${dto.mem_group ne null && dto.mem_group ne ''}">
            <input type="text" name="result" value="${dto.password}" readonly="readonly">
            </c:if>
        </div>
    </div>
</body>
</html>