<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bysj.dto.Article"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/jsp/frontEnd/css/list.css" rel="stylesheet" type="text/css" /> 
<meta charset="utf-8">
<style type="text/css">
.foot,.foot a{
	font-family:SimHei;
	color:#fff;
	text-decoration:none;
}
.list a{
	font-family:SimHei;
	color: #FF8C00;
	text-decoration:none;
}
</style>
<title>实验3</title>
</head>
<body>
	<script type="text/javascript">
		function changeItem(item) {
			
		}	
	</script>
	
	<div >
		<div style="background-color: fff;">
			<ul>
				<c:forEach items="${pageinfo.list}" var="Article">
					<li style="margin-bottom: 10px;margin-left: 50px;">
						<div class = "list">
							<a href="${pageContext.request.contextPath}/article/article?uid=${Article.uid}">
								${Article.titlename}
							</a>
							<div style="float: right;margin-right: 440px;color: #fff; ">
								${Article.type}
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<span class='foot' style="position: fixed;;left: 250px; top: 350px;">
	          <a href="${pageContext.request.contextPath}/article/allpages?currentPage=${pageinfo.firstPage}" >首页</a> &nbsp
	          <a href="${pageContext.request.contextPath}/article/allpages?currentPage=${pageinfo.prePage}">上一页</a> &nbsp
	          <c:forEach begin="1" end="${pageinfo.pages}" step="1" var="i" >
			     <a href="${pageContext.request.contextPath}/article/allpages?currentPage=${i}">${i}</a> &nbsp       
		      </c:forEach>
	          <a href="${pageContext.request.contextPath}/article/allpages?currentPage=${pageinfo.nextPage}">下一页</a> &nbsp
	          <a href="${pageContext.request.contextPath}/article/allpages?currentPage=${pageinfo.lastPage}">尾页</a>&nbsp
	          
	          ${pageinfo.pageNum}&nbsp/&nbsp${pageinfo.pages}
          </span> 
</body>
</html>