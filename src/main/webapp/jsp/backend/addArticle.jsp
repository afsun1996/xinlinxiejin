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
	<form onsubmit="return checkArticle()" action="${pageContext.request.contextPath}/article/add" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			
			<tr>
				<td> <span style="color: red;">*</span> 标题： </td>
				<td> <input type="text"  name=titlename /> </td>
			</tr>
			
			<tr>
				<td> <span style="color: red;">*</span> 类型： </td>
				<td> 
					<select name="type">
						<option id="type1" value="中医故事" >中医故事</option>
						<option id="type2" value="医学常识" >医学常识</option>
						<option id="type3" value="妙方" >妙方</option>
						<option id="type4" value="中医新闻" >中医新闻</option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 上传图片： </td>
				<td><input type="file" name="doc" accept="image/*"/></td>
			</tr>
			<tr>
				<td> 关联医生： </td>
				<td><input type="text" name="doctorname"/></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea cols="100" rows="8" name="content"></textarea></td>
			</tr>
			<tr class="logC">	
					<td colspan="2"><input type="submit" value="新增"/></td>
			</tr>
		</table>
		
	</form>
<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>