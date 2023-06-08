<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/18
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<%
    TreeMap<Integer, String[]> treeMap = (TreeMap<Integer, String[]>) application.getAttribute("map");
    Integer id = (Integer) application.getAttribute("id");
    String username = request.getParameter("username");
    String title = request.getParameter("title");
    String msg = request.getParameter("msg");
    SimpleDateFormat slf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    if (username.length() == 0 || msg.length() == 0 || title.length() == 0) {
        response.sendRedirect("index.jsp");
    }else {
        String time = slf.format(System.currentTimeMillis());
        String[] s = {username, title, msg, time};

        if (id == null) {
            id = 1;
            application.setAttribute("id", id);
        }
        if (treeMap == null) {
            treeMap = new TreeMap<>();
            treeMap.put(id, s);
        }
        treeMap.put(id, s);
        id++;
        application.setAttribute("id", id);
        application.setAttribute("map", treeMap);
        response.sendRedirect("show.jsp");
    }




%>
</body>
</html>
