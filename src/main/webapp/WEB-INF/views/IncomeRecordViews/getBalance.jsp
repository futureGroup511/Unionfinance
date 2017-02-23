
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //得到url的根路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path +"/";
%>
<html>
<head>
    <title>查询余额</title>
    <link rel="stylesheet" href="<%= basePath%>css/bootstrap.css">
    <link rel="stylesheet" href="<%= basePath%>css/table-five.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <%--<a> <button class="btn btn-primary" type="button"><img src="images/yonghuzengjia.png" width="25" height="25">增加用户</button></a>--%>
        </div>
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：二级管理员>>查看所有工会余额</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎 ${user.user_name} 登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr class="two">
                <th>序号</th>
                <th>工会</th>
                <th>余额</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${balance}" var="b" varStatus="index">
                <tr>
                    <td>${index.index+1}</td>
                    <td>${b.union}</td>
                    <c:if test="${b.balance == 0.00}">
                        <td>${b.income}</td>
                    </c:if>
                    <c:if test="${b.balance != 0.00}">
                        <td>${b.balance}</td>
                    </c:if>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
    <%--<div class="container-three">
        <button class="btn btn-primary" type="button">添加</button>
    </div>--%>
    <%--<div class="container-two">
        <div class="row">
            <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
                <p class="xixnxi">每页显示10条，总记录数4条</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
                <nav>
                    <ul class="pagination">
                        </li>
                        <li><a href="#">首页</a></li>
                        <li><a href="#">上一页</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">下一页</a></li>
                        <li><a href="#">尾页</a></li>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>--%>
</div>
</body>
</html>



<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询余额</title>
</head>
<body>
查询所有工会余额
<table>
    <tr>
        <td>id</td>
        <td>工会</td>
        <td>余额</td>
    </tr>
    <c:forEach items="${balance}" var="b" varStatus="index">
        <tr>
            <td>${index.index+1}</td>
            <td>${b.union}</td>
            <c:if test="${b.balance == 0.00}">
                <td>${b.income}</td>
            </c:if>
            <c:if test="${b.balance != 0.00}">
                <td>${b.balance}</td>
            </c:if>
        </tr>
    </c:forEach>
</table>
</body>
</html>--%>
