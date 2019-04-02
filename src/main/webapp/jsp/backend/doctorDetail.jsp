<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bysj.dto.Doctor"%>
<%@page import="java.util.Date"%>
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
<h6>编辑</h6>
	<form onsubmit="return checkDoctor()" action="${pageContext.request.contextPath}/user/doctorUpdate" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			<tr>
				<td><img alt="" src="../jsp/commsource/doctorImg/${doctor.id}.jpg" height="100" width="100"></td>
				<td><input type="file" name="img"/></td>
			</tr>
			<tr>
				<td><span style="color: red;">*</span> 姓名： </td>
				<td> <input id="name" type="text" value="${doctor.dname}" name="dname" /> <input type="hidden" name="id" value="${doctor.id}" /></td>
			</tr>
			
			<tr>
				<td><span style="color: red;">*</span> 性别： </td>
				<td> <input id="gender" type="text" value="${doctor.gender}" name="gender"/> </td>
			</tr>
			
			<tr>
				<td><span style="color: red;">*</span> 年龄：  </td>
				<td> <input id="age" type="number" value="${doctor.age}" name="age"/> </td>
			</tr>
			
			<tr>
				<td> 出生日：  </td>
				<td> <input type="date" value="${birthday}" name="birthday"/> </td>
			</tr>
			
			<tr>
				<td> 仙逝日：  </td>
				<td>  <input type="date" value="${deathday}" name="deathday"/>  </td>
			</tr>
			
			<tr>
				<td> 生平事迹：  </td>
				<td> <textarea rows="8" cols="100" name = "info">${doctor.info}</textarea> </td>
			</tr>
			
			<tr class="logC">	
					<td><input type="submit" value="保存"/></td>
					<td><input type="button" value="删除" onclick="confirmDelte()"></td>
			</tr>
		</table>
		
	</form>
<script type="text/javascript">
function confirmDelte() {
	if (window.confirm("是否确认删除该条数据")) {
        location.href = "${pageContext.request.contextPath}/user/remove?id=${doctor.id}";
    }else {
        return false;
    }
}
</script>
<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>