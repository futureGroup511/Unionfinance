<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/3/11
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-seven.css">

</head>
<script>
    function isSame(){
        var first = $("#first").val();
        var second = $("#second").val();
        if(first === "" || second === "") $("#message").text("请填写完整内容");
        else if(first !== second) $("#message").text("两次输入密码不相同");
        else {
            alert("修改成功");
            $("#form").submit();
        }
    }
</script>
<body>
    <div class="container">
        <div class="row">
            <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
                <a> <button class="btn btn-primary" type="button"><img src="${pageContext.request.contextPath}/images/yonghuzengjia.png" width="25" height="25">增加用户</button></a>
            </div>
            <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
                <p>当前位置：首页>>用户修改密码</p>
            </div>
            <div class="col-lg-2 col-md-3 col-xs-3">

            </div>
        </div>
    </div>
    <form action="/Unionfinance/user/modifypassword" id="form" method="post">
        <div id="body-one">
            <div class="container-one">
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-xs-4 col-xs-offset-4">
                        <div class="col-lg-5 col-md-7 col-xs-7">
                            <p>请输入新的密码:</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-xs-5">
                            <input type="password" name="password" id="first" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-lg-offset-4 col-md-5 col-md-offset-4 col-xs-4 col-xs-offset-4">
                        <div class="col-lg-5 col-md-7 col-xs-7">
                            <p>再一次输入密码:</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-xs-5">
                            <input type="password" id="second" class="form-control">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-xs-3">
                        <button onclick="isSame()" type="button" class="btn btn-primary">确&nbsp;&nbsp;定</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <p id="message"></p>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
</html>
