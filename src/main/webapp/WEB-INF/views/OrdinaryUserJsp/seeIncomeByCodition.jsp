<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看收入情况</title>
</head>
<body>
<table class="table table-striped table-bordered table-hover">
    <tr>
        <th align="center">拨款日期</th>
        <th align="center">拨款金额</th>
        <th align="center">拨款人</th>
        <th align="center">所给单位</th>
        <th align="center">拨款项目</th>
    </tr>
    <tbody>
    <s:when test="#request.page == null || #request.page.recordList.size() == 0">
        <tr>
            <td colspan="5">
                当前没有支出信息
            </td>
        </tr>
    </s:when>
    <s:otherwise>
        <s:forEach items="#request.page.recordList" var="incomeRecord">
            <tr>
                <td>${}</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </s:forEach>
    </s:otherwise>
    </tbody>
</table>
</body>
</html>
