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
</head>
<body>
    <form action="/Unionfinance/incomerecord/add" method="post">
            单位：
            <select name="ir_union.un_id" >
                <c:forEach items="${unions}" var="union">
                    <option value="${union.un_id}">${union.un_name}</option>
                </c:forEach>
            </select>
            条目:
            <select name="ir_entry.en_id" >
                <c:forEach items = "${entries}" var="entry">
                    <option value="${entry.en_id}">${entry.en_name}</option>
                </c:forEach>
            </select>
            <a href="#">添加条目</a>
            金额:
            <input type="text" name="ir_money" >
            备注:
            <input type="text" name="ir_redundancy" >
             <input type="submit" value="确定">
    </form>
<p>${message}</p>
</body>
</html>
