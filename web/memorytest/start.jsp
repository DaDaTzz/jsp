<%@ page import="java.util.Random" %>
<%@ page import="java.util.Timer" %>
<%@ page import="java.util.TimerTask" %>
<%--
  Created by IntelliJ IDEA.
  User: 钟香达
  Date: 2023/4/15
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>start</title>
</head>


<style>
    *{
        font-size: 30px;
    }
    #span{
        color: red;
    }
</style>

<script>
    window.onload = function () {
        run();
    }

    var x = 10;
    function run(){
        document.getElementById("span").innerHTML = x;
        if(x == 0){
            return;
        }
        x--;
        window.setTimeout("run()", 1000); // 每隔一秒调用一次
    }
</script>

<body>
    <!-- 设置页面定时跳转 -->
    <meta http-equiv="refresh" content='11; url=do.jsp'>

  <%
      String[] elements = {"✰","❤","♣","❋","★","◍","▲","✳"};
      session.setAttribute("elements", elements);
      String grade = request.getParameter("grade");
      String answer = "";
      if(grade == null || grade.length() == 0){ // 没有选择等级，直接跳转回index页面
          response.sendRedirect("index.jsp");
      }else{
          session.setAttribute("grade",grade); // 将等级存入到session域中
          Random random = new Random();
          if("s".equals(grade)){
              for(int i = 0; i < 4; i++){
                  // 以随机数作为 elements 数组的下标，生成一组图案。
                  answer += elements[random.nextInt(elements.length)]; // 将随机生成的这组图案拼接成字符串
              }
          }else if("ss".equals(grade)){
              for(int i = 0; i < 8; i++){
                  answer += elements[random.nextInt(elements.length)];
              }
          }else if("sss".equals(grade)){
              for(int i = 0; i < 15; i++){
                  answer += elements[random.nextInt(elements.length)];
              }
          }
          session.setAttribute("answer", answer); // 将随机生成的这组图形放进session域中
      }
  %>

    请用10秒钟记住以下图形<br>
    <%=answer%><br>
    剩余时间：<span id="span" ></span>


</body>
</html>
