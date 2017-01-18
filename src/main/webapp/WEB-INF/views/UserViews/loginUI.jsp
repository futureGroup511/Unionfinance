<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //得到url的根路径
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path +"/";
%>
<html>
<head>
    <title>登陆页面</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/login" method="post">
账号：<input type="text" name="username">
密码:<input type="password" name="password">
    <input type="submit" value="提交">
</form>
${message}
</body>
</html>
