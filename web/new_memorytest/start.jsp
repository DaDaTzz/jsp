<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/6/9
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>start</title>
</head>

<style>
    *{
        font-size: 30px;
    }
    #span{
        color: red;
    }
</style>

<script>
    window.onload　 = function () {
        run();
    }

    var x = 10;
    function run(){
        document.getElementById("span").innerHTML = x;
        if(x == 0){
            return;
        }
        x--;
        window.setTimeout("run()", 1000); // 每隔一秒调用一次
    }
</script>

<body>
<!-- 设置页面定时跳转 -->
<meta http-equiv="refresh" content='11; url=do.jsp'>

<jsp:useBean class="new_memorytest.Memory" id="memory" scope="session"></jsp:useBean>
<!-- 设置等级属性  -->
<jsp:setProperty name="memory" property="grade" param="grade"></jsp:setProperty>

<%
    memory.setAnswer(); // 随机生成图形
%>

请用10秒钟记住以下图形<br>
<%
    out.print(memory.getAnswer());
%>
<br>
剩余时间：<span id="span" ></span>

</body>

</html>
