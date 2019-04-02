<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Article"%>
<%@page import="com.bysj.dto.Doctor"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOCTOR</title>
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
		<h1 style="text-align: center;">${doctor.dname}</h1>
		<img src="../jsp/commsource/doctorImg/${doctor.id}.jpg" width="100px" height="100px" style="margin-left: 10px;">
		<h2 style="text-align: left;">${doctor.gender}&nbsp &nbsp &nbsp
			${doctor.age}</h2>
		<div class='info'>${doctor.info}</div>
		<hr>
		<div id='realtive'>
			<c:forEach items="${articles}" var="Article">
				<li style="margin-bottom: 10px; margin-left: 50px;list-style: none;">
					<div class="list">
						<a href="${pageContext.request.contextPath}/article/article?uid=${Article.uid}">
							${Article.titlename} </a>
						<div style="float: right; margin-right: 200px;">
							${Article.type}</div>
					</div>
				</li>
			</c:forEach>
		</div>
	</div>
</body>
</html>