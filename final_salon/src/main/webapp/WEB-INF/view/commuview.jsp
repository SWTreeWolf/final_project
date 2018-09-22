<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/commuview.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script type="text/javascript" src="js/commuview.js"></script>
</head>
<body>
    <div class="commuViewwrap">
    <input type="hidden" id="log_id" value="${sessionScope.dto.id}" />
    <input type="hidden" id="log_nick" value="${sessionScope.dto.nickname}" />
       <div class="space"></div>
       <div class="imgg"><img src="images/bigqq.jpg"></div>
       <input type="hidden" id="bno" class="bno" value="${comlist.commuNum}" name="commuNum" />
       <div class="space"></div>
       <div class="subjecttt">${comlist.subject}<!-- 글제목 --></div>
       <div class="commuspace2"></div>
       
         <div class="wrap2">
           <div class="idddd">${comlist.nickname}&nbsp;ㅣ</div>
           <div class="clickkk">조회수&nbsp;${comlist.readcount}&nbsp;ㅣ</div>
           <div class="replyyy">댓글수&nbsp;${comlist.replycnt}</div>
         </div>
         
       <div class="spac2"></div>
       <div class="contentarea">${comlist.content}</div>
       <div class="spac2"></div>
       <div class="box34">
         <c:if test="${comlist.id == sessionScope.dto.id || sessionScope.dto.id == 'admin' }">
         <div class="del"><a href="delete.do?commuNum=${comlist.commuNum}" >삭제</a></div>
         <div class="update"><a href="update.do?commuNum=${comlist.commuNum}">수정</a></div> <!-- ?commuNum=${comlist.commuNum} -->
       	 </c:if>
       </div>
       <div class="spac2"></div>
    </div>
      
      
    <!-- reply영역 시작 --> 
    <div id="replyareaa">
    
        <div class="smreply" id="smreply">
        
          <div class="profileee">
           
            <!-- <div class="profile22">
            <img src="images/profile.jpg">
            ID ㅣ DATE
            </div>
            
            <div class="replycont">
              <img src="images/answer.png">
                          댓글내용댓글내용댓글내용
            </div> -->
              
          </div>
          
        </div>
        
        <div class="spac2"></div>
          
    </div>
    
    <!-- 댓글 페이징 -->
   <!--  <div class="dddddddd">
      <div class="pagee" id="pagee"></div>
    </div> -->
    
    <!-- 댓글입력창 -->
    <div class="wrapwrap">
       <div id="replyarea">
         <div class="dap">  
         	<div class="nick">
         	<input type="hidden" id="replyWriter" name="replyWriter" class="replyWriter" value="${sessionScope.dto.nickname }"/>
         	</div> 
         </div>
         <div class="spac2"></div>
         <textarea rows="" cols="" name="reply" id="replyyyy" placeholder="답변해주세요~"></textarea>
         
         <div class="spac2"></div>
         
         <div class="buttongroup">
            <button class="comm_register" id="comm_register">등록하기</button>
            <button class="listlist" id="listlist"><a href="commu.do">목록</a></button>
         </div>
         
         <div class="spac2"></div>
       </div>
    </div>
</body>
</html>