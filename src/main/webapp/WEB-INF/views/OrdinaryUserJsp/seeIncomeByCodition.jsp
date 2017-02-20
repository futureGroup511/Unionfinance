<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- 前端样式 -->
    <link rel="stylesheet" href="<%= basePath%>css/bootstrap.css">
    <link rel="stylesheet" href="<%= basePath%>css/flowdirection.css">

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
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">

        </div>
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>公会资金流向</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
<div class="container-one">
    <form action="inspectIncomeByCondition">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-xs-4 three">
            <div class="col-lg-4 col-md-6  col-xs-6">
                <span>开始日期：</span>
            </div>
            <div class="col-lg-6 col-md-6  col-xs-6">
                <input  id="calendarStart" name="startDate" class="form-control">
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-xs-4">
            <div class="col-lg-5 col-md-6  col-xs-6">
                <span>结束日期：</span>
            </div>
            <div class="col-lg-6 col-md-6  col-xs-6">
                <input id="calendarEnd" name="endDate" class="form-control">
            </div>
        </div>
        <div class="col-lg-3 col-md-3  col-xs-3">
            <div class="col-lg-4 col-md-5  col-xs-5">
                <span>项目：</span>
            </div>
            <div class="col-lg-6 col-md-4  col-xs-4">
                <select name="entryId" class="form-control">
                    <c:forEach items="${requestScope.entryList }" var="entry">
                        <option value="${entry.en_id}">${entry.en_name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-lg-1 col-md-1  col-xs-1">
           <%-- <input class="btn btn-primary" type="submit" name="查询"/>--%>
            <button class="btn btn-primary" type="submit">提交</button>
        </div>
    </div>
    </form>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
        <thead>
        <tr class="two">
            <th>拨款日期</th>
            <th>拨款金额</th>
            <th>拨款人</th>
            <th>所给单位</th>
            <th>拨款项目</th>
        </tr>
        </thead>
        <tbody>
        <s:forEach items="${requestScope.page.recordlist}" var="incomeRecord">
            <tr>
                <td><fmt:formatDate value="${incomeRecord.ir_date}" pattern="yyyy年MM月dd日" type="date" /> </td>
                <td>${incomeRecord.ir_money}元</td>
                <td>${incomeRecord.ir_user.user_name}</td>
                <td>${incomeRecord.ir_union.un_name}</td>
                <td>${incomeRecord.ir_entry.en_name}</td>
            </tr>
        </s:forEach>
        </tbody>
    </table>
    <div class="zong">
        <p>总收入${allIncome==null?0:allIncome} &nbsp;总支出${allExpense==null?0:allExpense}</p>
    </div>
</div>
<div class="container-two">
    <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
            <p class="xixnxi">每页显示${requestScope.page.pageSize}条，总记录数${requestScope.page.recordCount}条</p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
            <nav>
                <ul class="pagination">
                    </li>
                    <!--
                     &entryId=&startDate=&endDate=
                     -->
                    <li><a href="<%= basePath%>user/inspectIncomeByCondition?currentPage=${requestScope.page.beginPageIndex }&entryId=${requestScope.entryId}&startDate=${requestScope.startDate}&endDate=${requestScope.endDate}">首页</a></li>
                    <c:if test="${requestScope.page.currentPage>1}">
                        <li><a href="<%= basePath%>user/inspectIncomeByCondition?currentPage=${requestScope.page.currentPage-1 }&entryId=${requestScope.entryId}&startDate=${requestScope.startDate}&endDate=${requestScope.endDate}">上一页</a></li>
                    </c:if>
                    <li><a href="#">当前第${requestScope.page.currentPage}页</a></li>
                    <c:if test="${requestScope.page.currentPage<requestScope.page.endPageIndex}">
                        <li><a href="<%= basePath%>user/inspectIncomeByCondition?currentPage=${requestScope.page.currentPage+1 }&entryId=${requestScope.entryId}&startDate=${requestScope.startDate}&endDate=${requestScope.endDate}">下一页</a></li>
                    </c:if>
                    <li><a href="<%= basePath%>user/inspectIncomeByCondition?currentPage=${requestScope.page.endPageIndex }&entryId=${requestScope.entryId}&startDate=${requestScope.startDate}&endDate=${requestScope.endDate}">尾页</a></li>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<!-- currentPage=1&entryId=&startDate=&endDate= -->
<%--<form action="inspectIncomeByCondition">
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
<tr>
    <th align="center">拨款日期</th>
    <th align="center">拨款金额</th>
    <th align="center">拨款人</th>
    <th align="center">所给单位</th>
    <th align="center">拨款项目</th>
</tr>
    <c:if test="${page.recordlist != null }">
        <c:forEach items="${requestScope.page.recordlist }" var="incomeRecord">
            <tr>
                <td><fmt:formatDate value="${incomeRecord.ir_date}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                <td>${incomeRecord.ir_money}元</td>
                <td>${incomeRecord.ir_user.user_name}</td>
                <td>${incomeRecord.ir_union.un_name}</td>
                <td>${incomeRecord.ir_entry.en_name}</td>
            </tr>
        </c:forEach>
    </c:if>--%>


<!-- 问题 -->
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
