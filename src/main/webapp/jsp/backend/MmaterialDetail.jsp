<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bysj.dto.Mmaterial"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
function Delete() {
	if (window.confirm("是否确认删除该条数据")) {
        location.href = "${pageContext.request.contextPath}/mmaterial/remove?mname=${Mmaterial.mname}";
    }else {
        return false;
    }
}
</script>
<h6>编辑</h6>
	<form onsubmit="return checkMmaterial()" action="${pageContext.request.contextPath}/mmaterial/MmaterialUpdate" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			<tr>
				<td><img alt="" src="../jsp/commsource/MmaterialImg/${Mmaterial.mname}.jpg" height="100" width="100"></td>
				<td><input type="file" name="img"/></td>
			</tr>
			<tr>
				<td> <span style="color: red;">*</span> 中药名： </td>
				<td> <input type="text" value="${Mmaterial.mname}" name="mname" disabled="disabled"/> <input type="hidden" value="${Mmaterial.mname}" name="mname"/></td>
			</tr>
			
			<tr>
				<td> <span style="color: red;">*</span> 功效： </td>
				<td> <textarea rows="4" cols="100" name = "effect">${Mmaterial.effect}</textarea> </td>
			</tr>
			
			<tr>
				<td> 性味归经：  </td>
				<td> <textarea rows="4" cols="100" name = "attribute">${Mmaterial.attribute}</textarea></td>
			</tr>
			
			<tr>
				<td> 介绍：  </td>
				<td> <textarea rows="8" cols="100" name = "info">${Mmaterial.info}</textarea> </td>
			</tr>
			
			<tr class="logC">	
					<td><input type="submit" value="保存"/></td>
					<td><input type='button' value='删除' onclick="Delete()" /></td>
			</tr>
		</table>
		
	</form>
	<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>