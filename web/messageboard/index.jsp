<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/18
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<form action="save.jsp">
    留言人：<input type="text" name="username"><br>
    标题：<input type="text" name="title"><br>
    留言板：<br>
    <textarea rows="10" cols="30" name="msg"></textarea><br>
    <input type="submit" value="提交">
</form>

<a href="show.jsp">查看留言</a>
<a href="admin.jsp">删除留言</a>


</body>
</html>
