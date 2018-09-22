<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<input type ="hidden" value="${sessionScope.dto.name}" name="name"/>
<input type ="hidden" value="${sessionScope.dto.id}" name="id"/>
<input type ="hidden" value="${sessionScope.dto.email }" name="email" />
<input type ="hidden" value="${sessionScope.dto.zipcode}" name="zipcode"/>
<input type ="hidden" value="${sessionScope.dto.addr1}" name="addr1"/>
<input type ="hidden" value="${sessionScope.dto.addr2}" name="addr2"/>
<input type ="hidden" value="${sessionScope.dto.phone}" name="phone"/>

<form id="ordFrm" name="ordFrm" method="post" onsubmit="return false;">
   <div id="container">
      <div class="content">
         <div class="pageTitleWrap">
            <h2 class="h2_title">주문/결제하기</h2>
         </div>

         <div class="orderPayWrap">
            <div class="orderPayStep">
               <ul>
                  <li class="step2 on"><img src="images/card.png" height="60"
                     width="60"></br> 주문/결제 <span class="on">&gt;</span></li>
                  <li class="step3"><img src="images/com.png" height="60"
                     width="60"></br> 결제완료</li>
               </ul>
            </div>
            <div class="orderPayCont mt50">
               <div class="orderListWrap" id="orderListWrap">

                  <dl class="onlineOrdPrd pull_down_group">
                     <dt id="pull_down_button"
                        onclick="fnPullDownButton(this); return false;">
                        온라인 쇼핑 상품 (<em>${aListlength}</em>건)
                     </dt>
                     <dd id="pull_down_con" style="display: block;">
                        <dl class="prdListWrap">
                           <dt class="hdTxt"></dt>
                           <dd class="normalPrd">
                              <ul class="ordPrdList">
								<c:forEach items="${aList}" var="dto" varStatus="i">
									
                                 <li class="prdList">
                                    <div class="prdImg"> 
                                       <input type="hidden" id="goods_code" value="${dto.goods_code }"/>
                                       <a> <img src="${dto.goods_main }" alt="제품이미지">
                                       </a>
                                        
                                    </div>
                                    <div class="prdInfo">
                                       <div class="prdDetail">
                                          <p class="prdName">
                                             <a> ${dto.goods_name } </a>
                                          </p>
                                          <!-- <span class="prdOpt"></span> -->
                                          <c:set var="tot_count" value="0" />
                                          <c:if test="${!empty dto.goods_color}">
                                          <c:forEach items="${dto.goods_color_img}" var="color" varStatus="status">
                                             <c:set var="tot_count" value="${tot_count + dto.option_count[status.index] }" />
                                          </c:forEach>
                                          
                                          
                                          </c:if>
                                          <c:if test="${empty dto.goods_color}">
                                          	 <c:forEach   items="${dto.option_count}" var="color" varStatus="status">
                                          	 <input type="hidden" id="cart_num" value="${dto.cart_num[status.index] }" />
                                             <c:set var="tot_count" value="${dto.option_count[status.index] }" />
                                          </c:forEach>
                                          </c:if> 
                                          
                                          
                                            <em class="prdCount"><span>${tot_count }</span>개</em> <em
                                             class="pdtAlt"> </em> <strong class="prdPrice"
                                             id="105002039_110096951_null_0_N"> 
                                             <c:set var="tot_price" value="0" />  
                                           
                                           <c:if test="${!empty dto.goods_color}">
                                             <c:forEach items="${dto.goods_color_img}" var="color" varStatus="status">
                                             
                                                <c:set var="tot_price"
                                                   value="${tot_price + (dto.goods_price * dto.option_count[status.index]) }" />
                                             </c:forEach> <span id="tot_prices">${tot_price }</span>원
                                          </strong>
                                          </c:if> 
                                          
                                           <c:if test="${empty dto.goods_color}">
                                           <input type="hidden" name="nogoods_price" value="${dto.goods_price }" />
                                             <c:forEach items="${dto.option_count}" var="color" varStatus="status">
                                                <c:set var="tot_price"
                                                   value="${tot_price + (dto.goods_price * dto.option_count[status.index]) }" />
                                             </c:forEach> <span id="tot_prices">${tot_price }</span>원
                                          </strong>
                                          </c:if>
                                          <!-- 뷰티전용상품 원을 p로 보여준다 -->
											
										  <!-- 조건 걸어야할 부분 -->
										  <c:if test="${!empty dto.goods_color}">
                                          <dl class="choiceOpt mt10">
                                             <dt>선택한 옵션</dt>
                                             <dd class="opt_mt10">

                                                <ul class="ul10">
                                                   <c:forEach items="${dto.goods_color_img}" var="color"
                                                      varStatus="status">
                                                       <li class="li10">
                                                       <input type="hidden" id="goods_code2" value="${dto.goods_code2[status.index]}" />
                                                       <input type="hidden" id="cart_num" value="${dto.cart_num[status.index] }" />
                                                       <span class="optColor"><img
                                                            src="${color }" alt="옵션컬러이미지"></span>
                                                         		<span class="color_name">${dto.goods_color[status.index] }</span> 
                                                         <span class="optName" style="line-height: 20px;"> <em class="optCount">
                                                           <span class="opt_counts">${dto.option_count[status.index]}</span>개</em>

                                                             <em class="pdtAlt"> </em>
                                                      </span> <span class="optPrice" id="102001343_650001486___N">
                                                      		<input type="hidden" id="good_prices" value="${dto.goods_price}" />
                                                            <c:set var="price"
                                                               value="${dto.goods_price * dto.option_count[status.index] }" />
                                                            <em id="option_price">${price }</em>원

                                                      </span></li> 
                                                   </c:forEach>
                                                </ul>
                                             </dd>
                                           </dl>
                                          </c:if>
                                         <!--  조건 걸어야할 부분 끝 --> 
                                       </div>
                                    </div>
                                 </li>
                                 </c:forEach>
                              </ul>
                              <!-- //<ul class="ordPrdList"> -->
                           </dd>
                           <!-- //<dd class="normalPrd"> -->
                        </dl>
                        <!-- //<dl class="prdListWrap"> -->
                     </dd>
                     <!-- //<dd class="pull_down_con"> -->
                  </dl>
                  <!-- ------ -->

                  <dl class="dlvInfo mt15 pull_down_group BuyerBox open"
                     id="ordCstmInfoDisp">
                     <div id=line>
                        <dt id="pull_down_button"
                           onclick="fnPullDownButton(this); return false;">주문자 정보</dt>
                        <dd id="pull_down_con2" style="display: block;">

                           <div id="dlvAd">
                              <div id="writeBox">
                                 <ul>
                                    <li><h7>이름 : ${sessionScope.dto.name }</h7></li>
                                    <li><h7>이메일 : ${sessionScope.dto.email }</h7></li>
                                    <li><h7>휴대폰 : ${sessionScope.dto.phone }</h7></li>
                                 </ul>
                              </div>
                           </div>

                        </dd>
                     </div>
                  </dl>
                  <!-- ------- -->

                  <dl class="dlvInfo mt15 pull_down_group deliveryBox open"
                     id="dlvInfoDisp">
                     <dt id="pull_down_button"
                        onclick="fnPullDownButton(this); return false;">배송정보</dt>
                     <dd id="pull_down_con3" style="display: block;">
                        <div class="deliveryBox">

                           <div class="dlvAd" id="G_Disp" name="G_Disp">
                              <div>
                                 <div class="writeBox" id="recvDisp2" name="recvDisp">
                                    <ul>
                                       <li style="padding: 0 0 10px;"><span id="radioForm">
                                             <input checked="checked" type="radio" id="dlv1NewIns" name="selDelivery1"
                                             onclick="setDlvInfo('selDelivery1', ''); selectDlv1mgr('Y')">
                                             <label for="dlv1NewIns">새로 입력</label>

                                       </span> <span id="radioForm"> <input type="radio"
                                             id="dlv1CstmInfo" name="selDelivery1"
                                             onclick="setDlvInfo('selDelivery1', 'cstmInfo'); selectDlv1mgr('Y')">
                                             <label for="dlv1CstmInfo">주문자와 동일</label>
                                       </span></li>
                                       <li id="recvName"><h7>이름&nbsp&nbsp&nbsp</h7> <input type="text"
                                          id="recvNm" name="recvNm" maxlength="50"></li>
                                       <li><h7>휴대폰&nbsp</h7>
                                          <div id="telBox">
                                             <div id="noOpt">
                                                <input type="text" id="mbl1" name="mbl1" maxlength="3" />
                                             </div>
                                             <span class="betweenTxt">-</span> <input type="tel"
                                                id="mbl2" name="mbl2" maxlength="4"
                                                onkeydown="return onlyNumber(event)"
                                                onkeyup="numAutoFocus(event)"> <span
                                                class="betweenTxt">-</span> <input type="tel" id="mbl3"
                                                name="mbl3" maxlength="4"
                                                onkeydown="return onlyNumber(event)"
                                                onkeyup="numAutoFocus(event)">
                                          </div></li>
                                       
                                       <li>
                                          <span>주소</span>
                                          <div id="addressBox">
                                             <input type="text" id="addr0" name="zipcode"
                                                onkeydown="return onlyNumber(event)"
                                                onkeyup="removeChar(event)" readonly="readonly">
                                             <span class="button1 grayBtn"><b href="#"
                                                class="type4 middle" id="orderZipSrch"
                                                onclick="sample4_execDaumPostcode(); return false;">우편번호
                                                   찾기</b></span> <input type="text" class="mt5" id="addr1"
                                                name="addr1" value=""> <input type="text"
                                                class="mt5" id="addr2" name="addr2" value="">
                                          </div>
                                       </li>
                                       <li>
                                          <h5>배송시 요청사항</h5>
                                          <div id="dlvBox">
                                             <div class="textForm js-label" id="dlvMsgDisp">
                                                <label for="dlvMsg" class=""></label> 
                                                <select id="dlvMsg">
                                                   <option value="a">요청사항 선택</option>
                                                   <option value="b">부재 시 경비실에 맡겨주세요.</option>
                                                   <option value="c">배송 전 연락 바랍니다.</option>
                                                   <option value="d">부재시 연락 후에 경비실에 맡겨주세요.</option>
                                                   <option value="e">부재시 문앞에 놓아주세요</option>
                                                   <option value="f">택배함에 넣어주세요.</option>
                                                </select>
                                             </div>
                                          </div>
                                       </li>
                                    </ul>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </dd>
                  </dl>

                  <!-- ------ -->
               </div>
               <!-- ------------------- -->
               <div id="payListWrap">
                  <dl id="totalPriceBox">
                     <c:if test="${total_price<10000 }">
                  	 <c:set var="DlvPrice" value="2500" />
                  	 </c:if>
                     <c:set var="final_price" value="${total_price+ DlvPrice}" />
                     <dt class="h5_title">
                        최종 결제금액<em><span id="sttlPrcId1">${final_price}</span>원</em>
                     </dt>
                     <dd>
                        <ul>
                           <li>
                              <p id="payTxt">주문금액</p> <strong><span
                                 id="lastOrderPrice">${total_price}</span> 원</strong>

                              <!-- <div class="discountDetail">
                                 <ul>
                                    <li style="display: none">테이크아웃<em><span
                                          id="takeoutTotPrc">0</span>원</em></li>

                                    <li id="spPrcPrdDisp" style="display: none">(구매특가)온라인 <em><span
                                          id="spPrcPrd">0</span>원</em></li>

                                 </ul>
                              </div> -->
                           </li>
                           <li>
                              <p id="payTxt">배송비</p> <strong> <span
                                 id="spnDlvPrice"> <c:if test="${tot_price<10000 }">
                                       <c:set var="DlvPrice" value="2500" />2500</c:if> <c:if
                                       test="${tot_price>=10000 }">
                                       <c:set var="DlvPrice" value="0" />0</c:if>
                              </span> <span id="spnDlvPriceText">원</span>
                           </strong>
                           </li>
                           <li>
                              <p id="payTxt">보유 포인트</p> <strong id="ft_c1"> <span
                                 id="spnTotDcPrice">${point}</span> P
                           </strong>
                           </li>
                          <li>
                              <p id="payTxt">사용 가능 포인트</p> 
                              <strong id="ft_c2"> 
                              	<c:if test="${point >= 5000}">
                              		<span id="spnTotDcPrice">${point}</span> P
                           		</c:if>
                           		<c:if test="${point < 5000}">
                              		<span id="spnTotDcPrice">0</span> P
                          	 	</c:if>
                           </strong>
                           </li>
                           <li>
                              <p id="payTxt">사용 포인트</p> 
                              <c:if test="${point >= 5000}">
                              		<input type="text" id="pos_point"/>
                              	</c:if>
                              	<c:if test="${point < 5000}">
                              		<input type="text" id="pos_point" readonly="readonly"/>
                          	 	</c:if>
                           </li>
                           <li>
                              <div id="afterTxt">결제 후 포인트 적립</div> 
                              <c:if test="${sessionScope.dto.mem_grade == 'VIP'}">
                              	<c:set var="accuBtPt" value="${tot_price*(0.05)-(tot_price*(0.05)%100)}" /> 
                              </c:if>
                              <c:if test="${sessionScope.dto.mem_grade == 'GOLD'}">
                              	<c:set var="accuBtPt" value="${tot_price*(0.04)-(tot_price*(0.04)%100)}" /> 
                              </c:if>
                              <c:if test="${sessionScope.dto.mem_grade == 'SILVER'}">
                              	<c:set var="accuBtPt" value="${tot_price*(0.03)-(tot_price*(0.03)%100)}" /> 
                              </c:if>
                              <c:if test="${sessionScope.dto.mem_grade == 'Bronze'}">
                              	<c:set var="accuBtPt" value="${tot_price*(0.02)-(tot_price*(0.02)%100)}" /> 
                              </c:if>
                              <strong id="sssi">+<span id="accumBtPt">
                                 <fmt:formatNumber var="BtPt" value="${accuBtPt }" type="number" maxFractionDigits="0" />${BtPt }</span> P           
                           	  </strong>
                           </li>
                        </ul>
                     </dd>
                  </dl>
                  <!-- ----- -->


                  <div class="terms">
                     <div class="checkForm agreeBox">
                         <label for="u-agreeChk">주문상품 정보 및 결제 대행 서비스  이용약관에 모두 동의하십니까?
                           <input type="checkbox" class="ckbox" id="u-agreeChk"
                           name="agreeChk"></label>
                     </div>
                  </div>

                  <div class="payBtn mt20">
                     <span class="button1" id="payBtn" style=""><a
                        id="type1">결제하기</a></span>
                  </div>

                  <!-- ------ -->
               </div>
               <!-- --------------------- -->
            </div>
         </div>
      </div>
   </div>
</form>