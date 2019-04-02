<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/backend/css/table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/backend/css/logn.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/backend/js/checkvalue.js"></script> 
	<title>Detail</title>
</head>
<body>
<h6>新增</h6>
	<form onsubmit="return checkMmaterial()" action="${pageContext.request.contextPath}/mmaterial/add" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			<tr>
				<td><input type="file" name="img"/></td>
			</tr>
			<tr>
				<td> <span style="color: red;">*</span> 中药名： </td>
				<td> <input type="text"  name="mname" /> </td>
			</tr>
			
			<tr>
				<td> <span style="color: red;">*</span> 功效： </td>
				<td> <textarea rows="4" cols="80" name = "effect"></textarea></td>
			</tr>
			
			<tr>
				<td> 性味归经：  </td>
				<td> <textarea rows="4" cols="80" name = "attribute"></textarea></td>
			</tr>
			
			<tr>
				<td> 介绍：  </td>
				<td> <textarea rows="8" cols="80" name = "info"></textarea> </td>
			</tr>
			
			<tr class="logC">	
					<td colspan="2"><input type="submit" value="新增"/></td>
			</tr>
		</table>
		
	</form>
<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>