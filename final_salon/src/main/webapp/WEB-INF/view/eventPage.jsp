<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/eventPage.css" />  
</head>
<body>

<div class="container">
	<div class="page-header">
		<p class="lead"></p> 
	</div>
      <div id="vdesign">
        <p id="eno">이벤트No.:${dto.event_num}</p>  
	  	<p id="ename">제목 :${dto.event_name}</p>
	  </div> 	
	  	<p id="econtent">${dto.event_content}</p><br/>
			 
		<br>
	<hr>
	<button id="eventcome">다른이벤트보기</button>
	
 <c:if test="${sessionScope.dto.id == 'admin' }" >  	
	<button id="eventup">이벤트 수정</button>
	
	<button id="eventdel">이벤트 삭제</button>  
</c:if> 
</div>
  
<form name="frm" id="frm" method="get">   
   <input type="hidden" name="num" value="${dto.event_num}" > 
 
</form>
 
</body>
</html>



