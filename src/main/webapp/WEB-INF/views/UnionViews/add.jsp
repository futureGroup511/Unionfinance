<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/15
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加工会</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-two.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
</head>
<script>
    function formsubmit() {
        var name = $("#name").val();
        if(name != ""){
            var datas = {name:name};
            $.ajax({
                url:"/Unionfinance/union/repeat",
                data:datas,
                type:'post',
                success:function(message){
                    if(message === "yes"){ //存在，不可以添加
                        $("#message").text("重复，不能添加");
                    }else{
                        $("#form").submit();
                    }
                }
            })
        }else{
            $("#message").text("信息不能为空")
        }
    }

</script>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>添加公会</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
<form action="/Unionfinance/union/add" method="post" id="form">
<div id="body-one">
    <div class="container-one">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-4 col-md-3 col-md-offset-2 col-xs-3 col-xs-offset-2">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>名称：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" class="form-control"  name="un_name" id="name">
                </div>
            </div>
            <div class="col-lg-1 col-md-1  col-xs-1">
                <button class="btn btn-primary" type="button" id="sure" onclick="formsubmit()">确定</button>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-4 col-md-5 col-md-offset-2 col-xs-5 col-xs-offset-2">
                <p id="message">${message}</p>
            </div>
        </div>
    </div>
</div>

    </form>

</body>
</html>
