<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>


<div id="proListView-wrapper">
  <div id="proListView-content">
    <div id="proListView-con-content">
    <div id ="proListView-top"><h1>상품정보</h1></div>
   <div id="proListView_table">
    <form  action="ad_proSet.do" method="post" enctype="multipart/form-data">
    <table class="proViewTable">
      <tr>
      <th>상품명</th><td>${rdto.goods_name}
   </td> </tr>
       <tr>
      <th>상품코드</th>
    <td><input type="hidden" name="goods_code" value="${rdto.goods_code}"/>
     ${rdto.goods_code}</td>
      </tr>
      
      <tr>
      <th>가격</th>
        <td id="proView-price"><span id="proView-pricee">${rdto.goods_price}</span><span>원</span></td> </tr> 
      <tr>
        <th>상품 카테고리</th>
        <td>
      <label>그룹1:</label>
  ${rdto.goods_group1}
      <label>그룹2:</label>
       ${rdto.goods_group2}
        </td></tr>
      
  <tr>
      <th>상품설명:</th>
    <td>
     ${rdto.goods_content}</td>
      </tr>
      <tr>
      <th>메인이미지</th>
        <td>
    <div class="imgView"><img class='outputView' src="${rdto.goods_main}"/></div>
        </td>
      </tr>
      <tr>
      <th>디테일이미지</th>
        <td>

    <div class="imgView2"><img src="${rdto.goods_detail}"/></div>
        </td>
      </tr>
      <tr>
        <th>재고</th>
        <td>
        
        <c:if test="${!empty rdto.optList}">
          <table class="colorSoldTable">
          <tr>
            <th>이미지</th> <th>색상</th>
            <th>재고</th><th>판매</th>
            </tr>
            <c:forEach var="opt" items="${rdto.optList}" varStatus="st">
          <tr id="optColor${st.index}">
            <td>
  <img class="colorImg" src="${opt.goods_color_img}"/>
            </td> 
            <td>${opt.goods_color}</td>
            <td class="proView-colorcount"><input type="hidden" id="angry"  value="${opt.goods_code2}" name="optList[${st.index}].goods_code2"/>${opt.goods_count}
            <input class="colorHidden" type="number" name="optList[${st.index}].goods_count" value="${opt.goods_count}"></td>
            <td>${opt.opt_sel_count }개
            <span class="modi-xBtn2"><a href="#" onclick="removeColor(${st.index},${opt.goods_code2})"><img src="https://www.etudehouse.com/kr/ko/web_resource/front/images/common/ico_close2.png"></a></span>
            </td>
          </tr>
          </c:forEach>
            </table>
           <div id="colorModiAdd">
           <p>색상추가</p>
           <span id="colorPickSpan">
      <label id="colorNameIns">색상명
      <input type="text" id="goods_color"/>
      <input type="file" id="colorPick"/>
      </label>
      </span>
      <label id="countLabel">갯수:</label>
       <input type="text" id="goods_count" />
          <button id="addBtn" type="button" onclick="addColor()">추가</button>
              <div id="colorAddBox"> 
        <!--여기에 색상이미지가 들어갑니다-->
        </div>
          </div><!-- colorModiadd end -->
            </c:if>
            
            <c:if test="${empty rdto.optList}">
            <table class="colorSoldTable">
            <tr><th>재고</th><th>판매</th></tr>
            <tr><td id="proView-count">${rdto.total_count}</td>
            <td>${rdto.sel_count }개</td>
            </tr>
            </table>
            
            </c:if>
        </td>    
      </tr>
    </table>
    <div id="proListBottom">
    <button id="proListViewSetBtn">수정</button><button id="proListViewSet" >수정하기</button><a id="listBbtn" href="ad_proList.do">리스트로 돌아가기</a>
    </div>
</form>
   </div>
      <!--end prolistview table-->

</div><!--end regi-con-content-->
</div><!--end regi-content-->
</div><!--end reg-wrapper-->
</body>