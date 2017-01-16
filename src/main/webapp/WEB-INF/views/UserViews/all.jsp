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
</head>
<body>
    <table>
        <tr>
            <th>序号</th>
            <th>姓名</th>
            <th>电话号码</th>
            <th>所属工会</th>
            <th>类型</th>
            <th>删除</th>
            <th>修改</th>
        </tr>
        <c:forEach items="${users}" var="user" varStatus="status">
            <tr>
                <th>${status.index+1}</th>
                <th>${user.user_name}</th>
                <th>${user.user_phonenumber}</th>
                <th>${user.user_union.un_name}</th>
                <th>${user.user_type eq 0? '拨款管理员':user.user_type eq 1? '支出管理员':'普通用户'}</th>
                <th><a href="/Unionfinance/user/delete/?id=${user.user_id}">删除</a></th>
                <th><a href="/Unionfinance/user/update/?id=${user.user_id}">修改</a></th>
            </tr>
        </c:forEach>
    </table>
    <a href="/Unionfinance/user/add">添加</a>
    <p>${message}</p>
</body>
</html>
