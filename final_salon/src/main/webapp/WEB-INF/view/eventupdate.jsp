<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<!-- summer note korean language pack -->
<script src="summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" type="text/css" href="css/eventupdate.css" />  

</head>
<body>
	<div id="design" class="container"> 
		<form id="frm" class="form-mainEvent" method="post" enctype="multipart/form-data">
		<!-- <div id="design"> -->  
		<h1 class="page-header">메인 썸네일</h1>
		  	
			<div class="form-group1">
				<label for="name" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<input id="Event_Name" name="event_name" value='${dto.event_name}' />
				</div>
				
				<div id="mar">
				
				</div>
				
				 <label for="main" class="col-sm-2 control-label">메인 이미지</label>
				<div class="col-sm-10">
				<!--  	
				<input type="file" id="event_mainpic_file" name="event_mainpic_file"
						onchange="openFile(event)" />
						--> 
					<div class="imgView">
						<img class='outputView'
							src="${dto.event_mainpic}"/>    
					</div>
				</div> 
			</div>
			
			<div id="mar1"></div> 
		<h2 class="page-header">이벤트 내용 수정</h2>
			<div class="form-group2">
				<div class="col-sm-10"> 
					<div class="summernote">${dto.event_content}</div> 
					<input name="event_content" type="hidden" id="test" value=''>
				</div>
			</div>
			
			<div class="form-group3">
				<div class="col-sm-offset-2 col-sm-10">
				<!-- 	<button id="imgwrite" onclick="see()" class="btn btn-default">Save</button>  -->
					<button id="eventup" onclick="see()"  class="btn btn-default">이벤트 수정</button> 
					<input  name="event_num" type="hidden" value='${dto.event_num}'>
					
				</div>
			</div>
		</form>
	</div>
</body>
</html>