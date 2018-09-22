<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<input type="hidden" value="${sessionScope.dto.id}" name="id"/>
   <div id="content">
      <div id="cart-wrapper">
         <div id="cart-top">
            <h1>장바구니</h1>
         </div>
         <div id="cart-content">
            <div id="cart">
               <div id="cart-sub">
                  <div class="checkForm"> 
                     <input type="checkbox" id="cartAllChk" name="cartAllChk"
                        checked="checked"> <label id="cartAllChk-label"
                        for="cartAllChk"><span>온라인 쇼핑 상품</span></label>
                  </div>
               </div>
               <!--end cart-sub-->
               <div id="orderList">
                  <ul id="pro-ul">
                     <!-- 리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리ㅍ리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리 -->
                     <c:forEach var="dto" items="${cList}" varStatus="st">
					
                        <li class="proBoxOpt" id="proBox">	
                           <div class="checkForm">
                              <div class="cartInput">
                              <input type="checkbox" class="orderChk" name="chkBox" checked="checked"/>
                                 <!-- 여기에 input모여랏^^ -->
                              </div>
                           </div>
                           <div class="proImg">
                              <a href="${dto.goods_code}">
                              <input type="hidden" id="goods_code_del" value="${dto.goods_code}" />
                              <img class="proImgImg" src="${dto.goods_main}" alt="${dto.goods_name}" />
                              </a>
                           </div> <!--end proImg-->

                           <div class="proInfo">
                              <div class="proDetail">
                                 <a href="javascript:void(0)" onclick="javascript:cartDel(this);" class="delBtn"><img
                                    src="images/close.png" /></a>
                                 <p class="proName">
                                    <a href="detail.do?code=${dto.goods_code}">${dto.goods_name}</a>
                                       <input type="hidden" value="${dto.goods_code }" id="cart_goods_code"/>
                                       <input type="hidden" value="${dto.cart_num[0]}" name="cart_num"/>
                                 </p>
                                 <c:if test="${dto.goods_code2[0]==0}">
                                    <div class="no_option_cntBox">
                                       <div class="dd">
                                          <input type="image" title="제품 수량 감소"
                                             class="cart_count_down" 
                                             onclick="cart_count_down(${dto.cart_num})"
                                             src="images/count_down.gif">
                                             	<input type="hidden" value="${dto.goods_price }" id="goods_price"/>
                                          <input type="tel" title="선택품목갯수"
                                             value="${dto.prod_count[0]}" name="cnt" class="cart_cnt"
                                             id="cart_cnt${dto.cart_num[0]}" onchange="price_change(${dto.cart_num})"/> <input
                                             type="image" title="제품 수량 증가" class="cart_count_up"
                                             onclick="cart_count_up(${dto.cart_num})"
                                             src="images/count_up.gif" />
                                       <input type="button" id="no_option_btn" onclick="no_cnt_check(this,1)" value="수정" />
                                       </div>
                                    </div>
                                    <div id="nooptionPirce"><span>${dto.goods_price * dto.prod_count[0] }원</span>
                                                <input type="hidden"
                                                   value="${dto.goods_price * dto.prod_count[0] }" name="gt_price" />
                                    </div>
                                 </c:if>
                                 <c:if test="${dto.goods_code2[0]!=0}">
                                    <p class="selSub">선택한 옵션</p>
                                    <div class="selBox">
                                       <c:forEach items="${dto.odto}" var="odto" varStatus="ol">
                                          <div class="sel">
                                             <img src="${odto.goods_color_img}" /><span
                                                class="selName">${odto.goods_color}</span>
                                                <input type="hidden" value="${odto.goods_code2}" id="cart_goods_code2"/>
                                                <input type="hidden" value="${dto.cart_num[ol.index]}" name="cart_num"/>
                                             <div class="cntBox">
                                                <div class="dd">
                                                   <input type="image" title="제품 수량 감소"
                                                      class="cart_count_down"
                                                      onclick="cart_count_down(${dto.cart_num[ol.index]})"
                                                      src="images/count_down.gif">
                                                      	<input type="hidden" value="${dto.goods_price }" id="goods_price"/>
                                                   <input type="tel" title="선택품목갯수"
                                                      value="${dto.prod_count[ol.index]}" name="cnt"
                                                      class="cart_cnt" onchange="price_change(${dto.cart_num[ol.index]})"
                                                      id="cart_cnt${dto.cart_num[ol.index]}"/> <input
                                                      type="image" title="제품 수량 증가" class="cart_count_up"
                                                      onclick="cart_count_up(${dto.cart_num[ol.index]})"
                                                      src="images/count_up.gif" />
                                                	<input type="button" id="option_btn" onclick="countEditProcess(this,1)" value="수정" />
                                                </div>
                                             </div>

                                             <div id="optionPirce"><span>${dto.goods_price * dto.prod_count[ol.index] }원</span>
                                                <input type="hidden"
                                                   value="${dto.goods_price * dto.prod_count[ol.index] }" name="gt_price"/>
                                             </div>  
                                             <a href="javascript:void(0)"  onclick="option_Del(this,${dto.cart_num[ol.index]})" class="optdelBtn"><img src="images/close.png" /></a>
                                          </div>
                                          <!--end sel-->
                                       </c:forEach>
                                    </div>
                                 </c:if>
                                 <!--end selBox-->
                                 <!--end cntBox-->
                              </div>
                              <!--       <div class="proPrice-wrapper">
                                 <input type="tel" class="proPrice"
                                    id=""
                                    value="1000" /><span>원</span> <input
                                    type="hidden" id="goods_price"
                                    value="1000" />
                              </div> -->
                              <!-- end propriceWrapper -->
                           </div> <!--pro info--> 
                        </li>
                        <!--end proBox2-->
                     </c:forEach>
                     <!-- 리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리ㅍ리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리리리리리리ㅣ리릴리리 -->

                  </ul>
                  <!--end pro-ul-->

               </div>
               <!-- order-list -->
            </div>
            <!-- cart -->
         </div>
         <!--end cart-content -->
         <div id="cartInfo">
            <p id="totalPrice">
               총 상품 금액<span id="totalPriceContent"></span><span >원</span>
               <input type="hidden" value="0" name="total_price"/>
            </p>
            <p id="orderBtn">주문/결제하기</p>
            <form method="POST" id="order_form" action="cartBuy.do">
            </form>
         </div>
      </div>
      <!--end wrapper-->

   </div>
   <!--end content-->

</body>