<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="mainCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="instaCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="signinCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="signupCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="listpageCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="eventCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="mypageCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="cartCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="detailCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="tableCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="payCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="reviewWriteCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="reViewCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="ad_proListCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="ad_proListViewCss" />' />
<link rel="stylesheet" type="text/css"
	href='<tiles:getAsString name="ad_registerCss" />' />
<link rel="stylesheet" type="text/css" href='<tiles:getAsString name="customerCss" />' />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.7-rc20180406.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/banner.js"></script>
<script type="text/javascript" src="js/insta.js"></script>
<script type="text/javascript" src="js/event.js"></script>
<script type="text/javascript" src="js/detail.js"></script>
<script type="text/javascript" src="js/signupdetail.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/ad_proList.js"></script>
<script type="text/javascript" src="js/ad_proListView.js"></script>
<script type="text/javascript" src="js/ad_register.js"></script>
<script type="text/javascript" src="js/pay.js"></script>
<script type="text/javascript" src="js/direct.js"></script>
<script type="text/javascript" src="js/prodlist.js"></script>
<script type="text/javascript" src="js/customer.js"></script>
<script type="text/javascript" src="js/fnqwrite.js"></script> 
<script type="text/javascript" src="js/nowrite.js"></script>   
<script type="text/javascript" src="js/footer.js"></script>
<script type="text/javascript" src="js/recentlyItem.js"></script>
<script type="text/javascript" src="js/event.js"></script>  
<script type="text/javascript" src="js/eventWrite.js"></script>         
<script type="text/javascript" src="js/eventupdate.js"></script>
<script type="text/javascript" src="js/eventPage.js"></script>    
<script type="text/javascript" src="js/mailForm.js"></script> 
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
</script>
</head>

<body>
	<header>
		<p>
			<tiles:insertAttribute name="header" ignore="ture" />
		</p>
	</header>

	<%-- 	<menu>
		<tiles:insertAttribute name="menu" ignore="ture" />
	</menu> --%>
	<section>
		<p>
			<tiles:insertAttribute name="body" ignore="ture" />
		</p>
	</section>
	<footer>
		<p>
			<tiles:insertAttribute name="footer" ignore="ture" />
		</p>
	</footer>
</body>
</html>