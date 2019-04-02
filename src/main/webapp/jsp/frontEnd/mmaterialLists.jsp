<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Mmaterial" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
	<link href="${pageContext.request.contextPath}/jsp/frontEnd/css/list.css" rel="stylesheet" type="text/css" /> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/frontEnd/js/list.js"></script> 
	<title>Mmaterials</title>  
</head>  
  
<body>  
	<div class = "search">
		<form action="${pageContext.request.contextPath}/mmaterial/search">
		<span id="box">
			<input type="text" id="content" name="name" placeholder="请输入关键字"/> 
			<input type="submit" value="搜索" id="search"/> 
		</span>
		<c:choose>
		   <c:when test="${searchflag== true}"> 
		   	<span style="font-family:SimHei;color:#fff;">
		      	  搜索内容：${searchinfo}&nbsp&nbsp&nbsp&nbsp搜索结果：${pageinfo.total} 条
		    </span>
		   </c:when>
		   
		   <c:otherwise>
		    
		   </c:otherwise>
		</c:choose>
		</form>
	</div>
	
    <c:forEach items="${pageinfo.list}" var="Mmaterial" >
    <a href="${pageContext.request.contextPath}/mmaterial/info?name=${Mmaterial.mname}">
	    <div  class="lists" onmouseover="mousein(this)" onmouseout="mouseout(this)">
			<div>
				<img src="../jsp/commsource/MmaterialImg/${Mmaterial.mname}.jpg" align="left" width="260px" height="260px">
			</div>
			药材名：${Mmaterial.mname}<br/>
			作用：${Mmaterial.effect}<br/>
			属性：${Mmaterial.attribute}<br/>
			介绍：${Mmaterial.info}
		</div>
	</a>
    </c:forEach>
    <span class='foot'>
      <a href="${pageContext.request.contextPath}/mmaterial/showlist?currentPage=${pageinfo.firstPage}" >首页</a> &nbsp
      <a href="${pageContext.request.contextPath}/mmaterial/showlist?currentPage=${pageinfo.prePage}">上一页</a> &nbsp
      <c:forEach begin="1" end="${pageinfo.pages}" step="1" var="i" >
   		<a href="${pageContext.request.contextPath}/mmaterial/showlist?currentPage=${i}">${i}</a> &nbsp       
   	  </c:forEach>
      <a href="${pageContext.request.contextPath}/mmaterial/showlist?currentPage=${pageinfo.nextPage}">下一页</a> &nbsp
      <a href="${pageContext.request.contextPath}/mmaterial/showlist?currentPage=${pageinfo.lastPage}">尾页</a>&nbsp
      
      ${pageinfo.pageNum}&nbsp/&nbsp${pageinfo.pages}
    </span> 
</body>  
</html>  