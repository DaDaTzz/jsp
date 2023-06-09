<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/6/9
  Time: 21:36
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
<jsp:useBean class="new_memorytest.Memory" id="memory" scope="session"></jsp:useBean>

<form action="show.jsp" method="get">
    <%
        if (memory.getGrade() == "") {
            response.sendRedirect("index.jsp");
        } else {
            String[] elements = memory.getElements();
            String answer = memory.getAnswer();
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
