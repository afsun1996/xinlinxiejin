<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Prescription"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prescriptions</title>
<style type="text/css">
.content {
	width: 900px;
	height: 100%;
	background-color: #d8d8d8;
	margin: 0 auto;
}

.info {
	font-family: STKaiti;
	font-size: 16px;
	margin: 10px;
}

#realtive a{
	text-decoration: none;
	color: #000;
}
</style>

</head>
<body>
	<div class='content'>
		<img src="../jsp/commsource/PrescriptionImg/bg2.jpg" width="100%" height="180px">
		<h1 style="text-align: center;">${prescriptions.name}</h1>
		<div class='info'>
			<font size="11px" style="font_family=SimHei">功能主治：</font>${prescriptions.effect}
			<br>
			<font size="11px" style="font_family=SimHei">用量：</font>${prescriptions.usages}
			<br>
			<font size="11px" style="font_family=SimHei">成分组成：</font>${prescriptions.constituent}
			<br>
			<font size="11px" style="font_family=SimHei">介绍：</font>${prescriptions.indications}
		</div>
	</div>
</body>
</html>