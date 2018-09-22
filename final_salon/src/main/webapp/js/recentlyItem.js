$(document).ready(function(){
	var Cpage; // 현재 페이지 
	var pagingSize = 5; // 원하는 페이지 사이즈로 조정
	
	if(getCookie('itemID')){chkRecent(1);}
	
	function chkRecent(a) {
		var itemID = getCookie('itemID');
		itemID = uirdecodeprocess(itemID);
		itemID = JSON.parse(itemID);
		var arr = itemID.arr;
			
		$("#left_zzim ul").html(''); // 일단 Ul 내용 지우기... 
		if (itemID) {
			var totcount = arr.length; //
			var totpage = Math.ceil(totcount / pagingSize) * 1;
			Cpage = (totpage >= a) ? a : 1;
			Cpage = (Cpage < 1) ? totpage : Cpage;
			var start = (Cpage - 1) * pagingSize;
			for (i = start; i <= start + (pagingSize - 1); i++) { // 수정
				var thisItem = arr[i];
				if (thisItem) {
					var itemId = arr[i].num;
					var itemImg = arr[i].image;
					$("#left_zzim ul").append('<li><a href="detail.do?code='
							+ itemId + '" target="_top"><img src="salon/main/' + 
							itemImg+'"  width="75" border=1></a></li>')
				}
			}
			$("#paging").show();
		} else {
			$("#left_zzim ul").append('<p class="noData">최근 본 상품이<br> 없습니다.</p>');
			$("#paging").hide();
			$("#recentCnt").text('');
		}
		updateRecentPage(totcount, Cpage);
	}

	function updateRecentPage(totcount, Cpage) { //  
		$("#recentCnt").text(totcount); //
		$("#totalPageCount").text("/" + Math.ceil((totcount / pagingSize) * 1));
		if (Math.ceil((totcount / pagingSize) * 1) < Cpage) {
			$("#currentPage").text(Math.ceil((totcount / pagingSize) * 1));
		} else {
			$("#currentPage").text(Cpage); //
		}
	}
	
	$(".btn_next").on('click', function() {
		chkRecent(Cpage + 1);
	});
	$(".btn_prev").on('click', function() {
		chkRecent(Cpage - 1);
	});
	
	$('#ford_list').on('click',function(e){
		e.preventDefault();
		$("#cookie_list").slideToggle("fast");
	});
})

function newproduct(value){
	var total = new Object();
	
	var code = new Array();
	var obj1 = new Object();
	
	var num = $(value).attr('href').substring($(value).attr('href').lastIndexOf('=')+1);
	var image = $(value).children('img').attr('src').substring($(value).children('img').attr('src').lastIndexOf('/')+1);
	obj1.num = num;
	obj1.image = image;
	
	code.push(obj1);
	
	getitemCookie(code);
	
	total.arr = code;
	setCookie("itemID", JSON.stringify(total), 1);
}

function newproduct_2(value){
	var total = new Object();
	
	var code = new Array();
	var obj1 = new Object();
	
	var num = $(value).attr('href').substring($(value).attr('href').lastIndexOf('=')+1);
	
	var image_temp = $(value).parent().parent().siblings('.image').children().children('img');
	var image = image_temp.attr('src').substring(image_temp.attr('src').lastIndexOf('/')+1);
	
	obj1.num = num;
	obj1.image = image;
	
	code.push(obj1);
	
	getitemCookie(code);
	
	total.arr = code;
	setCookie("itemID", JSON.stringify(total), 1);
}

function newproduct_3(value){
	var total = new Object();
	
	var code = new Array();
	var obj1 = new Object();
	
	var num = $(value).attr('href').substring($(value).attr('href').lastIndexOf('=')+1);
	var image = $(value).children('div').children('img').attr('src').substring($(value).children('div').children('img').attr('src').lastIndexOf('/')+1);
	obj1.num = num;
	obj1.image = image;
	
	code.push(obj1);
	
	getitemCookie(code);
	
	total.arr = code;
	setCookie("itemID", JSON.stringify(total), 1);
}

function getitemCookie(code){
   if(getCookie('itemID')){
      var itemID = getCookie('itemID');
      itemID = uirdecodeprocess(itemID);
      itemID = JSON.parse(itemID);
      
      var arr = itemID.arr;
      for(var i=0; i<arr.length; i++){
         var obj = new Object();
         if(findObjectByKey(code,'num',arr[i].num) != null){
            continue;
         }
         obj.num = arr[i].num;
         obj.image = arr[i].image;
         code.push(obj);
      }
   }
}

function findObjectByKey(array,key,value){
   for(var i=0;i<array.length;i++){
      if(array[i][key] == value){
         return array[i];
      }
   }
   return null;
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
 
// 쿠키 삭제
function deleteCookie(name) {
	setCookie(name,'',-1);
}

function uirdecodeprocess(cname){
	cname = decodeURI(cname);
	cname = cname.replace(/%3A/gi,':');
	cname = cname.replace(/%2C/gi,',');
	return cname;
}
