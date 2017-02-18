<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/16
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看所有用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-five.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <a href="/Unionfinance/user/add" class="btn btn-primary">增加用户<img src="${pageContext.request.contextPath}/images/yonghuzengjia.png" width="25" height="25"></a>
        </div>
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>查看所有用户</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <tr class="two">
                <th>序号</th>
                <th>姓名</th>
                <th>电话号码</th>
                <th>所属工会</th>
                <th>类型</th>
                <th>编辑</th>

            </tr>
            <c:forEach items="${users}" var="user" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${user.user_name}</td>
                    <td>${user.user_phonenumber}</td>
                    <td>${user.user_union.un_name}</td>
                    <td>${user.user_type eq 0? '拨款管理员':user.user_type eq 1? '支出管理员':'普通用户'}</td>

                    <td class="four">
                        <img src="${pageContext.request.contextPath}/images/bian.png">
                        <a href="/Unionfinance/user/update/?id=${user.user_id}">修改</a>
                        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/lajitong.png">
                        <a href="/Unionfinance/user/delete/?id=${user.user_id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div class="container-three">

</div>
    <p>${message}</p>
</body>
</html>
