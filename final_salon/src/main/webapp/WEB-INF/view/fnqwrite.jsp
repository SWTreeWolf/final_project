<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" type="text/css" href="css/fnqwrite.css" /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
</head>
<body>
<div id="container"> 
  <div id="line">
<form name="frm" id="frm" method="post">
 
		<table id="fnq">
			<tr>
				<td width="10%" align="center">분류</td>
				<td><textarea id="cate" name="fnqCate" rows="1" cols="30"></textarea></td>
			</tr>
			 
			<tr> 
				<td width="10%" align="center">질문</td> 
				<td><textarea id="ques" name="fnqQuest" rows="2" cols="50"></textarea></td>
			</tr>
			
 
			<tr>
				<td width="20%" align="center">답변내용</td>
				<td><textarea id="cont" name="fnqContent" rows="13" cols="50"></textarea></td>
			</tr> 
 
		</table>
	
	 <div id="but">
		<input type="button" id="btnList" value="리스트로" /> 
		<input type="button" id="btnSave" value="글쓰기" />
	 </div> 
	</form>
	   </div>
	</div>

</body>
</html>