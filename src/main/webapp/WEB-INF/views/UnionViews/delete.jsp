<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/15
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-three.css">
    <title>删除工会</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>公会删除和修改</p>
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
                <thead>序号</thead>
                <thead>姓名</thead>
                <thead>删除</thead>
                <thead>修改</thead>
            </tr>
            <c:forEach items="${unions}" var="union" varStatus="status">
                <tr>
                    <td class="four">${status.index+1}</td>
                    <td class="four">${union.un_name}</td>
                    <td class="four"><img src="${pageContext.request.contextPath}/images/bian.png">
                        <a href="/Unionfinance/union/delete/?id=${union.un_id}">删除</a>
                        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/lajitong.png">
                        <a href="/Unionfinance/union/update/?id=${union.un_id}">修改</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<div class="container-three">
    <a  class="btn btn-primary" href="/Unionfinance">返回</a>
</div>

<p>${message}</p>
</body>
</html>
