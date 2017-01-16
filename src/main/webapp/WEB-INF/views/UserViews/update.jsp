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
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
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
    <form action="/Unionfinance/user/update" method="post" id="form">
              <input type="hidden" name="user_id" value="${user.user_id}">
        姓名: <input type="text" name="user_name" value="${user.user_name}" id="name">
        账号: <input type="text" name="user_num" value="${user.user_num}" readonly >
        密码: <input type="password" name="user_password" value="${user.user_password}" id="password">
        工会:
            <select name="user_union.un_id" id="union">
                <option value="">请选择</option>
                <c:forEach items="${unions}" var="union">
                        <option value="${union.un_id}" >${union.un_name}</option>
                </c:forEach>
            </select>

        类型: <select name="user_type" id="type">
                    <option value="0" >拨款管理员</option>
                    <option value="1">用户管理员</option>
                    <option value="2">工会主席</option>
             </select>
        电话号码: <input type="text" name="user_phonenumber" value="${user.user_phonenumber}">
        <button type="button" onclick="jugeNull()">确定</button>
    </form>
<p id="message">${message}</p>
</body>
</html>
