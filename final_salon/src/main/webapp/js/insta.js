
$(document).ready(function(){
   getInsta(3); //3줄받아온다

   $(window).on('scroll',function(){
      if(view==false)return;
      if( $(window).scrollTop()>$('body').height()-1000){
         view=false;
          setTimeout(getInsta(3),150);
          setTimeout(function(){view=true},2000);
      }
   });
   
   
});

var view=true;
var datai;
function getInsta(count){
    for(var i=0;i<count;i++){
   $.ajax({
        type: "GET",
        dataType: "jsonp",
        url: "https://api.instagram.com/v1/users/8482842759/media/recent?access_token=8482842759.fcbbfc4.4b74c401a1764886bb7021945540ec8c",
        success: function(data) {
         var instatemplate ='<img class="insta-temp" src="images/insta-template.jpg"/>';
         var nemorowi=$('.nemorow').length;
         var nemoi=$('.nemo').length;
         datai=data.data.length;
         if(datai>nemoi){
         $('#nemo-wrapper').append('<div class="nemorow" id="nemo'+nemorowi+'row"></div>');
         for (var i = nemoi; i < nemoi+(datai-nemoi>=4 ? 4 : datai-nemoi); i++) {
            $('#nemo'+nemorowi+'row').append('<div class="nemo"></div>');
            $(".nemorow").children('.nemo').eq(i).append(instatemplate);
            $(".nemorow").children('.nemo').eq(i).append("<a class='nemoimg' target='_blank' href='" + data.data[i].link + "'><img class='instaimg' src='" + data.data[i].images.low_resolution.url + "'></img></a>");
          }
         
         }else{
            view=false;
         }
         
        }
   
      });//end ajax
    }//end for
   
}

