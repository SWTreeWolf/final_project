$(document).ready(function() {
//               $('#goods_group1')
//                     .on(
//                           'change',
//                           function() {
//                              var group1 = $(this).val();
//                              var group2 = $('#goods_group2');
//                              group2.empty();
//                              if (group1 == '아이') {
//                                 group2
//                                       .append('<option value="싱글섀도우">싱글섀도우</option><option value="마스카라">마스카라</option><option value="아이라이너">아이라이너</option>'
//                                             + '<option value="아이브로우">아이브로우</option>');
//                              } else if (group1 == '립') {
//                                 group2
//                                       .append('<option value="립스틱">립스틱</option><option value="립틴트">립틴트</option>');
//                              } else if (group1 == '페이스') {
//                                 group2
//                                       .append('<option value="쿠션">쿠션</option><option value="파운데이션/BB">파운데이션/BB</option>');
//                              } else if (group1 == '네일') {
//                                 group2
//                                       .append('<option value="네일컬러">네일컬러</option>');
//                              } else if (group1 == '향수') {
//                                 group2
//                                       .append('<option value="향수">향수</option>');
//                              } else if (group1 == '화장소품') {
//                                 group2
//                                       .append('<option value="브러쉬">브러쉬</option><option value="퍼프">퍼프</option><option value="화장도구">화장도구</option><option value="파우치">파우치</option>');
//                              }
//
//                           });
// 							 /////////////////////////////////////////////////////////////////////
               
               
               $("#goods_reg").on('click', function() {
                  var submit=true;
                  $('#goods_reg').find('input').not('#goods_color').not('#goods_count').not('#colorPick').each(function(index) {
                     if ($(this).val().length < 1) {
                        submit=false;
                     }else{
                        if($('#colorChk').val()=='no'){
                           if($('#goods_count').val()==""){
                              submit=false;
                           }
                        }else{
                           if($('#goods_color').val()==""||$('#colorPick').val()==""||$('#goods_count').val()==""){
                              submit=false;
                           }
                        }
                     }
                  });
                  if($('#colorChk').val()=='yes'){
                  if($('#goods_content').val().length<1||$('.colorImgBox').length<1){
                     submit=false;
                  }
                  }
                  //옵션인덱스
                  $('.colorImgBox').each(function(i,val){
                     $(val).find('.goods_count').attr('name','optList['+i+'].goods_count');
                     $(val).find('.goods_color').attr('name','optList['+i+'].goods_color');
                     $(val).find('.hiddenBox').attr('name','optList['+i+'].goods_color_file');
                  });
                 
                  if($('#colorChk').val()=='yes'){
                  $('#goods_count').attr('name','');
                  }
                  if(submit){
                     $('#proRegi').submit();
                  }else{
                     alert("값을 제대로 입력해 주세요.");
                  } 
               });

               $('#colorChk').on('change', function() {
                  if ($(this).val() == 'no') {
                     $('#colorAddBox').empty();
                     $('#addBtn').css('display', 'none');
                     $('#goods_color').remove();
                     $('#colorPick').remove();
                     $('#colorNameIns').text("");
                  } else {
      
                     $('#addBtn').css('display', 'inline');
                     $('#colorNameIns').text("색상명 : ");
                     $('#colorNameIns').append('<input type="text" id="goods_color" name="goods_color" />');
                     $('#colorNameIns').append(' <input type="file" id="colorPick"/>');
                     
                  }
               });

               // ///////////////////////////////////////
               
            });
var input;
function openFile(event) {
   input = event.target;
   var reader = new FileReader();
   reader.onload = function() {
      var dataURL = reader.result;
      $(input).next().children('img').attr('src', dataURL);
      $(input).next().children('img').css('display', 'block');
   }
   reader.readAsDataURL(input.files[0]);
};

var list = [];
function addColor() {
   var src;
   var list = $('#colorPick')[0].files;
   var reader = new FileReader();
   if(list.length<1){alert("값을 제대로 입력해주세요");return false;}
   reader.readAsDataURL(list[0]);
   reader.onload = function() {
      src = this.result;
      var color = $('#goods_color').val();
      var count = $('#goods_count').val();
      if(color.length<1||count.length<1){alert("값을 제대로 입력해주세요");return false;}
      var div = '<div class="colorImgBox"'
            + '><img class="colorImg" src="'
            + src
            + '"/><span>'
            + color
            + ' X'
            + count
            + '개<span>'
            + '<span class="xBtn"><a href="#" onclick="removeBox(event)"><img '
            + 'src="https://www.etudehouse.com/kr/ko/web_resource/front/images/common/ico_close2.png"/></a></span>'
            + '<input type="hidden" value="' + count + '" class="goods_count"/><input type="hidden" value="' + color
            + '" class="goods_color"/></div>';
      
      $('#colorAddBox').append(div);
      var ele = document.getElementById("colorPick");
      var cl = ele.cloneNode(true);
      cl.removeAttribute("id");
      $(cl).addClass('hiddenBox');
      $('.colorImgBox').eq($('.colorImgBox').length-1).append(cl);
      
      $('#goods_color').val("");
      $('#colorPick').val("");
      $('#goods_count').val("");
      
   }
} // end addColor
function removeBox(event) {
   $(event.target).parents('.colorImgBox').remove();
   event.preventDefault();
}