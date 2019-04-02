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
	<form onsubmit="return checkPrescription()" action="${pageContext.request.contextPath}/prescription/add" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			<tr>
				<td><span style="color: red;">*</span> 药方名： </td>
				<td> <input type="text"  name="name" /> </td>
			</tr>
			
			<tr>
				<td> <span style="color: red;">*</span>组成成分： </td>
				<td><textarea rows="4" cols="100" name = "constituent"></textarea></td>
			</tr>
			
			<tr>
				<td> 作用：  </td>
				<td> <textarea rows="4" cols="100" name = "effect"></textarea> </td>
			</tr>
			
			<tr>
				<td> 用量：  </td>
				<td> <textarea rows="4" cols="100" name = "usages"></textarea> </td>
			</tr>
			
			<tr>
				<td> <span style="color: red;">*</span>主治：  </td>
				<td> <textarea rows="4" cols="100" name = "indications"></textarea>  </td>
			</tr>
			
			<tr class="logC">	
				<td colspan="2"><input type="submit" value="新增"/></td>
			</tr>
		</table>
		
	</form>
<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>