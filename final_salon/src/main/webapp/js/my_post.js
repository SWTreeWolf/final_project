$(document).ready(function(){
	reviewList(1);//리뷰
	$(document).on('click','#moresub',function(e){
	
		if($(this).parent().parent().next().css('display')=='contents'){
			$(this).parent().parent().next().css('display','none');
		}else{
			$(this).parent().parent().next().css('display','contents');
		}
		
	});
});

function commuList(currentPage){
	$('#mpt-review').css("border-bottom","1px solid lightgrey");
	$('#mpt-review').css("color","black");
	$('#mpt-comm').css("border-bottom","2px solid hotpink");
	$('#mpt-comm').css("color","hotpink");
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'my_commuList.do?currentPage='+currentPage,
		success:function(res){
			$('#mypost-table').empty();
			$('#mypost-page').empty();
			var pdto=res.pdto;
			var clist=res.clist;
			$('#my-count').text("총 게시글 : "+pdto.totalCount+" 개");
			$('#mypost-table').append("<tr><th>작성일자</th><th>제목</th><th>카테고리</th></tr>");
			if(clist.length==0){$('#mypost-table').append("<td colspan='5'>게시글이 없습니다.</td>");}
			$(clist).each(function(i,v){
				var tr="<tr><td>"+new Date(v.regdate).toISOString().slice(0, 10)+"</td><td><a href='commuview.do?commuNum="+v.commuNum+"' class='my_sub'>"+v.subject+"</a></td><td>"+v.category+"</td></tr>";
				$('#mypost-table').append(tr);
			});

			var page="";
			page+="<a ";
			if(pdto.startPage<=1){page+="class='nmback' "} //이전버튼
			else{page+="class='mback' href='commuList("+pdto.startPage-pdto.blockPage+") "}
			page+=">⍇</a>";
			for(var d=pdto.startPage;d<=pdto.endPage;d++){//페이지
				page+="<a class='my-page' href='#' onclick='commuList("+d+")'";
				if(d==pdto.currentPage){ page+=" style='background:hotpink' "}
				page+=" >"+d+"</a>";		
			}
			
			for(var e=pdto.endPage+1;e<=pdto.startPage+pdto.blockPage-1;e++){//없는페이지
				page+="<a class='nmy-page'>"+e+"</a>";
			}
			page+="<a ";
			if(pdto.totalPage <= pdto.endPage){page+="class='nmforward' "}//다음버튼
			else{page+="class='mforward' href='commuList("+pdto.endPage+1+") "};
			page+=">⍈</a>";
		
			$('#mypost-page').append(page);
			
		},
		error:function(){
			//alert("에러 낫음");
		}
		});
}

function reviewList(currentPage){
	$('#mpt-comm').css("border-bottom","1px solid lightgrey");
	$('#mpt-comm').css("color","black");
	$('#mpt-review').css("border-bottom","2px solid hotpink");
	$('#mpt-review').css("color","hotpink");
	
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'my_reviewList.do?currentPage='+currentPage,
		success:function(res){
			$('#mypost-table').empty();
			$('#mypost-page').empty();
			var pdto=res.pdto;
			var rlist=res.rlist;
			$('#my-count').text("총 게시글 : "+pdto.totalCount+" 개");
			$('#mypost-table').append("<tr><th>작성일자</th><th>제목</th><th>상품</th><th>옵션</th><th>평점</th></tr>");
			if(rlist.length==0){$('#mypost-table').append("<td colspan='5'>게시글이 없습니다.</td>");}
			$(rlist).each(function(i,v){
				var goods_name=v.goods_option.split("-")[0];
				var goods_option=v.goods_option.split("-")[1];
				var tr="<tr><td>"+new Date(v.chk).toISOString().slice(0, 10)+"</td><td><a href='#' id ='moresub'>"+v.sub+"</a></td><td>"+goods_name+
				"</td><td>"+goods_option+"</td><td>";
			
				
			for(var i=1;i<=v.rate;i++){tr+="💗"}tr+="</td></tr><tr style='display:none'><td colspan='5'>"+v.review_content+"</td></tr>";
				$('#mypost-table').append(tr);
				
				
				
			});
			
			//페이지
			var page="";
			page+="<a ";
			if(pdto.startPage<=1){page+="class='nmback' "} //이전버튼
			else{page+="class='mback' href='reviewList("+pdto.startPage-pdto.blockPage+") "}
			page+=">⍇</a>";
			
			for(var i=pdto.startPage;i<=pdto.endPage;i++){//페이지

				page+="<a class='my-page' href='#' onclick='reviewList("+i+")'";
				if(i==pdto.currentPage){page+=" style='background:hotpink'"}
				page+=" >"+i+"</a>";			
			}
			for(var e=pdto.endPage+1;e<=pdto.startPage+pdto.blockPage-1;e++){//없는페이지
				page+="<a class='nmy-page'>"+e+"</a>";
			}
			page+="<a ";
			if(pdto.totalPage <= pdto.endPage){page+="class='nmforward' "}//다음버튼
			else{page+="class='mforward' href='reviewList("+pdto.endPage+1+") "};
			page+=">⍈</a>";
		
			$('#mypost-page').append(page);
			
		}
		
	});
}