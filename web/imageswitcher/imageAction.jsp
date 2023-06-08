<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="bean" class="imageswitcher.ImageBean" scope="session" />

<%
    if (request.getParameter("previous") != null) {
        bean.previous();
    } else if (request.getParameter("next") != null) {
        bean.next();
    }
%>

<jsp:forward page="index.jsp" />

