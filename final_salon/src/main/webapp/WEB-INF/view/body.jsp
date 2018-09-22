<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
	                        
	                         $(".slick-items").append('<div><a href="eventPage.do?num='+res[i].event_num+'" id="banner"><img id="mainimg" src="'+res[i].event_mainpic+'"/></a></div>');
	                         
	                         
	                    }
	                    count++;
	                    
	                   
	                  
	                    
	              }
	             $('.slick-items').slick({  
                      dots: true, 
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
<div class="main_body_wrap">
	<!-- <div class="slick-items">
      <div>
         <img src="images/banner1.png" />
      </div>

      <div>
         <img src="images/banner2.png" />
      </div>

      <div>
         <img src="images/banner3.jpg" />
      </div>
   </div> -->
	<div class="slick-items">
	<!-- 	<c:if test="${eventLength < 7 }">   
       
        <c:forEach items="${eventlist}" var="k">
         
            <c:url var="path" value="eventPage.do">
               <c:param name="num" value="${k.event_num}" />
           </c:url>
          <div>
          <a href="${path}" id="banner" onclick="eventPage.do">
             <img id="mainimg" src="${k.event_mainpic}"/>
          </a>
          </div>
        </c:forEach>

      </c:if>  
       
  <c:if test="${eventLength >= 7 }">   
   <c:forEach items="${eventlist}" var="k" begin="0" end="7">
              
              <c:url var="path" value="eventPage.do">
               <c:param name="num" value="${k.event_num}" />
            </c:url>
 	<div>
             <a href="${path}" id="banner" onclick="eventPage.do">
             <img id="mainimg" src="${k.event_mainpic}"/>
                </a>
            </div>
     </c:forEach>
   </c:if>
    
    -->
	</div>

	<div class="main_product_group">
		<div class="group_top">
			<a>NEW PRODUCT</a> <a href="newpage.do">MORE ></a>
		</div>

		<div class="group_body">
			<div class="new_image">
				<c:if test="${newLength < 10}">
					<c:forEach items="${newList }" var="i">
						<div>
							<a href="detail.do?code=${i.goods_code}"
								onclick="newproduct(this)"> <img
								src="${i.picture.goods_main }" id="prod_img" /> <c:if
									test="${i.total_count != 0}">
									<p>${i.goods_name}</p>
									<p>${i.goods_price }원</p>
								</c:if> <c:if test="${i.total_count == 0}">
									<p>${i.goods_name}</p>
									<p>${i.goods_price }원</p>
									<p>품절</p>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${newLength >= 10 }">
					<c:forEach items="${newList }" var="i" begin="0" end="10">
						<div>
							<a href="detail.do?code=${i.goods_code}"
								onclick="newproduct(this)"> <img
								src="${i.picture.goods_main }" id="prod_img" /> <c:if
									test="${i.total_count != 0}">
									<p>${i.goods_name}</p>
									<p>${i.goods_price }원</p>
								</c:if> <c:if test="${i.total_count == 0}">
									<p>${i.goods_name}</p>
									<p>${i.goods_price }원</p>
									<p>품절</p>
								</c:if>
							</a>
						</div>
					</c:forEach>
				</c:if>

			</div>
		</div>

		<div class="group_top">
			<a>BEST PRODUCT</a> <a href="bestpage.do">MORE ></a>
		</div>
		<div class="best_group_body">
			<ul class="best_ul">
				<c:forEach items="${bestList }" begin="0" end="7" var="best">
					<li class="best_li">
 					 <a href="detail.do?code=${best.goods_code}" onclick="newproduct_3(this)"> 
						<div class="best_img"> 
							<img src="${best.picture.goods_main }" alt="화장품이미지" />
						</div>
						<div class="best_info">
							<ul>
								<c:if
									test="${best.total_count != 0}">
									<p>${best.goods_name}</p>
									<p>${best.goods_price }원</p>
								</c:if> <c:if test="${best.total_count == 0}">
									<p>${best.goods_name}</p>
									<p>${best.goods_price }원</p>
									<p>품절</p>
								</c:if>
							</ul>
						</div>
					 </a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>