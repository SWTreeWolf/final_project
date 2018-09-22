<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/mypage.css"/>
<link rel="stylesheet" type="text/css" href="css/my_orderList.css"/>
<link rel="stylesheet" type="text/css" href="css/my_orderView.css"/>
<link rel="stylesheet" type="text/css" href="css/my_email.css"/>
<link rel="stylesheet" type="text/css" href="css/my_post.css"/>
<link rel="stylesheet" type="text/css" href="css/signup.css"/>
<link rel="stylesheet" type="text/css" href="css/pay.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/recentlyItem.js"></script>
<script type="text/javascript" src="js/my_post.js"></script>
<script type="text/javascript" src="js/my_orderList.js"></script>
<script type="text/javascript" src="js/footer.js"></script>
<script type="text/javascript" src="js/profile.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript" src="js/member_unlink.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	$('.category_btn').on("click", function() {
		var img = $(this).children().children();
		if (img.attr('src') == 'images/down.png') {
			img.attr('src', 'images/up.png');
		} else if (img.attr('src') == 'images/up.png') {
			img.attr('src', 'images/down.png');
			$('#cate_menu').slideUp('slow');
		}
		if ($(".categoryWrap").css("top") == "-800px") {
			$(".categoryWrap").animate({
				top : 0
			})
		} else {
			$(".categoryWrap").animate({
				top : -800
			})
		}
	});

});
$('body').mouseover(function(){
  $(this).css({cursor: 'none'});
});

$(document).on('mousemove', function(e){
  $('#cursor').css({
    left:  e.pageX,
    top:   e.pageY
  });
});

$(document).on('click',function(){
	if($('#cursorImg').attr('src')=="https://image.flaticon.com/icons/png/512/1077/1077893.png"){
		$('#cursorImg').attr('src','https://image.flaticon.com/icons/svg/1090/1090920.svg');
	}else if($('#cursorImg').attr('src')=="https://image.flaticon.com/icons/svg/1090/1090920.svg"){
		$('#cursorImg').attr('src','https://image.flaticon.com/icons/svg/1103/1103172.svg');
	}else if($('#cursorImg').attr('src')=="https://image.flaticon.com/icons/svg/1103/1103172.svg"){
		$('#cursorImg').attr('src','https://image.flaticon.com/icons/png/512/1077/1077893.png');
	}
	});
</script>
</head>

<body>
   <header>
		<p>
			<tiles:insertAttribute name="header" ignore="ture" />
		</p>
	</header>
   <section>
   <article id="my_menu">
   <div id="cursor">
  <div id="smile"><img id="cursorImg" src="https://image.flaticon.com/icons/png/512/1077/1077893.png"></div>
	</div> 
      <tiles:insertAttribute name="my_side" ignore="true" />
   </article>
   <article id="my_section">
      <p>
         <tiles:insertAttribute name="body" ignore="true" />
      </p>
   </article>
   </section>
   <footer>
      <p>
         <tiles:insertAttribute name="footer" ignore="true" />
      </p>
   </footer>
</body>
</html>