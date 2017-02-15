<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/15
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看所有条目</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-four.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>所有收入\支出条目</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>

    </div>
</div>
<form action="/Unionfinance/union/findByType">
<div class="body-one">
    <div class="container-one">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-3 col-md-offset-3 col-xs-3 col-xs-offset-3">
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <c:if test="${type == null or type == 0}">
                        <select name="type"   class="form-control">
                            <option value="0">拨款</option>
                            <option value="1">支出</option>
                        </select>
                    </c:if>
                    <c:if test="${type == 1}" >
                        <select name="type" class="form-control">
                            <option value="1">支出</option>
                            <option value="0">拨款</option>
                        </select>
                    </c:if>
                </div>
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <button class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>

    </form>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <tr class="two">
            <th>序号</th>
            <th>名称</th>
            <th>类型</th>
            <th>删除/修改</th>
        </tr>
        <c:forEach items="${entries}" var="entry" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${entry.en_name}</td>
                <c:if test="${entry.en_type eq 0}">
                    <td>拨款</td>
                </c:if>
                <c:if test="${entry.en_type eq 1}">
                    <td>支出</td>
                </c:if>
                <td  class="four">
                    <img src="${pageContext.request.contextPath}/images/bian.png">
                    <a href="/Unionfinance/entry/update/?id=${entry.en_id}">修改</a>
                    &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/lajitong.png">
                    <a href="/Unionfinance/entry/delete/?id=${entry.en_id}" style="color:#E11E05;">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

    <p>${message}</p>
</body>
</html>
