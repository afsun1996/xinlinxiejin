<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bysj.dto.Article"%>
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
	<form onsubmit="return checkArticle()" action="${pageContext.request.contextPath}/article/ArticleUpdate" method="post" enctype="multipart/form-data">
		<table class="xwtable">  
			<tr>
				<td> <span style="color: red;">*</span> 文章标题： </td>
				<td> <input type="text" value="${Article.titlename}" name="titlename" /> <input type="hidden" name="uid" value="${Article.uid}" /></td>
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
				<td> 图片：</td>
				<td><input type="file" name="doc" accept="image/*"/></td>
			</tr>
			<tr>
				<td> 关联医生： </td>
				<td><input type="text" name="doctorname" value="${Article.doctorname}"/></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea name="content" cols="100" rows="8">${Article.content}</textarea></td>
			</tr>
			<tr class="logC">	
				<td><input type="submit" value="保存"/></td>
				<td><input type="button" value="删除" onclick="confirmDelte()"></td>
			</tr>
		</table>
		
	</form>
	<script type="text/javascript">
	var atype = '${Article.type}';
	if(atype=='中医故事'){
		var tags = document.getElementById("type1");
		tags.setAttribute("selected", true);
		
	}else if(atype=='医学常识') {
		var tags = document.getElementById("type2");
		tags.setAttribute("selected", true);
	}else if(atype=='妙方'){
		var tags = document.getElementById("type3");
		tags.setAttribute("selected", true);
	}else if(atype=='中医新闻'){
		var tags = document.getElementById("type4");
		tags.setAttribute("selected", true);
	}
	function confirmDelte() {
		if (window.confirm("是否确认删除该条数据")) {
	        location.href = "${pageContext.request.contextPath}/article/remove?id=${Article.uid}";
	    }else {
	        return false;
	    }
	}
	</script>
	<span style="color: red;size: 12px;font-family: SimHei;">注意：*标识的字段为必须输入字段</span>
</body>
</html>