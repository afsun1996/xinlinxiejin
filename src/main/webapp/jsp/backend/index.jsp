<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/backend/css/framework.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsp/backend/js/framework.js"></script> 
    <title>后台管理网站</title>
</head>
<body>
<header role="header">
    <div>
        <h1>后台管理网站</h1>
        <nav role="user">
            <ul>
                <li>用户名：<strong>${sessionScope.user.userName}</strong></li>
                <li><a href="javascript:void(0);" onclick="logout()">退出</a></li>
            </ul>
        </nav>
    </div>
</header>
<main role="main">
    <article role="content">
        <iframe src="../jsp/backend/welcome.html"  name="main"></iframe>
        <footer role="copyright">
        </footer>
    </article>
    <aside>
        <nav role="option">
            <ul>
                <li>导航菜单</li>
                <li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/user/lists?currentPage=1" target="main"  class="active" >名医管理</a></li>
                <li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/mmaterial/lists?currentPage=1" target="main">药材管理</a></li>
                <li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/prescription/lists?currentPage=1" target="main">方剂管理</a></li>
                <li><a onclick="updateActive(this)" href="${pageContext.request.contextPath}/article/lists?currentPage=1" target="main">中医典故</a></li>
            </ul>
        </nav>
    </aside>
</main>
<script type="text/javascript">
function logout() {
    if (window.confirm('是否退出?')) {
        location.href = '<%=request.getContextPath()%>/logn/outLogin';
    } else {
        return false;
    }
}
</script>
</body>
</html>
