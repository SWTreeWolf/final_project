<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/notice.css" />  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
<script type="text/javascript">
 
$(document).ready(function(){


$("#noregister").on('click',function(){
	   $('#frm').attr('action',"noregister.do");
	   $('#frm').submit(); 
	 
});


$("#cstmTab22").hover(  
        function(){
        $(this).css("background-color", "white");
        },   
          
        function(){ 
        $(this).css("background-color", "#f54a7e");
});


$("#cstmTab11").hover(  
    function(){ 
    $(this).css("background-color", "#f54a7e");
    $("#cstmTab22").css("background-color", "white");
    },   
     
    function(){
    	$(this).css("background-color", "white");
    $("#cstmTab22").css("background-color", "#f54a7e");
});


$("#cstmTab33").hover(  
    function(){ 
    $(this).css("background-color", "#f54a7e");
    $("#cstmTab22").css("background-color", "white");
    $("#cstmTab11").css("background-color", "white");
    },   
      
    function(){ 
    $(this).css("background-color", "white");
    $("#cstmTab22").css("background-color", "#f54a7e");
});






});
</script>
</head>
<body>

<div id = "container"> 
 <div id = "customerCenter"> 
  <div id="pageTitleWrap">
		<h2 id="h2_title2">공지사항</h2> 
  </div>
    <div id="wrap"> 
       <div id="cstmBtn">
					 <ul>            
						<li id="cstmTab11"><a href="customer.do">FAQ</a></li>
						<li id="cstmTab22"><a href="notice.do">공지사항</a></li>
						<li id="cstmTab33"><a href="mailForm.do">메일보내기</a></li>
					
					</ul>
					
				</div> 
                   <!-- <a id="noti">NOTICE</a>  -->
   					<div id="noti_table_wrap">
   					<div id="noti_margin"></div>
					<table id="table">  
						<caption></caption> 
						<colgroup>
							<col style="width: 7.5%;">
							<col style="width: 13.5%;">
							<col style="width: 61%;">
							<col style="width: 18%;">
						</colgroup>
						<thead>
							<tr>
								<td>번호</td>
								<td>분류</td>
								<td class="subject">제목 </td>
								<td>작성일</td>
							</tr>
						</thead>
						
						<tbody>
							 <c:forEach var="dto" items="${aList}"> 
										<tr>
											<td class="num">${dto.noNum}</td> 
											<td class="type">${dto.noCate}</td> 
											<td class="subject">
											<c:url var="path" value="noview.do">
									<c:param name="currentPage" value="${pv.currentPage}" />
									<c:param name="num" value="${dto.noNum}" />  
						 		</c:url> <a href="${path}" onclick="noview.do">${dto.noTitle}</a></td>
											<td class="date"><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
			    			value="${dto.reg_date}"/></td>  
										</tr> 
							</c:forEach>
						</tbody>
						
					</table>
				</div>
					<div id=page>
<form id="frm" method="get">	 
					<!-- 이전(prev) --> 
 
			                <c:if test="${pv.startPage>1}">
				              <span><a 
					              href="notice.do?currentPage=${pv.startPage-pv.blockPage}"><img src="images/prev.gif" height="30" width="30"></a></span>
			                         </c:if>

                     			<!-- 페이지 --> 
			                        <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
				                        <span><a id="pag" href="notice.do?currentPage=${i}">${i}</a></span>
                                 			</c:forEach> 
			                 <!-- 클릭한 해당되는 레코드가 출력된다. -->

                    			<!-- 다음 (next)-->
 			                   <c:if test="${pv.endPage<pv.totalPage}">
				                  <span><a 
					                href="notice.do?currentPage=${pv.startPage+pv.blockPage}"><img src="images/next.gif" height="30" width="30"></a></span>
			                             </c:if>
</form>
			                             
                     </div>  
		


 <c:if test="${sessionScope.dto.id == 'admin' }" >
<input type="button" id="noregister" value="공지등록"/>  
</c:if>
 


</div>
</div>
</div>
</body>
</html>