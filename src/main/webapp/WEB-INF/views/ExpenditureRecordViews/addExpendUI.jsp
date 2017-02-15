<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    //得到url的根路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path +"/";
%>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<html>
<head>
    <title>添加支出记录</title>
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>css/list-one.css">
    <script src="${pageContext.request.contextPath}/js/addentry.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#tijiao").click(function(){
                if(submit() == true){
                    $("#form").submit();
                }
            })

        })

        function submit() {
            if($("#money").val() == ""){
                alert("金额不能为空");
                return false;
            }
            if($("#repour").val() == ""){
                alert("报账人必须填写！");
                return false;
            }
            return true;
        }

    </script>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <%--<a> <button class="btn btn-primary" type="button"><img src="images/yonghuzengjia.png" width="25" height="25">增加用户</button></a>--%>
        </div>
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：二级管理员>>添加支出记录</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎 ${user.user_name} 登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
<form:form id="form" action="${pageContext.request.contextPath}/expenditurerecord/addExpend"  method="post">
    <div class="container-one">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>单位：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select name="er_union.un_id"  class="form-control">
                        <c:forEach items="${unionList}" var="union">
                            <option value="${union.un_id}">${union.un_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-3 col-md-4  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>金额：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input id="money" type="text" name="er_money" class="form-control">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>报账人：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input id="repour" type="text" name="er_accour_repour" class="form-control">
                </div>
            </div>
            <div class="col-lg-3 col-md-4  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>条目：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select name="er_entry.en_id" id="entry" class="form-control">
                        <c:forEach items="${entryList}" var="entry">
                            <option value="${entry.en_id}">${entry.en_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-lg-2 col-lg-pull-1 col-md-2 col-md-pull-1 col-xs-3 col-xs-pull-1">
                <p><a href="#" onclick="addEntry(1)">如果没有此条目，请点击添加</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>备注：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" name="er_redundancy" class="form-control">
                </div>
            </div>

            <div class="col-lg-1 col-md-1 col-xs-1">
                <button class="btn btn-primary" id="tijiao" type="button">提&nbsp;&nbsp;交</button>
            </div>
        </div>
    </div>
</form:form>
</div>
${message}
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>






<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<html>
<head>
    <title>添加支出记录</title>
    <script src="${pageContext.request.contextPath}/js/addentry.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#tijiao").click(function(){
            if(submit() == true){
                $("#form").submit();
            }
        })

    })

    function submit() {
        if($("#money").val() == ""){
            alert("金额不能为空");
            return false;
        }
        if($("#repour").val() == ""){
            alert("报账人必须填写！");
            return false;
        }
        return true;
    }

    </script>--%>
<%--</head>
<body>
支出
<form:form id="form" action="${pageContext.request.contextPath}/expenditurerecord/addExpend"  method="post"
           modelAttribute="expendRecord">

    单位：<select name="er_union.un_id" >
            <c:forEach items="${unionList}" var="union">
                <option value="${union.un_id}">${union.un_name}</option>
            </c:forEach>
        </select>
    <br>
    条目：<select name="er_entry.en_id" id="entry">
            <c:forEach items="${entryList}" var="entry">
                <option value="${entry.en_id}">${entry.en_name}</option>
            </c:forEach>
        </select><a href="#" onclick="addEntry(1)">添加条目</a><br>
    金额：<input id="money" type="text" name="er_money"><br>
    报账人：<input id="repour" type="text" name="er_accour_repour"><br>
    备注：<input type="text" name="er_redundancy"><br>
    <input id="tijiao" type="button" value="提交">
</form:form>
</body>
</html>--%>
