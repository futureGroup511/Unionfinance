<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<body>
<h2>Hello World!</h2>
</body>
    <!--
    add by Jerry Told
    -->

    <a href="user/inspectIncomeByCondition?currentPage=1&entryId=&startDate=&endDate=">查看收入情况</a><br/>
    <a href="user/inspectExpenseByCondition?currentPage=1&entryId=&startDate=&endDate=">查看支出情况</a><br/>


<a href= "/Unionfinance/incomerecord/incomerecordview">拨款</a>
<a href= "/Unionfinance/union/add">工会添加</a>
<a href= "/Unionfinance/union/delete">工会修改和删除</a>
<a href="/Unionfinance/entry/findall">查看所有收入/支出条目</a>
<a href="/Unionfinance/user/findall">查看所有用户</a>

</html>
