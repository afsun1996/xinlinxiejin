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
	<form onsubmit="return checkDoctor()" action="${pageContext.request.contextPath}/user/add" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			<tr>
				<td><img alt="" src="" height="100" width="100"></td>
				<td><input type="file" name="img"/></td>
			</tr>
			<tr>
				<td><span style="color: red;">*</span> 姓名： </td>
				<td> <input id="name" type="text"  name="dname" /> </td>
			</tr>
			
			<tr>
				<td><span style="color: red;">*</span> 性别： </td>
				<td> <input id="gender" type="text"  name="gender"/> </td>
			</tr>
			
			<tr>
				<td><span style="color: red;">*</span> 年龄：  </td>
				<td> <input id="age" type="text"  name="age"/> </td>
			</tr>
			
			<tr>
				<td> 出生日：  </td>
				<td> <input type="date" name="birthday"/> </td>
			</tr>
			
			<tr>
				<td> 仙逝日：  </td>
				<td>  <input type="date" name="deathday"/>  </td>
			</tr>
			
			<tr>
				<td> 生平事迹：  </td>
				<td> <textarea rows="8" cols="100" name = "info"></textarea> </td>
			</tr>
			
			<tr class="logC">	
					<td colspan="2"><input type="submit" value="新增"/></td>
			</tr>
		</table>
		
	</form>
<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>