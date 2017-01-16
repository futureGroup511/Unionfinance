<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/15
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
    <form action="/Unionfinance/union/update" method="post">
        <c:if test="${id eq null}">
            <input type="hidden" name="un_id" value="${union.un_id}">
        </c:if>
        <c:if test="${id ne null}">
            <input type="hidden" name="un_id" value="${id}">
        </c:if>
        工会名称: <input type="text" name="un_name" value="${union.un_name}">
        <input type="submit" value="确定">
    </form>
    <a href="/Unionfinance/union/delete">返回</a>
    <p>${message}</p>
</body>
</html>
