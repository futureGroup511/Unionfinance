<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/2/18
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <frameset   rows="16%,90%"  cols="100%" frameborder="0" border="0" framespacing="0" name="head">
        <frame  src="${pageContext.request.contextPath}/head-one.jsp" scrolling="no"></frame>
        <frameset cols="12%,77%"  frameborder="0"  framespacing="0" name="caidan">
            <frame src="${pageContext.request.contextPath}/caidan-one.jsp" scrolling="no"></frame>
            <frame src="${pageContext.request.contextPath}/welcome-one.jsp" <%--scrolling="no"--%> frameborder="1"   name="right" /></frameset>
        <noframes></noframes>

        </head>
<body>

</body>
</html>
