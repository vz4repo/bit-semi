<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    alert(sessionStorage.getItem("userSessionID") + ', 로그아웃');
    location.href="../index.jsp";
</script>
<%
    session.invalidate();   // 모든 세션 정보 삭제
    //  session.removeAttribute("userSessionID");   // 해당 세션만 삭제
    %>

</body>
</html>
