$(document).ready(function(){


$("#register").on('click',function(){
      $('#frm').attr('action',"register.do");
      $('#frm').submit(); 
   
});
   
$('#cstmTab1').on('click',function(){
   $('#frm').attr('action',"notice.do"); 
   $('#frm').submit(); 
});
  
   
 /*var id = "${sessionScope.dto.id}";*/
$("#cstmTab1").hover(  
           function(){
           $(this).css("background-color", "white");
           },   
             
           function(){ 
           $(this).css("background-color", "#f54a7e");
 });

$("#cstmTab2").hover(  
        function(){ 
        $(this).css("background-color", "#f54a7e");
        $("#cstmTab1").css("background-color", "white");
        },   
         
        function(){
           $(this).css("background-color", "white");
        $("#cstmTab1").css("background-color", "#f54a7e");
});
   

$("#cstmTab3").hover(  
        function(){ 
        $(this).css("background-color", "#f54a7e");
        $("#cstmTab2").css("background-color", "white");
        $("#cstmTab1").css("background-color", "white");
        },   
         
        function(){ 
        $(this).css("background-color", "white");
        $("#cstmTab1").css("background-color", "#f54a7e");
});

 
});



 

function fnPullDownButton(obj) { 
   var _group = $(obj).parents('.pull_down_group');
   if ($(_group).hasClass('open')) {
      $(_group).removeClass('open');
      $(_group).find('.pull_down_con').slideUp(150);
   } else { 
      $(_group).addClass('open');
      $(_group).find('.pull_down_con').slideDown(150);
   }
   return false;
} 