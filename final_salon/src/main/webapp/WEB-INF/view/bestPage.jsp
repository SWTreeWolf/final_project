<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/listPage.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo"
   rel="stylesheet">
</head>
<body>
   <div class="listWrap">
      <div class="space"></div>
      <div class="newproduct">
         <h2>BEST PRODUCT</h2>
      </div>
      <div class="hr"></div>


      <div class="space3"></div>

      <div class="chong">
      	
         <span id="56">총 <c:if test="${bestSize >=20}">20</c:if><c:if test="${bestSize <20}">${bestSize }</c:if>개의 상품이 있습니다.</span>
         
      </div>

      <div class="hr"></div>
      <div class="space3"></div>

        <c:if test="${bestSize < 20}">
        <div id="doubleBox">
     	 <c:forEach items="${bestList}" var="dto" begin="0" end="${bestSize }" varStatus="status">
         <div class="box">
            <div class="image">
              <a href="detail.do?code=${dto.goods_code }" onclick="newproduct(this)"><img src="${dto.picture.goods_main }"/></a>
            </div>

            <div class="text">
              <p><a href="detail.do?code=${dto.goods_code }" onclick="newproduct_2(this)">${dto.goods_name}</a></p>
            </div>
            
            <div class="color_option_view">
						<div class="opt_img">
							<c:forEach items="${dto.odto}" var="i">
								<img src="${i.goods_color_img}" />
							</c:forEach>
						</div>
						<c:if test="${dto.odtosize>6}">
						<%-- 	<c:if test="${dto.odtosize>12}">
								<div class="more_message">more ...</div>
							</c:if> --%>

							<div class="slide_view">
								<button class="slide_click">more view</button>
							</div>

						</c:if>
					</div>

            <div class="opt1">
            <c:if test="${dto.total_count != 0}">
							<div class="price">${dto.goods_price }원</div>
						</c:if>
						<c:if test="${dto.total_count == 0}">
							<div class="price">
								<span style="display: inline-block; text-decoration:line-through;">${dto.goods_price }원</span>
								<span style="display: inline-block;">품절</span>
							</div>
						</c:if>
            <div>
               <img src="images/box.jpg" id="iconbox">
            </div>
            <div class="cnt">${dto.reviewCount }</div>
            
            </div>
         </div>
         <c:if test="${status.index%2 !=0 }"></div>
					<c:if test="${status.index == bestSize-1 }">
					<div>
					</c:if>
					<c:if test="${status.index != bestSize-1 }">
					<div id="doubleBox" >
					</c:if>
				</c:if>
      </c:forEach>
      </c:if>
      </div>
      
      <c:if test="${bestSize >= 20}">
      <div id="doubleBox">
      <c:forEach items="${bestList}" var="dto" begin="0" end="19" varStatus="status">
         <div class="box">
            <div class="image">
              <a href="detail.do?code=${dto.goods_code }" onclick="newproduct(this)"><img src="${dto.picture.goods_main }"/></a>
            </div>

            <div class="text">
              <p><a href="detail.do?code=${dto.goods_code }" onclick="newproduct_2(this)">${dto.goods_name}</a></p>
            </div>

			<div class="color_option_view">
						<div class="opt_img">
							<c:forEach items="${dto.odto}" var="i">
								<img src="${i.goods_color_img}" />
							</c:forEach>
						</div>
						<c:if test="${dto.odtosize>6}">
						<%-- 	<c:if test="${dto.odtosize>12}">
								<div class="more_message">more ...</div>
							</c:if> --%>

							<div class="slide_view">
								<button class="slide_click">more view</button>
							</div>

						</c:if>
					</div>

           <div class="opt1">
						<c:if test="${dto.total_count != 0}">
							<div class="price">${dto.goods_price }원</div>
						</c:if>
						<c:if test="${dto.total_count == 0}">
							<div class="price">
								<span style="display: inline-block; text-decoration:line-through;">${dto.goods_price }원</span>
								<span style="display: inline-block;">품절</span>
							</div>
						</c:if>
						<div>
							<img src="images/box.jpg" id="iconbox">
						</div>
						<div class="cnt">${dto.reviewCount }</div>
						
					</div>
         </div>
         <c:if test="${status.index%2 !=0 }"></div>
					<c:if test="${status.index == bestSize-1 }">
					<div>
					</c:if>
					<c:if test="${status.index != bestSize-1 }">
					<div id="doubleBox">
					</c:if>
				</c:if>
      </c:forEach>
      </c:if>
      </div>
      <div class="space3"></div>
   </div>
</body>
</html>