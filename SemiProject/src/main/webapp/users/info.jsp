<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.io.PrintWriter" %>
<%
    //login.jsp 시작
    System.out.println("> info.jsp");

    String userID = (String) session.getAttribute("userSessionID");

    // 빈 세션 체크
    if (userID == null) {
        PrintWriter script = response.getWriter();
        System.out.println("session is null");
        script.println("<script>");
        script.println("alert('로그인 하세요')");
        script.println("location.href='"+ request.getContextPath() +"/index.jsp?main=users/login.jsp'");
        script.println("</script>");
        return;
    }
%>
<div class="user_info" style="position: absolute">
    <h1><span id="info"><%=userID%></span> 님의 info 입니다.</h1>
</div>