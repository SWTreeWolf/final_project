$(document).ready(function() {
	$("#imgwrite").on('click', function() {
		$('#frm').attr('action', "imgwrite.do");
		$('#frm').submit();
	});

	$("#eventup").on('click', function() {
		$('#frm').attr('action', "eventup.do");
		$('#frm').submit();
	});

});

function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : 'imagein.do',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(url) {
			/* alert(url); */
			$(el).summernote('editor.insertImage', url);
			$('#image').append(
					'<img src="' + url + '" width="auto" height="auto"/>');
		},
		error : function(e) {
			//alert("...아..");
			console.log(e);
		}
	});
}

function see() {
	var code = $('.summernote').summernote('code');
	/* alert(code); */
	document.getElementById("test").value = "";
	document.getElementById("test").value = $('.summernote').summernote('code');
	/* alert($('#test').val()); */

}

$(function() {
	if($('.summernote').ready[0] != null){
		$('.summernote').summernote({
			height : 500, // 기본 높이값
			minHeight : null, // 최소 높이값(null은 제한 없음)
			maxHeight : null, // 최대 높이값(null은 제한 없음)
			focus : false, // 페이지가 열릴때 포커스를 지정함
			lang : 'ko-KR', // 한국어 지정(기본값은 en-US)
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	}
});