<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="js/ad_proList.js"></script>
<script type="text/javascript" src="js/ad_proListView.js"></script>
<script type="text/javascript" src="js/ad_register.js"></script>
<script type="text/javascript" src="js/payList.js"></script>
<script type="text/javascript" src="js/ad_memList.js"></script>


<link rel="stylesheet" type="text/css" href="css/ad_common.css"/>
<link rel="stylesheet" type="text/css" href="css/ad_proList.css"/>
<link rel="stylesheet" type="text/css" href="css/ad_proListView.css"/>
<link rel="stylesheet" type="text/css" href="css/ad_register.css"/>
<link rel="stylesheet" type="text/css" href="css/ad_searchpay.css"/>
<link rel="stylesheet" type="text/css" href="css/ad_memList.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
</head>

<body>
<div id="ad_side">
<tiles:insertAttribute name="ad_side" ignore="true"/>
</div>
<div id="ad_content">
<tiles:insertAttribute name="body" ignore="true"/>
</div>

</body>
</html>