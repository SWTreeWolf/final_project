<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
   <div id="ad_mList-wrapper">
      <!-- The Modal -->
      <div id="pointModal">
         <!-- Modal content -->
         <div id="pointModal-content">
            <span id="pointModal-close" onclick="point_close_modal()">&times;</span>
            <p id="pointModal-ask"><img src="https://image.flaticon.com/icons/svg/609/609624.svg" width="40px" height="40px"/>포인트 증정<img src="https://image.flaticon.com/icons/svg/609/609624.svg" width="40px" height="40px"/></p>
            <input type="hidden" id="myPoint" /><input type="hidden" id="myId" />
            <input type="hidden" id="ad_mList-standard" name="standard" value="no" />
            <input type="hidden" id="ad_mList-currentPage" name="currentPage" value="1" />
            <div id="pointModal-point">
               <p>
                  <label id="myPoint-owner"></label><span id="myPointText"></span>
               </p>
               <p>
                  <label>포인트 : </label><input type="number" id="newPoint" />
               </p>
            </div>
            <div id="pointModal_btn-wrapper">
               <a id="pointModal_btn" href="#" onclick="add_point_ajax()">증정하기</a>
            </div>
         </div>
      </div>
      <!-- The Modal 끝 -->
      <div id="ad_mList-content">
         <!-- table 뿌리는 곳 -->
      </div>
      <!-- end ad_mList-content -->
   </div>
   <!-- end ad_mList-wrapper -->

</body>