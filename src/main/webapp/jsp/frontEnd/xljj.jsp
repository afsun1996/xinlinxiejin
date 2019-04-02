<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="utf-8" /> 
<title>杏林撷菁中医网</title> 
<link href="${pageContext.request.contextPath}/jsp/frontEnd/css/style.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/frontEnd/js/framework.js"></script> 
	<style>
        html,body,iframe{width: 100%;height: 100%;padding: 0;margin: 0}
        #wrap{width: 100%;height: 100%;}
        iframe{border: none;height:600px;}
 		.top-nav{
			height: 80px;
			background:#d8d8d8;
			font-size: 40px;
			text-align: center;
			line-height: 80px;
        }
    </style>
</head> 
<body> 
	<div class="top-nav">
		<span>杏林撷菁中医网</span>
	</div>
	<ul id="nav"> 
		<li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/jsp/frontEnd/index.jsp" target="main" class="active" >首页</a></li> 
		<li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/user/showlist" target="main" >中医名家</a></li> 
		<li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/mmaterial/showlist" target="main" >中医药材</a></li> 
		<li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/prescription/showlist" target="main" >中医方剂</a></li> 
		<li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/article/allpages" target="main" >中医典故</a></li> 
		<span id="logn">
			<a href="${pageContext.request.contextPath}/logn/logn">
			<img alt="后台登录" src="${pageContext.request.contextPath}/jsp/frontEnd/img/login.png" width="25px" height="25px"/>
			</a>
		</span>
	</ul> 
	<article role="content">
        <iframe style="background-color: #2c3e50;" src="${pageContext.request.contextPath}/jsp/frontEnd/index.jsp" scrolling="auto" scrolling="no" name="main"  onload="changeFrameHeight()" id="iframepage">
        </iframe>
    </article>
</body> 
</html> 