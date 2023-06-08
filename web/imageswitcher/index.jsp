<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
  <title>index</title>
</head>
<body>
<jsp:useBean id="bean" class="imageswitcher.ImageBean" scope="session" />
<img src="<jsp:getProperty name="bean" property="currentImage" />">

<form method="post" action="imageAction.jsp">
  <input type="submit" name="previous" value="上一张">
  <input type="submit" name="next" value="下一张">
</form>
</body>
</html>
