<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    //得到url的根路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path +"/";
%>
<html>
<head>
    <title>查看拨款记录</title>
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
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

条件查询查看拨款记录
<form id="form" action="${pageContext.request.contextPath}/incomerecord/getConditionIncomeRecord/1" method="post">
    起止日期：<input type="text" id="calendarStart" name="date1" value="${date11}">~<input id="calendarEnd" type="text" name="date2" value="${date22}">
    单位：<select name="un_id" >
    <option value="0">请选择</option>
    <c:forEach items="${unionList}" var="union">
        <option value="${union.un_id}"  <c:if test="${un_id == union.un_id}">selected</c:if>  >${union.un_name}</option>
    </c:forEach>
</select>
    条目：<select name="en_id">
    <option value="0">请选择</option>
    <c:forEach items="${entryList}" var="entry">
        <option value="${entry.en_id}"  <c:if test="${en_id == entry.en_id}">selected</c:if>  >${entry.en_name}</option>
    </c:forEach>
</select>
    <input type="submit" value="查询">
</form>

<table border="1" cellpadding="1" cellspacing="1">
    <tr>
        <td>序号</td>
        <td>日期</td>
        <td>工会</td>
        <td>条目</td>
        <td>金额</td>
        <td>经手人</td>
        <td>备注</td>
    </tr>
    <c:if test="${pageBean.recordlist != null }">
        <c:forEach items="${pageBean.recordlist}" var="income" varStatus="id">
            <tr>
                <td>${id.count}</td>
                <td><fmt:formatDate value="${income.ir_date}" pattern="yyyy-MM-dd"/></td>
                <td>${income.ir_union.un_name}</td>
                <td>${income.ir_entry.en_name}</td>
                <td>${income.ir_money}</td>
                <td>${income.ir_user.user_name}</td>
                <td>${income.ir_redundancy}</td>

            </tr>
        </c:forEach>
    </c:if>
</table>
<p>支出总金额：${incomeSumMonsy}</p>
<p class="xixnxi">每页显示${pageBean.pageSize }条，总记录数${pageBean.recordCount }条
    <a href="javascript:gotoPage(1)">首页</a>
    <a href="javascript:gotoPage(${pageBean.currentPage }-1)">上一页</a>
    <a href="#">${pageBean.currentPage }/${pageBean.pageCount }</a>
    <a href="javascript:gotoPage(${pageBean.currentPage }+1)">下一页</a>
    <a href="javascript:gotoPage(${pageBean.pageCount })">尾页</a>
    <script type="text/javascript">
        function gotoPage(pageNum){
            if(pageNum > "${pageBean.pageCount}"){
                pageNum = "${pageBean.pageCount}"
            }
            if(pageNum < 1){
                pageNum = 1;
            }
            //window.location.href="${pageContext.request.contextPath}/incomerecord/getAllIncomeRecord/" + pageNum;
            var url = "${pageContext.request.contextPath}/incomerecord/getConditionIncomeRecord/" + pageNum;
            $("#form").attr("action","" + url);
            $("#form").submit();
        }
    </script>
</body>
</html>
