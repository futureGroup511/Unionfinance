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
</head>
<body>
    <form action="/Unionfinance/union/findByType">
        <c:if test="${type == null or type == 0}">
            <select name="type" >
                <option value="0">拨款</option>
                <option value="1">支出</option>
            </select>
        </c:if>
        <c:if test="${type == 1}">
            <select name="type" >
                <option value="1">支出</option>
                <option value="0">拨款</option>
            </select>
        </c:if>
        <input type="submit" value="提交">
    </form>

    <table>
        <tr>
            <th>序号</th>
            <th>名称</th>
            <th>类型</th>
            <th>删除</th>
            <th>修改</th>
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
                <td><a href="/Unionfinance/entry/delete/?id=${entry.en_id}">删除</a></td>
                <td><a href="/Unionfinance/entry/update/?id=${entry.en_id}">修改</a></td>
            </tr>
        </c:forEach>
    </table>
    <p>${message}</p>
</body>
</html>
