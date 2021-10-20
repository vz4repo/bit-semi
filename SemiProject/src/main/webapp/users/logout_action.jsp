<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>

<%
    //logout_action.jsp 시작
    System.out.println("> logout_action.jsp");
    // 세션 로그아웃
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그아웃 중..')");
    script.println("location.href='"+ request.getContextPath() +"/index.jsp'");
    script.println("</script>");

    //session.invalidate();   // 모든 세션 정보 삭제
    session.removeAttribute("myid");   // 해당 세션만 삭제
    session.setAttribute("loginok", false);	// default : false
    return;
%>