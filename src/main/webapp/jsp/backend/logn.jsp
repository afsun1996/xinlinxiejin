<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/backend/css/logn.css">
	<title>登录</title>
</head>
 
<body>
<script type="text/javascript">
var msg = '${msg}';
console.log(msg);
if(msg!=null && msg!='') {
	alert(msg);
}
function check() { 
	var userName = document.getElementById('username').value;
	var pwd = document.getElementById('pwd').value;
	if(userName==''||userName == null) {
		alert('请输入用户名再登陆');
		return false;
	}
	if(pwd == ''||pwd == null) {
		alert('请输入密码再登陆');
		return false;
	}
	return true;
} 
</script>
<div class="header" id="head">
  <div class="title">后台管理系统</div>
	
</div>
	
<div class="wrap" id="wrap">
	<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
			</div>
			<!-- 输入框 -->
			<form action="${pageContext.request.contextPath}/logn/logning" method="post" onsubmit="return check()">
				<div class="lgD">
					
					<input type="text" placeholder="输入用户名" name="username" id="username" />
				</div>	
				<div class="lgD">
					
					<input type="password" placeholder="输入用户密码" name="pwd" id="pwd"/>
				</div>
					
				<div class="logC">
					<input type="submit" value="登录"/>
				</div>	
			</form>
		</div>
</div>
	
<div class="footer" id="foot">
  <div class="copyright">
    <p>Copyright © 2018 Qunar.com Inc. All Rights Reserved.</p>
    <div class="img">
		<i class="icon"></i><span>联系邮箱：*********.com</span>
	</div>
	
	<div class="img">
		<i class="icon1"></i><span>联系地址：安徽中医药大学</span>
	</div>
	  
	<div class="img">
	  <i class="icon2"></i><span>联系电话：***********</span>
	</div>
 
 
  </div>
	
</div>
	
	
</body>
</html>
