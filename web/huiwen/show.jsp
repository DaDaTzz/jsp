<%@ page import="java.util.regex.Pattern" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show</title>
</head>
<body>

    <%!
        /**
         * 验证是否为正整数
         * @param s
         * @return
         */
        public static boolean isInteger(String s) {
            Pattern pattern = Pattern.compile("^[1-9]\\d*$");
            return pattern.matcher(s).matches();
        }
    %>

    <%
        Integer count = 1;
        String snum = request.getParameter("num");
        if(snum.length() == 0 || snum == null || !isInteger(snum)){
            response.sendRedirect("index.jsp");
        }else{
            Integer num = Integer.parseInt(snum);
            String RevNum = new StringBuffer(snum).reverse().toString(); // 将接收的数字反转
            Integer revNum = Integer.parseInt(RevNum);
            String res = (num + revNum) + "";
            out.print(num + "+" + revNum + "=" + res + "<br>");

            while(true){
                String revRes = new StringBuffer(res).reverse().toString(); // 将计算的结果反转
                if(res.equals(revRes)){ // 比较计算结果的正序和逆序是否相等，如果相等，则为回文数，如果不相等，则使用本次的计算结果，作为下一次需要计算的数。
                    out.print(count + "次得到回文数：" + res);
                    break;
                }
                count++;
                num = Integer.parseInt(res);
                revNum = Integer.parseInt(revRes);
                res = (num + revNum) + "";
                out.print(num + "+" + revNum + "=" + res + "<br>");
            }
        }
    %>
</body>
</html>
