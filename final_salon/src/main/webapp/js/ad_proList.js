$(document).ready(function(){
	
	
/*  $('#goods_group1').on('change',function(){
    var group1=$(this).val();
    var group2= $('#goods_group2');
    group2.empty();
    if(group1=='아이'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option><option value="싱글섀도우">싱글섀도우</option><option value="마스카라">마스카라</option><option value="아이라이너">아이라이너</option>'
                    +'<option value="아이브로우">아이브로우</option>');
    }else if(group1=='립'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option><option value="립스틱">립스틱</option><option value="립틴트">립틴트</option>');
    }else if(group1=='페이스'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option><option value="쿠션">쿠션</option><option value="파운데이션/BB">파운데이션/BB</option>');
    }else if(group1=='네일'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option><option value="네일컬러">네일컬러</option>');
    }else if(group1=='향수'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option><option value="향수">향수</option>');
    }else if(group1=='화장소품'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option><option value="브러쉬">브러쉬</option><option value="퍼프">퍼프</option><option value="화장도구">화장도구</option><option value="파우치">파우치</option>');
    }else if(group1=='선택안함'){
      group2.append('<option value="선택안함">▒▒선택안함▒▒</option>');
    }
  });
  */
	$('#searchBy').val("${regiDTO.searchBy}");
	if($('#searchBy').val()==null){
		$('#searchBy').val("상품이름");
	}
	
  $('#list_form').on('submit',function(){
	  if($('#countChk').val()==''){
		  $('#countChk').val(0);
  		}
  });
  
  $('#list_search_btn').on('click',function(){
	  $('#currentPage').val(1);
  });

});


function searchPage(currentPage){
	$('#currentPage').val(currentPage);
	$('#list_form').submit();
}


