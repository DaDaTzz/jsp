<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/15
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>do</title>
</head>

<style>
    * {
        font-size: 30px;
    }
</style>
<body>

<form action="show.jsp" method="get">
    <%
        Object o = session.getAttribute("grade");
        if (o == null) {
            response.sendRedirect("index.jsp");
        } else {
            String[] elements = (String[]) session.getAttribute("elements");
            String answer = session.getAttribute("answer").toString();
                for (int i = 0; i < answer.length(); i++) {
                    out.print("第" + (i + 1) + "个：");
                    for (String element : elements) {
    %>
                        <input type="radio" name="chose<%=i+1%>" value="<%=element%>"><%=element%>
    <%
                    }
                    out.print("<br>");
                }
            }
    %>

    <input type="submit" value="提交">
</form>

</body>
</html>
