<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    //得到url的根路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path +"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>查看收入情况</title>
    <link rel="stylesheet" href="<%= basePath%>css/bootstrapDatepickr-1.0.0.css">
    <link rel="stylesheet" href="<%= basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= basePath%>css/font-awesome.min.css">

    <script src="<%= basePath%>js/jquery-1.7.2.min.js"></script>
    <script src="<%= basePath%>js/bootstrap.min.js"></script>
    <script src="<%= basePath%>js/bootstrapDatepickr-1.0.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#calendarStart").bootstrapDatepickr({date_format: "Y-m-d"});
            $("#calendarEnd").bootstrapDatepickr({date_format: "Y-m-d"});
        });
    </script>
</head>
<body>
<!-- currentPage=1&entryId=&startDate=&endDate= -->
<form action="inspectIncomeByCondition">
    起始日期：<input id="calendarStart" name="startDate"/>
    结束日期：<input id="calendarEnd" name="endDate"/>
    项目：
    <select name="entryId">
        <c:forEach items="${requestScope.entryList }" var="entry">
            <option value="${entry.en_id}">${entry.en_name}</option>
        </c:forEach>
    </select>
    <input type="submit" name="查询"/>
</form>
<table>
    <tr>
        <th align="center">拨款日期</th>
        <th align="center">拨款金额</th>
        <th align="center">拨款人</th>
        <th align="center">所给单位</th>
        <th align="center">拨款项目</th>
    </tr>
    <c:forEach items="${requestScope.page.recordlist }" var="incomeRecord">
        <tr>
            <td><fmt:formatDate value="${incomeRecord.ir_date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
            <td>${incomeRecord.ir_money}元</td>
            <td>${incomeRecord.ir_user.user_name}</td>
            <td>${incomeRecord.ir_union.un_name}</td>
            <td>${incomeRecord.ir_entry.en_name}</td>
        </tr>
    </c:forEach>


    <%--<c:if test="#request.page == null || #request.page.recordlist.size() == 0">
        <tr>
            <td colspan="5">
                当前没有支出信息
            </td>
        </tr>
    </c:if>
    <c:if test="#request.page != null && #request.page.recordlist.size() > 0">

    </c:if>
--%>
    <%--<s:if test="${request.page != null || request.page.recordlist.size() > 0 }">
        <s:forEach items="${request.page.recordlist}" var="incomeRecord">
            <tr>
                <td><fmt:formatDate value="${ir_date}" pattern="yyyy年MM月dd日" type="date" /> </td>
                <td>${incomeRecord.ir_money}元</td>
                <td>${incomeRecord.ir_user.user_name}</td>
                <td>${incomeRecord.ir_union.un_name}</td>
                <td>${incomeRecord.ir_entry.en_name}</td>
            </tr>
        </s:forEach>
    </s:if>--%>
</table>
</body>
</html>