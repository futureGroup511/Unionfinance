<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/2/18
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>头部</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head-one.css" />

</head>
<body>
<div class="head">
    <div class="row">
        <div class="col-lg-5 col-md-5 col-xs-5 col-lg-offset-4 col-md-offset-4 col-xs-offset-4">
            <h3 class="first">河南科技学院工会资金管理系统</h3>
        </div>

    </div>
    <div class="background navbar-fixed-top"  style="z-index:-1;width:100%;">
        <img src="${pageContext.request.contextPath}/images/header.png" width="100%" height="120"> </div>
</div>
<script type="text/javascript">
    $(function(){
        $('#background').height($(window).height());
        $('#background').width($(window).width());
    });
</script>

</body>
</html>
