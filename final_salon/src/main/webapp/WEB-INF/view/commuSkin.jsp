<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="css/commu.css" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
	$('.contennn').each(function(){
 		var content = $(this).find("img").remove().end().html();
 		$(this).html(content);
 	});
	  /* $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');
	 
	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');
	 
	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  }); */
	  
	  
	  /* $('.checkbox').css({'display':'none'});
	  $('.del').css({'display':'none'});
	  
	  $('#edit').on('click',function(){
		 $('.del').css({'display':'block'});
		 $('.checkbox').css({'display':'block'});
		 
		 $('#edit').attr('id','edit2');
	  }); */
	  
	  /* $('#edit2').on('click',function(){
		  $('.del').css({'display':'none'});
			 $('.checkbox').css({'display':'none'});
	  }); */
     $('#searchBtn').on('click',function(){
    	 $(this).attr('href','searchPage.do?subject='+$('#searchtext').val());
    	 return true;
     });
	  
     

});
</script>
</head>
<body>
	<div class="wrap2345">
	    <div class="space"></div>
		<p id="subisubi">Salon de Boby Community</p>
		<div class="commuspace2"></div>
	</div>
	
	<div class="area">
	   <div class="area2">
	      <div class="subbb"></div>
	      <div class="best">New Post</div> 
	      
	      <div class="subbb"></div>
	      
	        <c:forEach items="${toplist}" var="com">
	          <div class="boxxx">
	             <div class="spa"></div>
	             <div class="ques"><img src="images/qq.jpg" /></div>
	             <div class="subjecttt"><a href="commuview.do?commuNum=${com.commuNum}">${com.subject}</a></div>
	             <div class="spacee"></div>
	             <div class="contennn">
	             <c:set var = "content" value = "${com.content}"/>
	             ${com.content}
	             <%-- <c:set var = "temp" value="${fn:subString(content,)}"/> --%>
	             <%-- <c:if test="${!fn:contains(content,'<img')}">${com.content}</c:if> --%>
	             </div>
	             <div class="plusss"><a href="commuview.do?commuNum=${com.commuNum}">+더보기</a></div>
	             <!-- a태그 안에다가 파라미터로 보낼수도 있음 -->
	             <div class="space9"></div>
	             <div class="reply"><a href="#">${com.nickname} ㅣ[댓글 갯수] ${com.replycnt}</a></div>
	             
	          </div>
	        </c:forEach>
	        
	   </div>
	</div>
	
	<div class="space3"></div>
	<div class="textt">여러분의 고민이나 궁금한 점을 질문해보세요.</div>
	<div class="space45"></div>
	<c:if test="${!empty sessionScope.dto.id }">
		<div class="questionBtn">
			<a href="commuwrite.do">질문하기</a>
		</div>
	</c:if>
	<div class="space45"></div>
	
	
	
	
	
	<div class="wrap2">
	  <div>게시글 : ${skincnt}</div>
	  <div class="smallwrap">
	   <div class="container">
	      <div class="cate">
	        <p><a href="commu.do">전체</a></p><p>ㅣ</p>
	        <p id="jun"><a href="skin.do">피부고민</a></p><p>ㅣ</p>
	        <p><a href="makeup.do">메이크업</a></p><p>ㅣ</p>
	        <p><a href="product.do">제품정보</a></p><p>ㅣ</p>
	        <p><a href="etc.do">기타</a></p>
	      </div>
	   </div>
	    
	   <!-- 관리자아이디일때 edit버튼이 보임 edit버튼 누르면 삭제 체크박스와 삭제버튼이 나타남 -->
	   
	   <!-- <div class="del" id="del">삭제</div>
	   <div class="edit" id="edit">EDIT</div> -->
	   <div class="search">
	     <input type="text" id="searchtext" class="searchtext" />
	     <a id="searchBtn" class="searchimage"><img src="images/searchicon.jpg"/></a>
	   </div>
	   
	   <!-- <div class="option">
	       <select>
	          <option>정렬</option>
	          <option>최신순</option>
	          <option>인기순</option>
	       </select>
	   </div> -->
	  </div>
	   <div class="clear"></div>
	</div>
	
	
	<c:forEach items="${skin}" var="com">
	<div class="wrap3">
	   <div class="smwrap">
	   
	       <div class="catete">
	        ${com.category}
	       </div>
	        
	       <div class="contentt">
	         <div class="space6"></div>
	         <span class="id">${com.nickname}&nbsp;&nbsp;&nbsp;ㅣ</span>
	         <span class="id"><a href="commuview.do?commuNum=${com.commuNum}">${com.subject}</a></span>
	         <div class="readreplycnt">
	           <img src="images/readcnticon.jpg" />${com.readcount}
	           <img src="images/ballroon.jpg" />${com.replycnt}
	         </div>
	       </div>
	       
	       <!-- <div class="checkbox"><input type="checkbox" /></div> -->
	    
	   </div>
	</div>
	<div class="space4"></div>
	</c:forEach>
	<div class="clearrrr"></div>
	
	<div class="pageee">
	   <c:if test="${pv.startPage > 1}">
		  <a href="skin.do?currentPage=${pv.startPage - pv.blockPage}" >
		  <span id="numberr">이전</span>
		  </a>
	   </c:if>
	   
	   <c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
		  <a href="skin.do?currentPage=${i}" id="numberr">${i}</a>
	   </c:forEach>
	   
	   <c:if test="${pv.endPage < pv.totalPage}">
		  <a href="skin.do?currentPage=${pv.endPage + pv.blockPage}">
		  <span id="numberr">다음</span>
		  </a>
	   </c:if>
	</div>

</body>
</html>