<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="index.jsp" >
    输入目录名(例如D:/2000)<input type="text" name="dName"><br>
    输入文件扩展名(例如java)<input type="text" name="suffix"><br>
    <input type="submit" value="提交">
</form>

<%
    String dName = request.getParameter("dName");
    String suffix = request.getParameter("suffix");
%>

<jsp:useBean id="fileBean" class="getfile.FileBean" scope="page">
    <jsp:setProperty name="fileBean" property="dPah" value="<%=dName%>"></jsp:setProperty>
    <jsp:setProperty name="fileBean" property="suffix" value="<%=suffix%>"></jsp:setProperty>
</jsp:useBean>

目录<%=dName%>中扩展名是<%=suffix%>的文件有：<br>
<%
    fileBean.getFile();
    List<File> fileList = fileBean.getFileList();
    for (File file : fileList) {
        out.print(file.getName() + "<br>");
    }
%>

</body>
</html>
