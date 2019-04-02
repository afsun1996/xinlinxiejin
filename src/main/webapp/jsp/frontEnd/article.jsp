<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Article"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>article</title>
</head>
<body>
	  <div style="width: 1200px;height:600px;;background-color: #D8D8D8;margin: 0 auto;">
	  	<h1 style="text-align: center;">${article.titlename}</h1> 
	  	<hr>
	  	<div style="font-size: 14px;margin: 10px;">
	  		${article.content}<br>
	  	</div>
	  	<img alt="" style="width: 200px;height: 200px; margin: 10px;" src="../jsp/commsource/ArticleImg/${article.uid}.jpg">
	  </div>
</body>
</html>