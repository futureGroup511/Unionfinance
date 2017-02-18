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
    <link rel="stylesheet" href="<%= basePath%>css/bootstrap.css">
    <link rel="stylesheet" href="<%= basePath%>css/list-two.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <%--<a> <button class="btn btn-primary" type="button"><img src="images/yonghuzengjia.png" width="25" height="25">增加用户</button></a>--%>
        </div>
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：二级管理员>>查看拨款金额</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎 ${user.user_name} 登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
    <form action="${pageContext.request.contextPath}/incomerecord/getConditionIncomeRecord/1" method="post">
        <div class="container-one">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-3 col-xs-3 col-xs-offset-3" style="margin-left:31%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>开始日期：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" id="calendarStart" name="date1" class="form-control">
                </div>
            </div>
            <div class="col-lg-3 col-lg-pull-1 col-md-4 col-md-pull-1 col-xs-3 col-xs-pull-1">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>截止日期：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input id="calendarEnd" type="text" name="date2" class="form-control">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-3 col-xs-3 col-xs-offset-3" style="margin-left:31%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>单位：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select name="un_id" class="form-control">
                        <option value="0">请选择</option>
                        <c:forEach items="${unionList}" var="union">
                            <option value="${union.un_id}">${union.un_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-3 col-lg-pull-1 col-md-3 col-md-pull-1 col-xs-3 col-xs-pull-1">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>条目：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select name="en_id" class="form-control">
                        <option value="0">请选择</option>
                        <c:forEach items="${entryList}" var="entry">
                            <option value="${entry.en_id}">${entry.en_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-1 col-lg-pull-1 col-md-1 col-md-pull-1 col-xs-1 col-xs-pull-1">
                <input class="btn btn-primary" type="submit" value="查&nbsp;&nbsp;询">
            </div>
        </div>
    </div>
    </form>
    <div class="table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead>
            <tr class="two">
                <th>序号</th>
                <th>日期</th>
                <th>工会</th>
                <th>条目</th>
                <th>金额</th>
                <th>经手人</th>
                <th>备注</th>
            </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>
    </div>
    <div class="container-four">
        <p>支出总金额：${incomeSumMonsy}元</p>
    </div>



    <div class="container-two">
        <div class="row">
            <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
                <p class="xixnxi">每页显示${pageBean.pageSize }条，总记录数${pageBean.recordCount }条</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
                <nav>
                    <ul class="pagination">
                        </li>
                        <li><a href="javascript:gotoPage(1)">首页</a></li>
                        <li><a href="javascript:gotoPage(${pageBean.currentPage }-1)">上一页</a></li>
                        <li><a href="#">${pageBean.currentPage }/${pageBean.pageCount }</a></li>
                        <li><a href="javascript:gotoPage(${pageBean.currentPage }+1)">下一页</a></li>
                        <li><a href="javascript:gotoPage(${pageBean.pageCount })">尾页</a></li>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function gotoPage(pageNum){
        if(pageNum > "${pageBean.pageCount}"){
            pageNum = "${pageBean.pageCount}"
        }
        if(pageNum < 1){
            pageNum = 1;
        }
        window.location.href="${pageContext.request.contextPath}/incomerecord/getAllIncomeRecord/" + pageNum;
    }
</script>
</body>
</html>






<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body>--%>

<%--查看拨款记录
<form action="${pageContext.request.contextPath}/incomerecord/getConditionIncomeRecord/1" method="post">
    起止日期：<input id="calendarStart" type="text" name="date1">~<input id="calendarEnd" type="text" name="date2">
    单位：<select name="un_id" >
    <option value="0">请选择</option>
    <c:forEach items="${unionList}" var="union">
        <option value="${union.un_id}">${union.un_name}</option>
    </c:forEach>
</select>
    条目：<select name="en_id">
    <option value="0">请选择</option>
    <c:forEach items="${entryList}" var="entry">
        <option value="${entry.en_id}">${entry.en_name}</option>
    </c:forEach>
</select>
    <input type="submit" value="查询">
</form>--%>

<%--<table border="1" cellpadding="1" cellspacing="1">
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
            window.location.href="${pageContext.request.contextPath}/incomerecord/getAllIncomeRecord/" + pageNum;
        }
    </script>
</body>
</html>--%>
