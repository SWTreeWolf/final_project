<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
</head> 
<title>Insert title here</title>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 	 
</head>
<body>  
 <div class="no"> 
	      <div id="not">  
	            <a id="gg">공지사항</a>
	            
			 	 <div class="slick-items1">
			 	   
			 	 <c:forEach var="dto" items="${noBaord}"> 
	                 <div>
	                   <c:url var="path" value="noview.do">
									<c:param name="currentPage" value="${pv.currentPage}" />
									<c:param name="num" value="${dto.noNum}" />    
						 		</c:url> <a href="${path}" onclick="noview.do">[공지] : ${dto.noTitle}</a>
						 		<input id="teee" type="hidden" value="${dto.noNum}">  
	                   </div>  
	                    </c:forEach> 
	                </div>
	             <a id="mo" href="notice.do">더보기+</a>
	        </div>         
	  </div>
</body>