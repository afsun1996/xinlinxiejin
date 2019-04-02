<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Prescription" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />  
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/backend/css/table.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/backend/js/checkvalue.js"></script> 
	<title>Prescriptions</title>  
<style>
a {
	text-decoration:none;	
	color:#333
	}	
</style>
</head>  
  
<body>  
		<table class="xwtable">  
            <thead>  
	              <tr>  
	                <td>方剂名称</td>  
	                <td>成分组成</td>  
	                <td>功效</td> 
	                <td>用量</td>
	              </tr>  
            </thead>  
            <tbody>  
	            <c:forEach items="${pageinfo.list}" var="Prescription" >
		             <tr>  
		                <td><a href="${pageContext.request.contextPath}/prescription/detail?name=${Prescription.name}" >${Prescription.name}</a></td>
		                <td>${Prescription.constituent}</td>
		                <td>${Prescription.effect}</td>
		                <td>${Prescription.usages}</td>
	              	</tr>  
	            </c:forEach>
            </tbody>  
          </table>  
         <span class='foot' style="position: fixed;;left: 250px; top: 350px;">
	          <a href="${pageContext.request.contextPath}/prescription/lists?currentPage=${pageinfo.firstPage}" >首页</a> &nbsp
	          <a href="${pageContext.request.contextPath}/prescription/lists?currentPage=${pageinfo.prePage}">上一页</a> &nbsp
	          <c:forEach begin="1" end="${pageinfo.pages}" step="1" var="i" >
			     <a href="${pageContext.request.contextPath}/prescription/lists?currentPage=${i}">${i}</a> &nbsp       
		      </c:forEach>
	          <a href="${pageContext.request.contextPath}/prescription/lists?currentPage=${pageinfo.nextPage}">下一页</a> &nbsp
	          <a href="${pageContext.request.contextPath}/prescription/lists?currentPage=${pageinfo.lastPage}">尾页</a>&nbsp
	          
	          ${pageinfo.pageNum}&nbsp/&nbsp${pageinfo.pages}
	          <a href="${pageContext.request.contextPath}/prescription/turntoAdd" style="color: fuchsia;position: relative;left: 100px;">新增</a>
          </span> 
</body>  
</html>  