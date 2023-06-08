<%@ page import="java.util.regex.Pattern" %><%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/14
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show</title>
</head>
<body>
    <%!
        /**
         * 判断是否为数字
         * @param str
         * @return
         */
        public static boolean isNumber(String str){
            Pattern pattern = Pattern.compile("[-+]?\\d+(?:\\.\\d+)?");
            return pattern.matcher(str).matches();
        }
    %>

    <%
        String n1 = request.getParameter("num1");
        String n2 = request.getParameter("num2");
        if(n1.length() == 0 || n2.length() == 0 || !isNumber(n1) || !isNumber(n2)){
            response.sendRedirect("index.jsp");
        }else{
            Double num1 = Double.parseDouble(n1);
            Double num2 = Double.parseDouble(n2);
            String operator = request.getParameter("operator");
            if("add".equals(operator)){
                Double res = num1 + num2;
                out.print(num1 + "+" + num2 + "=" + res);
            } else if("sub".equals(operator)){
                Double res = num1 - num2;
                out.print(num1 + "-" + num2 + "=" + res);
            }else if("mul".equals(operator)){
                Double res = num1 * num2;
                out.print(num1 + "*" + num2 + "=" + res);
            }else if("div".equals(operator)){
                Double res = num1 / num2;
                out.print(num1 + "/" + num2 + "=" + res);
            }
        }

    %>
</body>
</html>
