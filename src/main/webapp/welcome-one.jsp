<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/2/18
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <style>
        *{
            padding:0;
            margin:0;
        }
        .background img{
            width:100%;
        }
        .row{
            width:100%;
            margin-top:18%;
        }
        h2{
            font-size:2.5vw;
            margin-left:10%;
            margin-right:10%;
            color:#D3111A;
            font-family:黑体;
            color:white;

        }
        body{
            /*background-image:url(images/background.png);*/
            /*width:100%;
             height:100%;
             bottom:0px;
             background-size: 100%;
             background-attachment:fixed;
             background-repeat:no-repeat;
             position:fixed;
             background-color:#83D1EC;
          /*基于Webkit内核的实现*/
            /* background:-webkit-gradient(linear,left top ,right bottom,from(#83D1EC),to(#FDFAFA));
             background-attachment: fixed; */
            /*基于Gecko内核的实现*/
            /*background:-moz-linear-gradient(right,#83D1EC,#FDFAFA);
            background-size: 100%;*/

        }

    </style>
</head>
<body>
<div class="row">
    <div class="col-lg-12  col-md-12  col-xs-12 ">
        <h2><marquee behavior="scroll">欢迎登录工会资金应用系统</marquee></h2>
    </div>
</div>
<div class="background navbar-fixed-top" style="position:absolute; z-index:-1;width:100%; height:100%; bottom:0px;  padding: 0;
  margin: 0; bottom:0;  background-size: 100%; background-attachment:fixed;">
    <img src="${pageContext.request.contextPath}/images/111.png" width="600" height="903"></div>
<script type="text/javascript">
    $(function(){
        $('#background').height($(window).height());
        $('#background').width($(window).width());
    });
</script>
</body>
</html>
