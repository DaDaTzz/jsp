<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/18
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板</title>
</head>
<body>
<a href="index.jsp">返回留言页面</a><br><br>

<%
    Object o = application.getAttribute("map");
    if (o != null) {
        TreeMap<Integer, String[]> map = (TreeMap<Integer, String[]>) o;
        Set<Map.Entry<Integer, String[]>> entries = map.entrySet();
        for (Map.Entry<Integer, String[]> entry : entries) {
            String[] value = entry.getValue();
            String username = value[0];
            String title = value[1];
            String msg = value[2];
            String time = value[3];
            out.print("No." + entry.getKey() + ".留言者：" + username + "<br>");
            out.print("留言标题" + "《" + title + "》" + "<br>");
            out.print("留言内容：" + "<br>" + msg + "<br>");
            out.print("留言时间" + "<br>" + time + "<br>" + "-------------------------------" + "<br>");
        }
    } else {
        out.print("无留言信息！");
    }

%>

</body>
</html>
