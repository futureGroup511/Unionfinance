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
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>/css/index-one.css">
</head>
<script>
   if(window.parent != window)  window.parent.location.href= "/Unionfinance/user/loginUI";
</script>
<body>
<div class="container">
    <div class="header">
        <p>河南科技学院公会资金应用系统</p>
    </div>
    <div class="body">
        <div class="box">
            <div class="input-one">
                <form class="form-inline" >
                    <!--<label for="account" >身份</label>
                     <select class="form-control input-lg">
                        <option>&ensp;&ensp;&ensp;捐款人</option>
                          <option>&ensp;&ensp;&ensp;项目负责人</option>
                        <option>&ensp;&ensp;&ensp;学院负责人</option>
                     </select>-->
                </form>
            </div>
            <div class="input-two">
                <form class="form-inline" id="form" method="post" action="${pageContext.request.contextPath}/user/login">
                    <input type="hidden" id="address" value="<%=basePath%>">
                    <div class="label-one">
                        <label for="account" >账号</label>
                        <input type="text" class="form-control"  placeholder="请输入用户名" name="username">
                    </div>
                    <!-- </form>
                 </div>
                 <div class="input-three">
                      <form class="form-inline">-->
                    <div class="label-two">
                        <label for="password" >密码</label>
                        <input type="password" class="form-control"  placeholder="请输入密码" name="password">
                    </div>
                </form>
            </div>
            <div class="input-four">
                <button class="btn  btn-primary one" form="form" type="submit">登&nbsp;&nbsp;录</button>
                <!--<button class="btn  btn-primary" type="button">重&nbsp;&nbsp;置</button>-->
            </div>
        </div>
    </div>
</div>

<ul class="bg-bubbles">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>

<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</body>


</html>
