<%@ page import="java.util.Enumeration" %>
<%@ page import="javax.xml.ws.Response" %><%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/15
  Time: 18:42
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

    <%
        Object o = session.getAttribute("grade");
        String msg = "";
        String answer = "";
        String res = "";
        if(o == null){
            response.sendRedirect("index.jsp");
        }else{
            answer = session.getAttribute("answer").toString();
            String[] names = new String[answer.length()];

            // answer 的个数 = 有多少个不同的name
            // 拼接出所有的name
            for(int i = 0; i < answer.length(); i++){
                names[i] = "chose" + (i+1);
            }

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
