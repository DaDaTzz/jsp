<%@ page import="java.util.TreeMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/18
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理页</title>
</head>
<body>
<H1>删除留言</H1><br>
<FORM action="admin.jsp">
    密码：<input type="password" name="pwd"><br>
    留言序号：<input type="text" name="id"><br>
    <input type="submit" value="删除">
</FORM>

<a href="index.jsp">返回留言页</a>
<a href="show.jsp">查看留言板</a>


<%
    String pwd = request.getParameter("pwd");

    if (pwd != null) {
        if (!"admin".equals(pwd)) {
            out.print("<H3>密码错误！<H3>");
        } else {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                TreeMap<Integer, String[]> treeMap = (TreeMap<Integer, String[]>) application.getAttribute("map");
                if (treeMap == null) {
                    out.print("<H3>留言板为空，无信息可删除！<H3>");
                } else {
                    Set<Integer> ids = treeMap.keySet();
                    if (!ids.contains(id)) {
                        out.print("<H3>删除失败，留言id不存在！<H3>");
                    } else {
                        treeMap.remove(id);
                        out.print("<H3>删除成功<H3>");
                    }
                }
            } catch (Exception e) {
                out.print("<H3>请输入数字类型的id！<H3>");
            }


        }
    }
%>
</body>
</html>
