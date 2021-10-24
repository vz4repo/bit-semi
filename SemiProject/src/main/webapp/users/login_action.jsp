<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="users.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
    String root=request.getContextPath();
%>
<body>
<%
    // login_action.jsp 시작
    System.out.println("> login_action.jsp");

    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    // String isSaved = request.getParameter("isSaved");
    UserDAO userDAO = new UserDAO();

        // 세션 체크
    if (session.getAttribute("myid") != null) {
        System.out.println(userID + (":session not null"));
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('..로그인 중')");
        script.println("location.href = '../index.jsp'");
        script.println("</script>");
        userID = (String) session.getAttribute("myid");
        return;
    }

    int result = userDAO.login(userID, userPassword);
    if (result == 1) {
        //session.setAttribute("userSessionName", userName);  // 세션ID 부여
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 성공')");
        script.println("</script>");
        System.out.println("1:userID: "+userID);
        session.setAttribute("loginOK", true);  // 로그인 상태 부여
        session.setAttribute("myid", userID);  // 세션ID 부여
        System.out.println(session.getAttribute("myid" + ":"+"loginOK"));
        response.sendRedirect("../index.jsp");
        return;
    } else if (result == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호 오류')");
        script.println("history.back()");
        script.println("</script>");
    } else if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('ID 없음')");
        script.println("history.back()");
        script.println("</script>");
    } else if (result == -2) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB 오류')");
        script.println("history.back()");
        script.println("</script>");
    }
%>
</body>

