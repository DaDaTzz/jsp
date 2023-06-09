<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/6/9
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>result</title>
</head>

<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">


<style>
    *{
        font-size: 30px;
    }
    #span{
        font-size: 100px;
        color: red;
    }
</style>

<body>

<jsp:useBean class="new_memorytest.Memory" id="memory" scope="session"></jsp:useBean>

<%
    String msg = "";
    String answer = "";
    String res = "";
    if(memory.getGrade() == ""){
        response.sendRedirect("index.jsp");
    }else{
        answer = memory.getAnswer();
        memory.setNames();
        String[] names = memory.getNames();

        // 遍历name数组，拿到参数
        for(String name : names) {
            String parameter = request.getParameter(name);
            if (parameter == null) {
                res += "?";
            } else {
                res += parameter;
            }
        }

        if(answer.equals(res)){
            msg += "回答正确~~~";
        }else{
            msg += "脑子不太行!!!";
        }

    }


%>
正确答案：<%=answer%><BR>
用户答案：<%=res%><BR>
<span id="span"><%=msg%></span>

</body>

</html>
