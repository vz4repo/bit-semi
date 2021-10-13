<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
//login.jsp 시작
System.out.println("> logout_action.jsp");
// 세션 로그아웃
  PrintWriter script = response.getWriter();
  script.println("<script>");
  script.println("alert(sessionStorage.getItem('userSessionID') + ', 로그아웃')");
  script.println("location.href('${pageContext.request.contextPath}/index.jsp')");
  script.println("</script>");

    session.invalidate();   // 모든 세션 정보 삭제
    //  session.removeAttribute("userSessionID");   // 해당 세션만 삭제
    %>
</body>
</html>
