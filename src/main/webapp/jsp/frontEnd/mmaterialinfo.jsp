<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Prescription"%>
<%@page import="com.bysj.dto.Mmaterial"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mmaterial</title>
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
		<h1 style="text-align: center;">${mmaterial.mname}</h1>
		<img src="../jsp/commsource/MmaterialImg/${mmaterial.mname}.jpg" width="100px" height="100px" style="margin-left: 10px;">
		
			<div class='info'>
				<font style="font_family=SimHei" size="12px;">功效</font>：${mmaterial.effect}<br>
				<font style="font_family=SimHei" size="12px;">性味归经</font>：${mmaterial.attribute}<br>
				<font style="font_family=SimHei">简介</font>：${mmaterial.info}
			</div>
			
		<hr>
		相关药剂：
		<div id='realtive'>
			<c:forEach items="${prescriptions}" var="prescription">
				<li style="margin-bottom: 10px; margin-left: 50px;list-style: none;">
					<div class="list">
						<a href="${pageContext.request.contextPath}/prescription/info?name=${prescription.name}">
							<img width="30px" height="30px" src="../jsp/commsource/PrescriptionImg/yaoshan.jpg">${prescription.name}
						 </a>
					</div>
				</li>
			</c:forEach>
		</div>
	</div>
</body>
</html>