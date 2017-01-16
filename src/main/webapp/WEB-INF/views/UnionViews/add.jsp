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
    <form action="/Unionfinance/union/add" method="post" id="form">


        名称: <input type="text" name="un_name" id="name">
        <button type="button"  id="sure" onclick="formsubmit()">确定</button>


    </form>
<p id="message">${message}</p>
</body>
</html>
