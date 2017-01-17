<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>查看支出记录</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/expenditurerecord/getConditionExpendRecord/1" method="post">
    起止日期：<input type="date" name="date1">~<input type="date" name="date2">
    单位：<select name="un_id" >
            <c:forEach items="${unionList}" var="union">
                <option value="${union.un_id}">${union.un_name}</option>
            </c:forEach>
        </select>
    条目：<select name="en_id">
            <c:forEach items="${entryList}" var="entry">
                <option value="${entry.en_id}">${entry.en_name}</option>
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
        <td>报账人</td>
        <td>备注</td>
    </tr>
    <c:if test="${pageBean.recordlist != null }">
        <c:forEach items="${pageBean.recordlist}" var="expend" varStatus="id">
            <tr>
                <td>${id.count}</td>
                <td><fmt:formatDate value="${expend.er_date}" pattern="yyyy-MM-dd"/></td>
                <td>${expend.er_union.un_name}</td>
                <td>${expend.er_entry.en_name}</td>
                <td>${expend.er_money}</td>
                <td>${expend.er_user.user_name}</td>
                <td>${expend.er_accour_repour}</td>
                <td>${expend.er_redundancy}</td>

            </tr>
        </c:forEach>
    </c:if>
</table>
<p>支出总金额：${expendSumMonsy}</p>
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
        window.location.href="${pageContext.request.contextPath}/expenditurerecord/getAllExpendRecord/" + pageNum;
    }
</script>
</body>
</html>
