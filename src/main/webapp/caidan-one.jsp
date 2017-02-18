<%--
  Created by IntelliJ IDEA.
  User: 牛洧鹏
  Date: 2017/2/18
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/caidan-one.css">
</head>
<body id="bg">
<div class="container">

    <div class="leftsidebar_box">
        <div class="line"></div>

        <dl class="system_log">
            <dt onClick="changeImage()" ><img src="${pageContext.request.contextPath}/images/select_xl01.png">公会管理</dt>
            <dd>
                <a href= "/Unionfinance/union/add" target="right">工会添加</a>
            </dd>
            <dd>
                <a href= "/Unionfinance/union/delete" target="right">工会修改和删除</a>
            </dd>
        </dl>

        <dl class="channel">
            <dt><a href= "/Unionfinance/incomerecord/incomerecordview" target="right">拨款</a><img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
        </dl>
        <dl class="channel">
            <dt><a href="${pageContext.request.contextPath}/expenditurerecord/addExpendUI" target="right">支出</a><img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
        </dl>
        <dl class="custom">
            <dt onClick="changeImage()">收入/支出情况<img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
            <dd class="first_dd">
                <a href="user/inspectExpenseByCondition?currentPage=1&entryId=&startDate=&endDate=" target="right">查看支出情况</a><br/>
                <a href="user/inspectIncomeByCondition?currentPage=1&entryId=&startDate=&endDate=" target="right">查看收入情况</a><br/>
            </dd>
        </dl>
        <dl class="channel">
            <dt><a href="/Unionfinance/entry/findall" target="right">收入/支出条目</a><img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
        </dl>
        <dl class="channel">
            <dt><a href="/Unionfinance/user/findall" target="right">用户</a><img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
        </dl>
        <dl class="custom">
            <dt onClick="changeImage()">收入/支出<img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
            <dd class="first_dd">
                <a href="${pageContext.request.contextPath}/expenditurerecord/getAllExpendRecord/1" target="right">查看支出</a>

            </dd>
            <dd>
                <a href="${pageContext.request.contextPath}/incomerecord/getAllIncomeRecord/1" target="right">查看收入</a>
            </dd>
        </dl>
        <dl class="chan">
            <dt onClick="changeImage()"><a href="${pageContext.request.contextPath}/user/logout" target="_top">退出</a><img src="${pageContext.request.contextPath}/images/select_xl01.png"></dt>
            <!--<dd class="first_dd"><a href="#">报名</a></dd>
            <dd><a href="#">报名状态</a></dd>
            <dd><a href="#">获奖记录</a></dd>-->
        </dl>

        <!--<dl class="custom">
             <dt onClick="changeImage()">学院负责人服务</dt>
             <dd class="first_dd"><a href="#">申报项目名称</a></dd>
             <dd><a href="#">申报项目名称审核状态</a></dd>
             <dd><a href="#">申报项目</a></dd>
             <dd class="first_dd"><a href="#">申报项目状态</a></dd>
             <dd><a href="#">审核报名</a></dd>
             <dd><a href="#">选择比赛进入下一阶段</a></dd>
             <dd><a href="#">录入成绩</a></dd>
         </dl>-->

        <!-- <div class="one">
            <img src="images/zhulou.png" width="330" height="225">
          </div>-->
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $(function(){
        $(".leftsidebar_box dd").hide();
        $(".leftsidebar_box dt").click(function(){

            $(this).parent().find('dd').removeClass(("menu_chioce"),6000);
            $(".menu_chioce").slideUp();
            $(this).parent().find('dd').slideToggle();
            $(this).parent().find('dd').addClass("menu_chioce");
        })
    })
</script>

</body>
</html>
