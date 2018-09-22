$(document).ready(function(){
   
   
    $('#proListViewSetBtn').on('click',function(){//수정버틈 누름
       $('#proView-price').append('<input type="number" name="goods_price" value="'+$('#proView-pricee').text()+'">');
       $('#proView-price').find('*').not('input').remove();
       
       $('#proView-count').append('<input type="number" min="0" id="total_count" name="total_count" value="'+$('#proView-count').text()+'">');
       $('#proView-count').find('*').not('input').remove();
      
       $('.colorHidden').css('display','inline');
       
       $('.proView-colorcount').find('*').not('input').remove();
        $('#proListViewSet').css('display','inline');
        
       $('#colorModiAdd').css('display','block');
       
       $('.modi-xBtn2').css('display','inline');
      $(this).remove();
       return false;
     }); //수정
    
    $('#proListViewSet').on('click',function(){
       var insChk = 0;
       $('.colorHidden').each(function(index){
          if($(this).val()==''){
             insChk += 1;
          }
       });
       
         //옵션인덱스
         $('.colorImgBox').each(function(i,val){
            $(val).find('.goods_count').attr('name','optListAdd['+i+'].goods_count');
            $(val).find('.goods_color').attr('name','optListAdd['+i+'].goods_color');
            $(val).find('.hiddenBox').attr('name','optListAdd['+i+'].goods_color_file');
         });
       
      if(insChk==0){
          $(this).submit();
      }else{
         alert('수량을 입력하세요');
         return false;
      }
    });
});//end document

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
     
      
   }
} // end addColor














function removeBox(event) {
   $(event.target).parents('.colorImgBox').remove();
   event.preventDefault();
}

function removeColor(index,goods_code2){
   $.ajax({
      type:'GET',
      dataType:'json',
      url:'ad_removeColor.do?goods_code2='+goods_code2,
      success:function(res){
         $('#optColor'+index).remove();
      }
      
   });
}




