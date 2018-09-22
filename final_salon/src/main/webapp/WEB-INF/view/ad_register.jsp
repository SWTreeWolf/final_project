<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body> 





<div id="regi-wrapper">
  <div id="regi-content">
    <div id="regi-con-content">
    <div id ="regi-top"><h1>상품등록</h1></div>
   <div id="regi_input">
   <form id="proRegi" action="form_sub.do" method="post" enctype="multipart/form-data">
    <table id="regi-table">
      <tr>
      <th>상품명</th><td>
      <input type="text" id="goods_name" name="goods_name" width="1000px" /></td> </tr>
      <tr>
      <th>가격:</th>
        <td><input type="text" id="goods_price" name="goods_price" /><span>원</span></td> </tr> 
      <tr>
        <th>상품 카테고리</th>
        <td>
      <label>그룹1:</label>
  <input type="text" id="goods_group1" name="goods_group1" />
  
      <label>그룹2:</label>
         <input type="text" id="goods_group2" name="goods_group2" /></td></tr>
      
  <tr>
      <th>상품설명</th>
    <td>
      <textarea id="goods_content" name="goods_content" rows="6" cols="70"></textarea>
     </td>
      </tr>
      <tr>
      <th>메인이미지</th>
        <td>
      <input type="file" id="goods_main" name="goods_main_file" onchange="openFile(event)"/>
    <div class="imgView"><img class='outputView' src="http://icons.iconarchive.com/icons/iconsmind/outline/512/Cursor-Select-icon.png"/></div>
        </td>
      </tr>
      <tr>
      <th>디테일이미지</th>
        <td>
      <input type="file" id="goods_detail" name="goods_detail_file" onchange="openFile(event)"/>
    <div class="imgView"><img class='outputView' src="http://icons.iconarchive.com/icons/iconsmind/outline/512/Cursor-Select-icon.png"/></div>
        </td>
      </tr>
      <tr>
        <th>색상추가</th>
        <td>
         <label>색상</label>
          <select id="colorChk"><option value="yes">색상추가</opiton>
    <option value="no">색상없음</opiton>
    </select>
    <span id="colorPickSpan">
      <label id="colorNameIns">색상명:
      <input type="text" id="goods_color" name="goods_color" />
      <input type="file" id="colorPick"/>
      </label>
      </span>
      <label id="countLabel">갯수:</label>
       <input type="text" id="goods_count" name="total_count" />
          <button id="addBtn" type="button" onclick="addColor()">추가</button>
  
          <div id="colorAddBox"> 
        <!--여기에 색상이미지가 들어갑니다-->
        </div>
        </td>        
      </tr>
    </table>
   <input type="button" id="goods_reg" value="등록" />
   
   </form>
   </div>
      <!--end regi-input-->

</div><!--end regi-con-content-->
</div><!--end regi-content-->
</div><!--end reg-wrapper-->



</body>