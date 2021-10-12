<%--
  Created by IntelliJ IDEA.
  User: rk
  Date: 2021/10/12
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user info</title>
</head>
<body>
<script>
    document.getElementById("info").innerText=sessionStorage.getItem("userSessionID");
</script>
<h2><span id="info"></span>user info 입니다.</h2>
</body>
</html>
