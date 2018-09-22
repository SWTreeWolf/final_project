<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="mypost-wrapper">

  <div id="mypost-content">
    
    <div id="mypost-top"><h1>나의 게시물</h1></div>
    <div id="mypost-tab">
      <a class="mpt" id="mpt-review" href="#" onclick="reviewList(1)">나의 리뷰</a>
      <a class="mpt" id="mpt-comm" href="#" onclick="commuList(1)">커뮤니티</a>
    </div>
    
    <div id="mypost-count"><p id="my-count"></p></div>
    <table id="mypost-table">
	<!-- 나의 게시글 -->
    </table>
    <div id="mypost-bottom">
    <div id="mypost-page">
    <!-- 페이지 -->
    </div><!-- end mypost-page -->
    </div><!-- end mypost-bottom -->
    
    
  </div><!-- mypost-content -->
</div>
