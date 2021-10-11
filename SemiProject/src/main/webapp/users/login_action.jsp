<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="users.UserDAO"%>
<%@ page import="users.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
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
  String userID = request.getParameter("userID");
  String userPassword = request.getParameter("userPassword");
  // String isSaved = request.getParameter("isSaved");
  UserDAO userDAO = new UserDAO();
  
  
  int result = userDAO.login(userID, userPassword);
  if (result == 1) {
    session.setAttribute("userID", userID);
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('로그인 성공')");
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
