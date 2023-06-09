<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/6/9
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:useBean id="fraction" class="fraction.Fraction" scope="session"></jsp:useBean>
<jsp:setProperty name="fraction" property="num" param="num"/>

<%
    out.print(fraction.getNum() + "表示为分数：" + fraction.res());
%>

</body>

</html>
