<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
    position: relative;
    min-width: 1024px;
    max-width: 1200px;
    min-height: 400px;
    margin: 0 auto;
    padding: 20px  330px  20px 300px;
}

#line{
	border: 2px solid #f7a2ba;
	padding-top: 30px; 
    padding-bottom: 30px;
}
 
 #but{ 
 margin-left: 260px; 
 } 	
 
  
 
#btnList {
	background-color: #f54a7e;
    border: none;
    color: white;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
} 

#btnSave {
	background-color: #f54a7e;
    border: none;
    color: white;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer; 
} 


#listb{
    background-color: #f54a7e;
    border: none;
    color: white;
    padding: 4px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer; 
} 

#fnqupdate{
  background-color: #f54a7e;
    border: none;
    color: white;
    padding: 4px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer; 
}

#fnqdelete{
    background-color: #f54a7e;
    border: none;
    color: white;
    padding: 4px 10px; 
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer; 
}



</style>
<script type="text/javascript">
$(document).ready(function(){
 
	$('[name=fnqContent]').val(  
   		 $('[name=fnqContent]').val().replace(/<br\s*[\/]?>/gi,"\n"));   	
	
	
	
$('#fnqupdate').on('click',function(){
	alert("수정"); 
	 
	 $('[name=fnqContent]').val(
    		 $('[name=fnqContent]').val().
    		 replace(/\n/gi,'<br/>'));
	
	$('#frm').attr('action',"fnqupdate.do"); 
	$('#frm').submit();   	
});



$('#fnqdelete').on('click',function(){
	alert("삭제"); 
	$('#frm').attr('action',"fnqdelete.do"); 
	$('#frm').submit();   	
});     

$('#listb').on('click',function(){
	alert("리스트로");  
	$('#frm').attr('action',"customer.do"); 
	$('#frm').submit();   	
});   


});
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
</head>
<body>
<div id="container"> 
  <div id="line">
<form name="frm" id="frm" method="post">
 
		<table id="fnq">
			

			<tr>
				<td width="10%" align="center">분류</td>
				<td><textarea name="fnqCate" rows="1" cols="30">${dto.fnqCate}</textarea></td>
			</tr>
			 
			<tr>  
				<td width="10%" align="center">질문</td> 
				<td><textarea name="fnqQuest" rows="2" cols="50">${dto.fnqQuest}</textarea></td>
			</tr>
			
 
			<tr>
				<td width="20%" align="center">답변내용</td>
				<td><textarea name="fnqContent" rows="13" cols="50">${dto.fnqContent}</textarea></td>
			</tr> 
 
  
 
		</table>
		
		<div id="but">	
		<input type="button" id="listb" value="리스트로" /> 
		<input type="button" id="fnqupdate" value="수정" />
		<input type="button" id="fnqdelete" value="삭제" /> 
		<input type="hidden" name="fnqNum" value="${dto.fnqNum}" /> 
        <input type="hidden" name="currentPage" value="${currentPage}" /> 
	   </div> 
	
	</form>
	   </div>
	</div>

</body>
</html>