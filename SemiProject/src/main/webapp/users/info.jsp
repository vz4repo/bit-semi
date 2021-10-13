<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = (String) session.getAttribute("userSessionID");
%>
<div class="user_info">
    <h2><span id="info"><%=userID%></span> 님의 info.jsp 입니다.</h2>
</div>