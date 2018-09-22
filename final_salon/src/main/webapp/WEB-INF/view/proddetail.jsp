<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


   <div class="detail_top">
   <input type="hidden" id="id" value="${sessionScope.dto.id}" />
         <!-- The Modal -->
      <div id="cartInsModal">
        <!-- Modal content -->
        <div id="cart_modal_content">
          <span id="cart_modal_close" onclick="cart_close_modal()">&times;</span>
          <p id="cart_ask">장바구니로 이동하시겠습니까?</p>
          <div id="cart_chk_btn"><a id="cart_yes_btn" href="cart.do?id=${sessionScope.dto.id}">네</a><a id="cart_no_btn" href="#" onclick="cart_close_modal()">좀더 볼래요</a></div>
        </div>

      </div>
      <!-- The Modal 끝 -->
      <div class="detail_img">
         <img alt="제품이미지" src="${pdto.goods_main }" />
      </div>
      <div class="detail_info">
           <!-- 장바구니로 넘겨줄값 -->
         <input type="hidden" id="detail_goods_code" name="goods_code" value="${requestScope.dto.goods_code}" />
         <input type="hidden" id="detail_id" name="id" value="${sessionScope.dto.id}" />
         <input type="hidden" id="detail_goods_price" name="goods_price" value="${requestScope.dto.goods_price}" />
         <input type="hidden" id="detail_goods_name" name="goods_name" value="${requestScope.dto.goods_name}" />
         <!-- 장바구니로 넘겨줄값 끝 -->
          <input type="hidden" id="goods_code" name="goods_code" value="${requestScope.dto.goods_code }" />
         <div class="prod_name">${requestScope.dto.goods_name }</div>
         <div class="prod_info">${requestScope.dto.goods_content }</div>
         <div class="prod_price">
            <table>
               <tr>
                  <th scope="row"><div class="won">${requestScope.dto.goods_price }</div></th>
                  <td class="price1">원</td>
               </tr>
            </table>
         </div>
         <div class="delivery">
            <table>
               <tr>
                  <th scope="row"><div class="deli_1">배송비</div></th>
                  <td class="deli_info">10,000원 이상 주문시 무료배송</td>
               </tr>
            </table>
         </div>
         <!-- 등급별 할인 넣기 -->
         <div class="point"></div>
      
      <!-- 컬러 옵션이 있을경우 -->
      <c:if test="${!empty odto }">
         <div class="opt_info">선택한 옵션 이름</div>
         <div class="option_list">
            <c:forEach items="${odto }" var ="i">
            
           <c:if test="${i.goods_count !=0 }">
            <a href="javascript:options('${i.goods_color}')"><input type="hidden" value="${i.goods_color}"/><img src="${i.goods_color_img }"></a> 
            </c:if>
            <c:if test="${i.goods_count ==0 }">
            <a href="javascript:options('${i.goods_color}')" class="zeroList"><input type="hidden" value="${i.goods_color}"/><img src="${i.goods_color_img }"></a> 
            </c:if>
            </c:forEach>
         </div>
   
         <div class="opt">
            <table>
               <tr>
                   <th scope="row">
                     <div class="selectbox">
                        <label for="select">선택</label> 
                        <select id="select">
                         <option value="선택" id="select_opt">선택</option>
                        <c:forEach items="${odto}" var="i">
                           <c:if test="${i.goods_count != 0 }">
                                 <option id="${i.goods_code2}" value="${i.goods_color}">
                                    ${i.goods_color} 
                                 </option>
                           </c:if>
                           <c:if test="${i.goods_count == 0 }">
                                 <option class="sold_out" id="${i.goods_code2}" value="${i.goods_color}">
                                    ${i.goods_color} - 품절된 상품입니다.
                                 </option>
                           </c:if>
                        </c:forEach>
                        </select> 
                     </div>
                  </th>
                  <td class="add"><input type="image" src="images/add.png" />
                  </td>
               </tr>
            </table>
         </div>
      
      <!-- 컬러 옵션에 있는 경우 끝 -->


         <div class="opt_sel_add">
    
         </div>
         
         </c:if>
      <!-- 컬러 옵션이 없는 경우 -->
      <c:if test="${empty odto }">
      <div class="opt_sel_add">
          <div class="left">
               <span class="name">${requestScope.dto.goods_name }</span>
            </div>
            <div class="right">
               <div class="countbox">
                  <div class="count_down">
                     
                  </div>
                  <div class="count">
                      <input type="hidden" value="${requestScope.dto.goods_code}" id="detail_goods_code"/>
                     <input id="count_down" type="image" src="images/count_down.gif" />
                     <input id="count_text" type="text" title="선택품목갯수" value="1" maxlength="3" />
                     <input class="detail_total_count" type="hidden" value="1"/>
                     <input id="count_up" type="image" src="images/count_up.gif" />
                  </div>
                  <div class="count_up">
                      
                  </div>
               </div>
               <div class="price_result">
                  <span class="price_item"><a id="price_result_won">${requestScope.dto.goods_price }</a><span class="result">원</span>
                  </span>
               </div>
            </div>
            </div>
      </c:if>
         
         <div class="total_price">
            <span class="tot">합계</span> 
            <c:if test="${!empty odto }">
               <span class="tot_price">0</span>
            </c:if> 
            <c:if test="${empty odto }">
               <span class="tot_price">${requestScope.dto.goods_price }</span>
            </c:if>
            <span class="tot_won">원</span>
         </div> 

         <div class="order_btn">
            <button type="button" title="바로구매" class="order">바로구매</button>
            <button type="button" title="장바구니" class="cart" onclick="cartIns('${sessionScope.dto.id}')">장바구니</button>
         </div>

      </div>
      <!-- detail_info -->


   </div>
   <!-- datail_top -->


   <div class="detail_view">
      <div class="detail_name">
         <span class="detail_info_view">제품상세</span>
      </div>
      <div class="detail_view_img"> 
         <img alt="제품정보이미지" src="${pdto.goods_detail}">
      </div>
   </div>
   <!-- detail_view -->

   <div class="de_info_n_in">
      <div class="de_info">
         <span class="de_info_view">상품정보/전성분 보기</span>
      </div>
   <div class="de_info_n_in1">
      <div class="info1">본 상품정보는 공정거래위원회의 「전자상거래 등에서의 상품정보제공 고시」에 따라
         작성되었습니다.</div>
      <table surmarry="전성분정보" id="table1">
         <!-- prdNtCd : PN01(화장품) -->
         <%-- <caption>전성분정보</caption> --%>
         <colgroup>
            <col style="width: 27%;">
            <col style="width: 73%;">
         </colgroup>
         <tbody>
            <tr>
               <th>제품명</th>
               <td>salon de boby 탄산 톡 틴트</td>
            </tr>
            <tr>
               <th>기능성 화장품의 경의 화장품에 따른 식품의약<br> 안전처 심사 필 유무
               </th>
               <td>해당사항없음</td>
            </tr>
            <tr>
               <th>용량</th>
               <td id="prdVol_1">4.6g / BL604 : 4g</td>
            </tr>
            <tr>
               <th>제품 주요 사양 - 피부타입, 색상(호,번)등</th>
               <td>모든피부용</td>
            </tr>
            <tr>
               <th>사용기한</th>
               <td>주문일로부터 2년 이상 남음</td>
            </tr>
            <tr>
               <th>사용방법</th>
               <td>
                  <div class="tdGuide">
                     [짜릿하게 즐기는 방법] <br>하나. 자판기에서 꺼내신 후 가볍게 흔들어 주세요. <br>둘.
                     입술 안쪽부터 톡톡 그라데이션 하거나 풀 립으로 가득 채워 짜릿하게 퍼지는 탄산향과 청량한 컬러감을 즐겨보세요. <br>셋.
                     제로 칼로리지만, 섭취하지 마세요! <br>
                  </div>
               </td>
            </tr>
            <tr>
               <th>제조사/제조국/제조판매업자</th>
               <td>(주)코코 /한국 /(주)salon de boby</td>
            </tr>
            <tr>

               <th scope="row">
                  <p>전성분</p>


                  <div class="viewselectbox">
                     <!-- <label for="select">BL601 밀키 소다</label>  -->
                     <select id="select">
                        <option selected>BL601 밀키 소다</option>
                        <option>OR201 자몽 판타지</option>
                        <option>PK001 복숭아 톡톡톡</option>
                     </select>
                  </div>
                  </div>
               </th>
               <td>
                  <div class="tdGuide" id="inGredient_1">하이드로제네이티드폴리아이소부텐,
                     아이소트라이데실아이소노나노에이트, 다이아이소스테아릴말레이트, 하이드로제네이티드스타이렌/아이소프렌코폴리머,
                     카프릴릭/카프릭트라이글리세라이드, 부틸렌/에틸렌/스타이렌코폴리머, 향료, 칼슘알루미늄보로실리케이트, 적색218호,
                     티타늄디옥사이드, 비에이치티, 폴리글리세릴-2트라이아이소스테아레이트, 청색1호, 황색4호</div>
               </td>


            </tr>
            <tr>
               <th>사용할 때 주의사항</th>
               <td>
                  <div class="tdGuide">
                     <div class="list_txtType2">
                        1) 화장품 사용 시 또는 사용 후 직사광선에 의하여 사용부위가 붉은반점, 부어오름 또는 가려움증 등의 이상
                        증상이나 부작용이 있는 경우 전문의 등과 상담할 것 <br>2) 상처가 있는 부위 등에는 사용을 자제할 것
                        <br>3) 보관 및 취급 시의 주의사항 <br> 가) 어린이의 손이 닿지 않는 곳에 보관할 것
                        <br> 나) 직사광선을 피해서 보관할 것
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <th>소비자 상담 관련 전화번호</th>
               <td>고객상담실 1544-9970</td>
            </tr>
            <tr>
               <th>품질보증기준</th>
               <td>본 상품에 이상이 있을 경우 공정거래위원회 고시 「소비자분쟁해결기준」에 따라 보상해드립니다</td>
            </tr>
         </tbody>
      </table>
   </div>
   </div>

   <div class="deli_info" id="rightGuide">

      <div class="deli_info_name">
         <span class="deli_info_view">배송/교환/반품 안내</span>
      </div>

      <div class="deli_table">
         <div class="tblType1">
            <table surmarry="배송정보">
               <%-- <caption>배송정보</caption> --%>
               <colgroup>
                  <col style="width: 14%;">
                  <col style="width: 86%;">
               </colgroup>
               <tbody>
                  <tr>
                     <th>배송비</th>
                     <td>할인 적용 후 최종 결제금액이 10,000원 이상인 경우 무료배송, 10,000원 미만인 경우
                        2,500원 입니다. (2018.8.21 부터 적용)</td>
                  </tr>
                  <tr>
                     <th>발송마감시간</th>
                     <td>평일(월~금) 오후 2시 (토/일/공휴일 휴무 / 당사 사정상 마감시간이 변경될 수 있습니다.)</td>
                  </tr>
                  <tr>
                     <th>배송시간</th>
                     <td>발송 마감시간 이전 주문건은 1~2일 소요 (단, 택배사 및 기타 사정으로 인해 2~5일 정도 늦어질
                        수 있습니다.)</td>
                  </tr>
                  <tr>
                     <th>이용택배사</th>
                     <td>CJ대한통운(1588-1255), GS25편의점택배 (1577-1287),
                        CU편의점택배(1566-1025)</td>
                  </tr>
               </tbody>
            </table>
         </div>

         <div class="list_txtType1">
            <dl>
               <dt>배송관련 유의사항</dt>
               <dd>배송은 대한민국 전국 어디라도 가능합니다.</dd>
               <dd>한정된 수량으로 더 많은 고객님들께 혜택을 드리기 위하여, 대량 주문시 임의 취소 될 수 있습니다.</dd>
               <dd>1. 1일 1아이디당 10건 혹은 총 금액 50만원 이상 주문</dd>
               <dd>2. 여러 아이디를 사용한 동일 주소지로 주문</dd>
            </dl>
            <dl>
               <dt>교환 및 반품관련 유의사항</dt>
               <dd class="dd_tit">무료반품 서비스</dd>
               <dd>- salon de boby 쇼핑몰에서 상품을 구매한 회원이 상품을 배송받은 날로부터 30일이내 개봉하지
                  않은 상품의 반품을 신청할 경우 반품에 소요되는 배송비를 회사가 부담하는 서비스입니다.</dd>
               <dd>- 서비스 이용 기준 : 회원 월 1회 (반품신청 당시의 회원등급기준, 결제금액
                  10,000원 이상이면 신청가능)</dd>
            </dl>
            <dl>
               <dt>교환/반품이 가능한 경우</dt>
               <dd>- 단순변심, 착오구매에 따른 교환/반품 신청은 상품을 공급받은 날부터 7일 이내 가능합니다. (배송비
                  고객 부담)</dd>
               <dd>- 다만, 공급받은 상품이 표시/광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 상품을 공급받은
                  날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내 교환/반품 신청을 하실 수 있습니다.
                  (배송비 회사 부담)</dd>
               <dd>- 온라인 구매 상품은 온라인에서만 반품/교환이 가능하며, 구매시 제공 받은 사은품/증정품의 경우 상품
                  교환/ 반품시 함께 보내주셔야 합니다.</dd>
               <dd>- 교환/반품은 [salon de boby&gt;쇼핑몰주문조회&gt;교환/반품 신청하기]를 통해 직접 신청하시거나
                  쇼핑몰 고객센터&gt;1:1상담이나 고객센터(1544-9970)에 전화해 주세요.</dd>
            </dl>
            <dl>
               <dt>교환/반품이 불가능한 경우</dt>
               <dd>1. 고객에게 책임이 있는 사유로 상품이 멸실되거나 훼손된 경우 (상품내용을 확인하기 위하여 포장 등을
                  훼손한 경우는 제외)</dd>
               <dd>2. 고객의 사용 또는 일부 소비로 상품 가치가 현저히 감소한 경우</dd>
               <dd>3. 시간이 지나 다시 판매하기 곤란할 정도로 상품 가치가 현저히 감소한 경우</dd>
               <dd>4. 복제가 가능한 상품의 포장을 훼손한 경우</dd>
               <dd>5. 고객의 주문에 따라 개별적으로 생산되는 상품 또는 이와 유사한 상품에 대하여 청약철회등을 인정하는
                  경우 통신판매업자에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여 별도로 그 사실을
                  고지하고 고객의 서면(전자문서 포함)에 의한 동의를 받은 경우</dd>
            </dl>
            <dl>
               <dt>불만처리 및 분쟁해결</dt>
               <dd>- 교환/반품/대금환불 등에 대한 문의사항 및 불만처리 요청은 쇼핑몰의 1:1문의 게시판을 이용하시거나
                  쇼핑몰 고객센터[1544-9970 / *운영시간: (월~금) 09:00~18:00 , 토/일/공휴일 휴무]로 연락주시면
                  됩니다.</dd>
               <dd>- 본 상품의 품질보증 및 피해보상에 관한 사항은 관련 법률 및 공정거래위원회 고시
                  「소비자분쟁해결기준」에 따릅니다.</dd>
            </dl>
            <dl>
               <dt>미성년자 계약 취소에 대한 안내</dt>
               <dd>- 해당 상품 구매 계약자가 미성년자일 경우 법정대리인이 동의하지 아니하면 미성년자 본인 또는
                  법정대리인은 이 계약을 취소할 수 있습니다.</dd>
               <br>
               <dd>- 타사와의 제휴서비스를 이용한 주문 건 (선불카드로 결제한 주문 건, 모바일 상품권을 사용한 주문 건
                  등)은 전체반품만 가능합니다. (부분반품 처리불가)</dd>
               <dd>- 선불카드의 부여받은 보너스 금액과 모바일 상품권은 제공 시 고지된 유효기간이 지나면 사용하거나 환불
                  받을 수 없습니다.</dd>
               <dd>- 포인트, 쿠폰 등이 적용된 할인가격은 salon de boby&gt;주문조회&gt;최종결제금액 에서 확인 할 수
                  있습니다.</dd>
               <dd>- 피부트러블로 인한 반품의 경우, 사전에 쇼핑몰 고객센터[1544-9970]로 문의 주신 후 피부과
                  진단서를 함께 보내주시면 배송비는 (주)salon de boby에서 부담합니다.</dd>
               <dd>- 배송기사님 방문시 부재중이거나 수취인 주소가 불명확하여 반송된 건은 재배송시 배송비를 고객님이
                  부담하셔야 합니다.</dd>
               <dd>- 수취거부나 환불을 원하시는 경우 배송비(배송비가 무료인 경우 왕복, 배송비를 부담하신 경우 편도) 를
                  부담하셔야 하며, 상품 반송이 확인된 후에 환불됩니다.</dd>
               <dd>- 반품 시 상품대금 환불은 상품 회수 및 청약철회가 확정된 날부터 3영업일 이내 진행되며, 기한을
                  초과한 경우 지연 기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」에서 정하는 이율을 곱하여 산정한
                  지연이자를 지급한다.</dd>
            </dl>
         </div>

         <p class="txtC">기타 자세한 사항이나 더 궁금하신 점은 FAQ, 이용약관을 참고해주시고, 고객센터를 통해
            문의해주세요.</p>
      </div>
   </div>
   <!-- end deli_info -->

  <div class="wrap1">
      <div class="space"></div>
      <div class="hr2"></div>
      <br/>
      <div class="option">
         <span id="write">
            <a href="reviewWrite.do?goods_code=${requestScope.dto.goods_code}&goods_name=${requestScope.dto.goods_name}" id="aa">
            리뷰 & 팁 작성
            </a>
         </span>
      </div>
       
      
      <div class="tj">
      
      </div>
   
   </div>
   
   <form id ="directFrm" action="directBuy.do" method="post"> 
   	  <input type="hidden" value="${sessionScope.dto.id }" name="id" />
      <input type="hidden" value="${requestScope.dto.goods_name }" name="goods_name"/>
      <input type="hidden" value="${requestScope.dto.goods_price }" name="goods_price"/>
      <input type="hidden" value="${pdto.goods_main }" name="goods_main"/>
      <input type="hidden" value="${pdto.goods_code }" name="goods_code"/>
   </form>