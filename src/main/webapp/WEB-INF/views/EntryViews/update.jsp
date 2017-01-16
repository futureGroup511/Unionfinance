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
    <form action="/Unionfinance/entry/update" id="form" method="post">
        <input type="hidden" name="en_id" value="${entry.en_id}">
        名称: <input type="text" name="en_name" value="${entry.en_name}" id="name">
        <button type="button" onclick="InspectionName()">确定</button>
    </form>
    <p id="message">${message}</p>
</body>
</html>
