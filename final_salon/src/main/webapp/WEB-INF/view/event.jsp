<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/event.css" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet"> 
</head>
<body>
  
 
 


	<div class="eventWrap"> 
		<div id="content">
			<div id="event-wrapper">
				<div id="event-top">
					<h1>이벤트</h1>
					<form name="eventWrite" id="eventWrite" method="get"></form>
				</div>
				<div id="event-content">
					<div id="event-tab"> 
						<ul>
							<li id="tab" class="tab-sub"><a href="#" style="color: #f54a7e">진행중인
									이벤트</a> <!-- 이벤트 몇개인지 --> <span id="pink"></span></li>
							<li id="tabbbaa" class="tab-sub"><a href="#">종료된 이벤트</a> <span id="grey"></span></li>
  
						</ul>
					</div>
					<c:if test="${sessionScope.dto.id == 'admin' }">
						<div id="write1">

							<a href="eventWrite.do">이벤트 등록</a>


						</div>	
					</c:if>
					<!-- end event-tab -->
					<div id="event-list">
					   	<ul>    
					<%-- 		<c:forEach items="${eventList}" var="dto"> 
							
		
			
								<li class="event" id="event1"><c:url var="path"
										value="eventPage.do">
										<c:param name="num" value="${dto.event_num}" />
									</c:url>
									<div class="event_mainpic">
										<a href="${path}"> 
											<img src="${dto.event_mainpic}" id="mainpic" />
										</a>
									</div>
									<div class="event_name">
										<p>${dto.event_name}</p>
									</div> 
								
							
									</li>
									
				
							</c:forEach>
                  --%>
						</ul> 
						
						 	
					</div>
					<!--event list-->
				</div>
				<!-- end content -->
			</div>
			<!-- end event-wrapper -->
			<!-- end event-content -->
		</div>
	</div>

	
	
	
	
	
	<div class="new-image">
	    	 
	   <div id="seeMore">    
					<a id="more">진행중인 이벤트 </a>  
         </div>
         
	</div>

	

</body>
</html>