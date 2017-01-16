<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<html>
<head>
    <title>添加支出记录</title>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#tijiao").click(function(){
            if(submit() == true){
                $("#form").submit();
            }
        })

    })

    function submit() {
        if($("#money").val() == ""){
            alert("金额不能为空");
            return false;
        }
        if($("#repour").val() == ""){
            alert("报账人必须填写！");
            return false;
        }
        return true;
    }

    </script>
</head>
<body>
支出
<form:form id="form" action="${pageContext.request.contextPath}/expenditurerecord/addExpend"  method="post"
           modelAttribute="expendRecord">

    单位：<select name="er_union.un_id" >
            <c:forEach items="${unionList}" var="union">
                <option value="${union.un_id}">${union.un_name}</option>
            </c:forEach>
        </select>
    <br>
    条目：<select name="er_entry.en_id">
            <c:forEach items="${entryList}" var="entry">
                <option value="${entry.en_id}">${entry.en_name}</option>
            </c:forEach>
        </select><br>
    金额：<input id="money" type="text" name="er_money"><br>
    报账人：<input id="repour" type="text" name="er_accour_repour"><br>
    备注：<input type="text" name="er_redundancy"><br>
    <input id="tijiao" type="button" value="提交">
</form:form>
</body>
</html>
