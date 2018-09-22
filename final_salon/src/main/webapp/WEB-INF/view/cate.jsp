<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="ctgr_con">
   <div class="tabCon_item clearfix" id="allCategory">
      <div class="listBox">
         <c:forEach items="${list}" var="list"> 
         <input type="hidden" name="goods_group1" value="${list.goods_group1}" />
         <input type="hidden" name="goods_group2" value="${list.goods_group2}" />
            <dl>
               <dt>
                  <a href="listPage.do?goods_group1=${list.goods_group1}" onclick="fnOnclickTrack('GNB','아이');">${list.goods_group1}</a>
               </dt>
               <c:forEach items="${list.goods_group2}" var="group2">
                  <dd>
                     <a href="listPage.do?goods_group1=${list.goods_group1}&goods_group2=${group2}" onclick="fnOnclickTrack('GNB','아이_싱글섀도우');">${group2}</a>
                  </dd>
               </c:forEach>

            </dl>
         </c:forEach>
 
      </div>
   </div>
</div> 