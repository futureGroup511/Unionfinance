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
        <form action="/Unionfinance/user/add" method="post" id="form">
                工会: <select name="user_union.un_id" >
                            <option value="">请选择</option>
                            <c:forEach items="${unions}" var="union">
                                <option value="${union.un_id}">${union.un_name}</option>
                            </c:forEach>
                     </select>
                类型: <select name="user_type" >
                            <option value="0">拨款管理员</option>
                            <option value="1">支出管理员</option>
                            <option value="2">工会主席</option>
                     </select>
                姓名: <input type="text" name="user_name" id="name">
                账号: <input type="text" name="user_num" id="num">
                密码: <input type="text" name="user_password" id="password">
                电话号码: <input type="text" name="user_phonenumber">
                <button type="button" onclick="jugeNull()">确定</button>
        </form>
<p id="message"></p>
</body>
</html>
