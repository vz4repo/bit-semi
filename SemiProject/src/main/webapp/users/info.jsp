<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = (String) session.getAttribute("userSessionID");
%>
<div class="user_info" style="position: absolute">
    <h1><span id="info"><%=userID%></span> 님의 info 입니다.</h1>
</div>