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
<link rel="stylesheet" type="text/css" href="css/eventWrite.css" />

</head>
<body>
	<div class="container">
		<h3>이벤트 기간</h3>

		<form id="frm" class="form-mainEvent" method="post"
			enctype="multipart/form-data">
			<input name="start_date" id="start_date" type="date"> <a
				id="lee">~</a> <input name="end_date" id="end_date" type="date">


			<div id="desia">
				<h1 class="header">메인 & 썸네일</h1>

			</div>
			<div class="form-group1">
				<label for="name" class="col-sm-2 control-label" style="margin-top: 18px;">이벤트 타이틀</label>
				<div id="desia1" class="col-sm-10">
					<input id="Event_Name" name="event_name" value='' />
				</div>
				<label for="main" class="col-sm-2 control-label">메인 이미지</label>
				<div class="col-sm-10">
					<input type="file" id="event_mainpic_file"
						name="event_mainpic_file" onchange="openFile(event)" />
					<div class="imgView">
						<img class='outputView'
							src="http://icons.iconarchive.com/icons/iconsmind/outline/512/Cursor-Select-icon.png" />
					</div>
				</div>
			</div>
			<div id="desia2">
				<h2 class="page-header">이벤트 내용 등록</h2>
			</div>
			<div class="form-group2">

				<div class="col-sm-10">
					<input class="summernote" /> <input name="event_content"
						type="hidden" id="test" value=''>
				</div>
			</div>

			<div class="form-group3">
				<div class="col-sm-offset-2 col-sm-10">
					<button id="evimgwrite" onclick="see()" class="btn btn-default">Save</button>

				</div>
			</div>


		</form>
	</div>


</body>
</html>