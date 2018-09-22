<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){ 
	   
	   
	   $("#nolist").on('click',function(){
		   $('#frm').attr('action',"notice.do");
		   $('#frm').submit();
		
	});
	    
	   $("#noupdate").on('click',function(){
		   $('#frm').attr('action',"noupdate.do");
		   $('#frm').submit();
		
	});  
	    
	   $("#nodelete").on('click',function(){
		   $('#frm').attr('action',"nodelete.do");
		   $('#frm').submit();
		    
	});     
	  
});
</script>
<style type="text/css">

#noview {
margin: 0 auto;
margin-top: 50px;
border:0px; 
}

#bo {
	text-align: center;
}



#nolist { 
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


#noupdate{ 
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

#nodelete{ 
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




</style>
</head>
<body> 
<table id="noview" border="1" width="50%"> 
		<tr>
			<th width="20%">글쓴이</th>
			<td>운영자</td>
			<th width="20%">조회수 : ${dto.readcount}</th> 
		</tr>
 
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.noTitle}</td>
		</tr>

		<tr>
			<th>카테고리</th>
			<td colspan="3">${dto.noCate}</td>
		</tr>

		<tr>
			<td colspan="3"><br><br>${dto.noContent}<br><br><br><br><br><br><br><br><br><br><br><br></td>
		</tr>

	</table>
    <br>
    <br>
	<form name="frm" id="frm" method="get">   
		<input type="hidden" name="num" value="${dto.noNum}" /> 
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" /> 
		 <div id="bo">
		  <input type="button" id="nolist" value="리스트" />   
		 <c:if test="${sessionScope.dto.id == 'admin' }">
		  <input type="button" id="noupdate" value="수정" /> <input type="button" id="nodelete" value="삭제" />
         </c:if>  
         </div>
	</form>
	<br>
	<br> 
	<br>
</body>
</html>