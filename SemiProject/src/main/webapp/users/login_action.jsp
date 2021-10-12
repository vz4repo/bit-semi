<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="users.UserDAO" %>
<%@ page import="users.UserDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>login action</title>
</head>
<body>
<%
    System.out.println("REDIRECT:login_action.jsp");
    String userID = request.getParameter("userID");
    String userPassword = request.getParameter("userPassword");
    // String isSaved = request.getParameter("isSaved");
    UserDAO userDAO = new UserDAO();
//    HttpSession session = request.getSession();

    // 세션 체크
    if(session.getAttribute("userSessionID") != null){
        userID = (String)session.getAttribute("userSessionID");
        System.out.println(userID + ":session check");
    }
    // 세션에 ID가 담겼으면 로그인 불가
    if(userID != null){
        System.out.println(userID + (":session not null"));
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert("+ userID +"', 로그인 중')");
        script.println("location.href = '../index.jsp'");
        script.println("</script>");
    }

    int result = userDAO.login(userID, userPassword);
    if (result == 1) {
        session.setAttribute("userSessionID", userID);  // 세션ID 부여
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert("+ userID+"', 로그인 성공')");
        script.println("location.href = '../index.jsp'");
        script.println("</script>");
    } else if (result == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호 오류')");
        script.println("location.href = './login.jsp'");
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
        script.println("location.href = './login.jsp'");
        script.println("</script>");
    }
%>
</body>
</html>
