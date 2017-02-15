<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/15
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>拨款页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-one.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/addentry.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<form action="/Unionfinance/incomerecord/add" method="post">
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <a> <button class="btn btn-primary" type="button"><img src="${pageContext.request.contextPath}/images/yonghuzengjia.png" width="25" height="25">增加用户</button></a>
        </div>
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>拨款</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
    <div class="container-one">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>单位：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select class="form-control" name="ir_union.un_id">
                        <c:forEach items="${unions}" var="union">
                            <option value="${union.un_id}">${union.un_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-3 col-md-3  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>条目：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select class="form-control" name="ir_entry.en_id" id="entry">
                        <c:forEach items = "${entries}" var="entry">
                            <option value="${entry.en_id}">${entry.en_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-2 col-lg-pull-1 col-md-2 col-md-pull-1 col-xs-3 col-xs-pull-1">
                <p><a href="#" onclick="addEntry(0)">如果没有此条目，请点击添加</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>金额：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" class="form-control" name="ir_money">
                </div>
            </div>
            <div class="col-lg-3 col-md-3  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>备注：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" class="form-control"  name="ir_redundancy">
                </div>
            </div>
            <div class="col-lg-1 col-md-1 col-xs-1" style="margin-left:-2%;">
                <button class="btn btn-primary" type="submit">确&nbsp;&nbsp;定</button>
            </div>


        </div>
    </div>

    <div class="container-two">
        <div class="row">
        </div>
        <div class="row">
        </div>
    </div>
</div>
    </form>
<p id="message">${message}</p>
</body>
</html>
