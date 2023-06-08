<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/15
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>


<style>
    *{
        font-size: 30px;
    }
</style>
<body>

<H2>挑战难度</H2>
<form action="start.jsp">
    <input type="radio" name="grade" value="s">初级
    <input type="radio" name="grade" value="ss">中级
    <input type="radio" name="grade" value="sss">高级
    <input type="submit" value="开始">
</form>

</body>
</html>
