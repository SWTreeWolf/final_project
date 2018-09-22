<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style type="text/css">
    #map{
    	height:500px;
    	width:1000px;
    	left:500px;
    }
    #btn div{
    	float:left;
    	margin:5px;
    }
    #btn{
   		/* background-color:yellow; */
    	height:100px;
    	margin-left: 500px;
    }
    #btn button{
    	border: 0px;
    	width:190px;
    	height:30px;
    	background-color: #b89d6c;
    	font-weight: bold;
    	color: white;
    }
    #top_blank{
    	height:50px;
    }
    #map{
    	border: 1px solid;
    	border-color: #b89d6c;
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  </head>
  <body>
  <div id="top_blank"></div>
    <div id="map"></div>
    <div id="loc">
    	<div id="btn">
    		<div id="map_1"><button>강남역점</button></div>
    		<div id="map_2"><button>사당역점</button></div>
    		<div id="map_3"><button>역삼역점</button></div>
    		<div id="map_4"><button>삼성역점</button></div>
    		<div id="map_5"><button>논현역점</button></div>
    		
    	</div>
    </div>
    
    <script type="text/javascript">
    var loc=null;
    var Message=null; // 마커에 찍어줄 메시지
    var uluru=null; 

    $(document).ready(function(){
       //$('#btn>div').on('click',function(){
    	  $('#btn>div').on('click',function(){    	  
          loc = $(this).attr('id');
          initMap(loc);
       });
    	  
   });
      function initMap(loc) {
        //var myLatLng = {lat: 37.498104, lng: 127.027621};
        
        if(Message==null || loc == "map_1"){
            uluru = {lat: 37.498000, lng: 127.027611};
            Message = '<div><h2>강남역점 입니다</h2></div>';
            
        }else if(loc == "map_2"){ 
            uluru = {lat: 37.476755, lng: 126.981601};
            Message = "<div><h2>사당역점 입니다</h2></div>";
            
         }else if(loc == "map_3"){
             uluru = {lat: 37.500494, lng: 127.036340};
             Message = "<div><h2>역삼역점 입니다</h2></div>";
             
          }else if(loc == "map_4"){
              uluru = {lat: 37.509014, lng: 127.063128};
              Message = "<div><h2>삼성역점 입니다</h2></div>";
              
           }else if(loc == "map_5"){
               uluru = {lat: 37.511419, lng: 127.021685};
               Message = "<div><h2>논현역점 입니다</h2></div>";
               
            }

        // Create a map object and specify the DOM element
        // for display.
        var map = new google.maps.Map(document.getElementById('map'), {
          center: uluru,
          zoom: 17
        });

        // Create a marker and set its position.
        var marker = new google.maps.Marker({
          map: map,
          position: uluru,
         // title: 'Hello World!'
        });
        MapMessage(marker,Message);
        
      }
	
      function MapMessage(marker,Message){
    	   var infowindow = new google.maps.InfoWindow({
	    	   content : Message
    	   });
    	   
    	   marker.addListener('click',function(){
    	      infowindow.open(marker.get('map'), marker);
    	   })
    	   
    	  
    	   
   	} 
      
      
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=true&key=AIzaSyBAr1SoogYhpsi5vhJLMQBSmoqcJNhB6kM&callback=initMap" async defer></script>
  </body>
</html>
