<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
   src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/mypage.css" />
<script type="text/javascript">
$(document).ready(function(){ 
    
	   var date = new Date();

	   var year = date.getFullYear();
	   var month = date.getMonth()+1;
	   var day = date.getDate(); 

	   if ((month+"").length < 2) {
	      month = "0" + month; 
	   }    


	   if ((day+"").length < 2) {
	       day = "0" + day;
	   }    

	   var getDate = year+ month + day;
	    var stand = parseInt(getDate);    


	    var length=0;
	   var count=0;
	   var out=0;
	   var y_all=0;
	    
	    

	      $.ajax({
	         type : 'GET',
	         url : 'eve.do',
	         dataType : 'json',
	         success : function(res) {
	            
	            
	               
	             for(var i=0; i<res.length; i++){   
	                
	             
	                   var  asff=res[i].end_date; 
	                   var test2 = asff.replace(/\-/g,''); 
	                    var test3 = parseInt(test2); 
	                     
	                    if(test3>stand) {  
	                         y_all++;
	                         
	                         $(".slick-items5").append('<div><a href="eventPage.do?num='+res[i].event_num+'" id="banner"><img id="mainimg" style="height: 326.66px; width: 940px;" src="'+res[i].event_mainpic+'"/></a></div>');
	                         
	                         
	         
	                         
	                         
	                         
	                    }
	                    count++;
	                    
	               
	              }
	              
	            
	             $('.slick-items5').slick({ 
	            
	                 infinite: true,
	                 autoplay : true,
	                 speed: 300,
	                 slidesToShow: 1,
	                 arrows: false,
	                 adaptiveHeight: true,
	            });
	            
	      
	            
	            
	         
	            
	         }
	      }); 
	   
	   
	   
	   });   


</script>
</head>
<body>
<div id ="container">
 <div class="content myetdArea"> 
   <div class="myetdCon">
      
      <!--  ....................-->
      <div class="mainTop hello"><!-- 등급별 class명 (hello,guest,friends,pinklove) -->
					<!-- 180320 -->
					<div class="gradeBox btPt gradeBox_180320">
						<div class="boxTxt"><span >${sessionScope.dto.name}님은</span></br><span>${sessionScope.dto.mem_grade} 등급입니다.</span></div>
					</div>
					<!-- // 180320 -->
					<div class="haveBox">
						<ul>
							
							<li>
								<a href="/kr/ko/myPoint.do?method=cashPntList">
									<img src="https://image.flaticon.com/icons/png/512/1103/1103185.png" width="30px" height="30px"/>바비 포인트
									<span class="num">${point}</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				 
				<!-- ............. -->
				  	 
				<div class="mainMid">
					<div class="midL">
						<div class="myProcess">
							<div class="proTit">내 주문내역</div>
							<ul>
								<li>
									
										<div class="num">${cartCount}</div>
									
									<div class="txt">장바구니</div>
									<span class="ico"></span>
								</li>
								
								<!-- 결제완료 -->
								<li>
									
										<div class="num">${cart1}</div>
									
									<div class="txt">결제완료</div>
									<span class="ico"></span>
								</li>
								<!-- //결제완료 -->

								
								<!-- 배송중 -->
								<li>
									
										<div class="num">${cart2}</div>
									
									<div class="txt">배송중</div>
									<span class="ico"></span>
								</li>
								<!-- //배송중 -->
								
								<!-- 배송완료 -->
								<li>
									
										<div class="num">${cart3}</div>
									
									<div class="txt">배송완료</div>
								</li>
								<!-- //배송완료 -->
							</ul>
						</div>
					</div>
					<div class="midR">
						<ul class="midList">
							<li>
								<a href="my_post.do">나의 리뷰 <sapn class="ea">${reviewCount}개</sapn></a>
							</li>
							<li>
								<a href="my_post.do">나의 커뮤니티 <sapn class="ea">${commCount}개</sapn></a>
							</li>
							<li>
								<a href="my_email.do">나의 Q/A메일 <sapn class="ea">${emailCount}개</sapn></a>
							</li>
							
						</ul>
					</div>
					

				</div>
				<!-- botTit --> 
				
				<!-- <div class="mainBot">
					<div class="botTit">최근 본 상품</div>
					<div class="recommend">
						<div class="recommend_slide slick-initialized slick-slider">

						<div aria-live="polite" class="slick-list draggable"><div class="slick-track" role="listbox" style="opacity: 1; width: 0px; transform: translate3d(0px, 0px, 0px);"></div></div></div>
					</div>
				</div> -->
	
	<div class="slick-items5">
     
   </div>  
	
	
	 
     </div>
   </div>
</div>


</body>
</html>