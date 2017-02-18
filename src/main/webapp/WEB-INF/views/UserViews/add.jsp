<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/16
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加用户界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-six.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
    <script>
        function jugeNull(){
            var name = $("#name").val();
            var num = $("#num").val();
            var password = $("#password").val();
            var data = {num:num};
            if(name === "" || num === "" || password === ""){
                $("#message").text("请填写完成信息")
            }else{
                //先判断用户是否存在，在进行添加
                $.ajax({
                    url:'/Unionfinance/user/repeat',
                    data:data,
                    async:false,
                    type:'post',
                    success:function(message){
                        if(message === "no"){
                            $("#form").submit(); //提交表单
                        }else{
                            $("#message").text("账号重复，请重新填写信息进行添加");
                        }
                    }
                })
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-5 col-md-5 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：首页>>用户添加</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
    <div class="container-one">
        <form action="/Unionfinance/user/add" method="post" id="form">
            <input type="hidden" name="user_id" value="${user.user_id}">
            <div class="row">
                <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                    <div class="col-lg-4 col-md-6  col-xs-6">工会:</div>
                    <div class="col-lg-6 col-md-6  col-xs-6">
                        <select name="user_union.un_id"  id="union" class="form-control">
                            <option value="">请选择</option>
                            <c:forEach items="${unions}" var="union">
                                <option value="${union.un_id}">${union.un_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="col-lg-3 col-md-4  col-xs-3">
                    <div class="col-lg-4 col-md-6  col-xs-6">类型:</div>
                    <div class="col-lg-6 col-md-6  col-xs-6">
                        <select name="user_type" id="type" class="form-control">
                            <option value="1"  >拨款管理员</option>
                            <option value="2"  >用户管理员</option>
                            <option value="3"  >工会主席</option>
                        </select>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                    <div class="col-lg-4 col-md-6  col-xs-6">
                        <span>姓名：</span>
                    </div>
                    <div class="col-lg-6 col-md-6  col-xs-6">
                        <input type="text" name="user_name"  id="name">
                    </div>
                </div>
                <div class="col-lg-3 col-md-4  col-xs-3">
                    <div class="col-lg-4 col-md-6  col-xs-6">
                        <span>账号：</span>
                    </div>
                    <div class="col-lg-6 col-md-6  col-xs-6">
                        <input type="text" name="user_num"  id="num" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                    <div class="col-lg-4 col-md-6  col-xs-6">
                        <span>密码：</span>
                    </div>
                    <div class="col-lg-6 col-md-6  col-xs-6">
                        <input type="password" name="user_password"  id="password">
                    </div>
                </div>
                <div class="col-lg-3 col-md-4  col-xs-3">
                    <div class="col-lg-4 col-md-6  col-xs-6">
                        <span>电话号码：</span>
                    </div>
                    <div class="col-lg-6 col-md-6  col-xs-6">
                        <input type="text" name="user_phonenumber" >
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-lg-offset-6 col-md-3 col-xs-3">
                    <button class="btn btn-primary" type="button" onclick="jugeNull()">确&nbsp;&nbsp;定</button>
                </div>
            </div>
        </form>
    </div>
</div>
<p id="message"></p>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
