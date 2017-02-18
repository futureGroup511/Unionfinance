<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/16
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新条目界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-two.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script>
        function InspectionName(){
            var name = $("#name").val();
            if(name === ""){
                $("#message").text("请填写非空值");
            }else{
                $("#form").submit();
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>修改条目</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
    <form action="/Unionfinance/entry/update" id="form" method="post">
        <input type="hidden" name="en_id" value="${entry.en_id}">
        <div id="body-one">
            <div class="container-one">
                <div class="row">
                    <div class="col-lg-3 col-lg-offset-4 col-md-3 col-md-offset-2 col-xs-3 col-xs-offset-2">
                        <div class="col-lg-4 col-md-6  col-xs-6">
                            <span>名称:</span>
                        </div>
                        <div class="col-lg-6 col-md-6  col-xs-6">

                            <input type="text" class="form-control"  value="${entry.en_name}" name="en_name"  id="name">
                        </div>

                    </div>
                    <div class="col-lg-1 col-md-1  col-xs-1">
                        <button class="btn btn-primary" type="button" id="sure" onclick="InspectionName()">确定</button>
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
