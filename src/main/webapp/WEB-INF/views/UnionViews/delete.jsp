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
    <title>删除工会</title>
</head>
<body>
    <table>
        <tr>
            <thead>序号</thead>
            <thead>姓名</thead>
            <thead>删除</thead>
            <thead>修改</thead>
        </tr>
        <c:forEach items="${unions}" var="union" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${union.un_name}</td>
                <td><a href="/Unionfinance/union/delete/?id=${union.un_id}">删除</a></td>
                <td><a href="/Unionfinance/union/update/?id=${union.un_id}">修改</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="/Unionfinance">返回</a>
<p>${message}</p>
</body>
</html>
