<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/14
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <form action="show.jsp">
    <input type="text" name="num1" >
    <select name="operator">
      <option value="add">+</option>
      <option value="sub">-</option>
      <option value="mul">*</option>
      <option value="div">/</option>
    </select>
    <input type="text" name="num2" >
    <input type="submit" value="=">
  </form>
</body>
</html>
