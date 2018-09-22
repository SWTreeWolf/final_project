<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/commuSearch.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">
</head>
<body>
   <div class="backgr">
      <div class="input">
         <div class="input2"></div>
         <div>
           <input type="text" class="textttbox" value="keyword : ${key}"/>
           <!-- <span class="word">KeyWord</span> -->
           <a id="searchBtn" class="imagee"><img src="images/searchicon.jpg" /></a>
         </div>
         <div class="input2"></div>
      </div>
   </div>

   <div class="searc_wrap">
     <div class="margin"></div>
     <div>게시글 : ${listcnt}</div>   
     <table class="tableee">
       <tr>     
          <th>글번호</th> <th>카테고리</th> <th width="55%">제목</th> <th>글쓴이</th> <th>조회수</th>
       </tr>
       <c:forEach items="${searchlist}" var="com">
       <tr class="dd">
          <td>${com.commuNum}</td> <td>${com.category}</td>
          <td><a href="commuview.do?commuNum=${com.commuNum}"> ${com.subject}</a></td> <td>${com.nickname}</td>
          <td>${com.readcount}</td>
       </tr>    
	   </c:forEach>
	  </table>
	  
	  <div class="Btn"><a href="commu.do">글목록</a></div>
   </div>
</body>
</html>