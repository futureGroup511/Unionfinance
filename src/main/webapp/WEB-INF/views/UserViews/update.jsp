<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/1/16
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改用户界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table-six.css">

    <script>
        $(document).ready(function () {

            var type = document.getElementById("type");

            for(var i=0;i < type.length;i++){
                if(type[i].value == ${user.user_type}){
                    type[i].setAttribute("selected","selected");
                }
            }

            var union = document.getElementById("union");
            for(var i=0;i < union.length;i++){
                if(union[i].value == ${user.user_union.un_id}){
                    union[i].setAttribute("selected","selected");
                }
            }

        })
        function jugeNull(){
            var name = document.getElementById("name");
            var password = document.getElementById("password");
            if(name.value === "" || password.value === ""){
                $("#message").text("信息填写不完整");
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
            <p>当前位置：首页>>用户修改</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
    </div>
</div>
<div id="body-one">
    <div class="container-one">
    <form action="/Unionfinance/user/update" method="post" id="form" class="table">
        <input type="hidden" name="user_id" value="${user.user_id}">
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">工会:</div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select name="user_union.un_id" id="union" class="form-control">
                        <option value="">请选择</option>
                        <c:forEach items="${unions}" var="union">
                            <c:if test="${user.user_union.un_id eq union.un_id}"><option value="${union.un_id}" selected >${union.un_name}</option></c:if>
                            <c:if test="${user.user_union.un_id ne union.un_id}"><option value="${union.un_id}"  >${union.un_name}</option></c:if>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="col-lg-3 col-md-4  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">类型:</div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <select name="user_type" id="type" class="form-control">
                        <option value="1"  <c:if test="${user.user_type eq 1}"> selected</c:if>>拨款管理员</option>
                        <option value="2"  <c:if test="${user.user_type eq 2}"> selected</c:if>>支出管理员</option>
                        <option value="3"  <c:if test="${user.user_type eq 3}"> selected</c:if>>工会主席</option>
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
                    <input type="text" name="user_name" value="${user.user_name}" id="name">
                </div>
            </div>
            <div class="col-lg-3 col-md-4  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>账号：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" name="user_num" value="${user.user_num}" readonly >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-lg-offset-3 col-md-4 col-md-offset-2 col-xs-3 col-xs-offset-2" style="margin-left:28%;">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>密码：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="password" name="user_password" value="${user.user_password}" id="password">
                </div>
            </div>
            <div class="col-lg-3 col-md-4  col-xs-3">
                <div class="col-lg-4 col-md-6  col-xs-6">
                    <span>电话号码：</span>
                </div>
                <div class="col-lg-6 col-md-6  col-xs-6">
                    <input type="text" name="user_phonenumber" value="${user.user_phonenumber}">
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
<p id="message">${message}</p>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
