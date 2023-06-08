<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.DateFormatSymbols" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<jsp:useBean id="calendarBean" class="calendar.CalendarBean" />

<%
    // 处理用户输入的年份和选择的月份
    int year = calendarBean.getYear();
    int month = calendarBean.getMonth();

    String yearParam = request.getParameter("year");
    String monthParam = request.getParameter("month");

    if (yearParam != null && !yearParam.isEmpty()) {
        year = Integer.parseInt(yearParam);
    }

    if (monthParam != null && !monthParam.isEmpty()) {
        month = Integer.parseInt(monthParam);
    }

    String previousButton = request.getParameter("previous");
    String nextButton = request.getParameter("next");

    // 处理上一月和下一月按钮
    if (previousButton != null) {
        if (month == 1) {
            month = 12;
            year--;
        } else {
            month--;
        }
    }

    if (nextButton != null) {
        if (month == 12) {
            month = 1;
            year++;
        } else {
            month++;
        }
    }

    calendarBean.setYear(year);
    calendarBean.setMonth(month);
%>

<form action="index.jsp" method="post">
    年份: <input type="text" name="year" value="<%= calendarBean.getYear() %>" /><br />
    月份: <select name="month">
    <option value="1" <%= calendarBean.getMonth() == 1 ? "selected" : "" %>>一月</option>
    <option value="2" <%= calendarBean.getMonth() == 2 ? "selected" : "" %>>二月</option>
    <option value="3" <%= calendarBean.getMonth() == 3 ? "selected" : "" %>>三月</option>
    <option value="4" <%= calendarBean.getMonth() == 4 ? "selected" : "" %>>四月</option>
    <option value="5" <%= calendarBean.getMonth() == 5 ? "selected" : "" %>>五月</option>
    <option value="6" <%= calendarBean.getMonth() == 6 ? "selected" : "" %>>六月</option>
    <option value="7" <%= calendarBean.getMonth() == 7 ? "selected" : "" %>>七月</option>
    <option value="8" <%= calendarBean.getMonth() == 8 ? "selected" : "" %>>八月</option>
    <option value="9" <%= calendarBean.getMonth() == 9 ? "selected" : "" %>>九月</option>
    <option value="10" <%= calendarBean.getMonth() == 10 ? "selected" : "" %>>十月</option>
    <option value="11" <%= calendarBean.getMonth() == 11 ? "selected" : "" %>>十一月</option>
    <option value="12" <%= calendarBean.getMonth() == 12 ? "selected" : "" %>>十二月</option>

</select>
    <br>
    <input type="submit" name="previous" value="上一月" />
    <input type="submit" name="next" value="下一月" />
    <input type="submit" name="submit" value="提交" />
</form>

<%-- 显示日历表 --%>
<%
    Locale locale = Locale.getDefault();
    DateFormatSymbols symbols = new DateFormatSymbols(locale);
    String[] weekdays = symbols.getShortWeekdays();

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy MMMM", locale);
    Calendar calendar = Calendar.getInstance();
    calendar.set(calendarBean.getYear(), calendarBean.getMonth() - 1, 1);
    int startDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

    String monthYear = sdf.format(calendar.getTime());

    out.println("<table>");
    out.println("<caption>" + monthYear + "</caption>");
    out.println("<tr><th>" + weekdays[1] + "</th><th>" + weekdays[2] + "</th><th>" + weekdays[3] + "</th><th>" + weekdays[4] + "</th><th>" + weekdays[5] + "</th><th>" + weekdays[6] + "</th><th>" + weekdays[7] + "</th></tr>");

    out.println("<tr>");

    // 输出前面的空白格
    for (int i = 1; i < startDayOfWeek; i++) {
        out.println("<td></td>");
    }

    // 输出日期
    int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
    int day = 1;
    while (day <= daysInMonth) {
        if (startDayOfWeek > 7) {
            out.println("</tr><tr>");
            startDayOfWeek = 1;
        }

        out.println("<td>" + day + "</td>");
        day++;
        startDayOfWeek++;
    }

    // 输出后面的空白格
    while (startDayOfWeek <= 7) {
        out.println("<td></td>");
        startDayOfWeek++;
    }

    out.println("</tr>");
    out.println("</table>");
%>
</body>
</html>

