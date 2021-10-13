<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>세미프로젝트</title>
<link rel="stylesheet" href="css/style.css">
</head>
<%
	String mainpage="layout/main.jsp";
	if(request.getParameter("main")!=null){
		mainpage=request.getParameter("main");
}
%>
<body>
	<!-- 헤더 (로고,메뉴들까지 불러옴) -->
	<div>
		<jsp:include page="layout/header.jsp"/>
	</div>
	<!-- 메인 레이아웃 불러옴 -->
	<div class="layout main">
		<jsp:include page="<%=mainpage%>"/>
	</div>
</body>
=======
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GOING</title>
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<%
// index.jsp 시작
System.out.println("> index.jsp");

	String mainpage="layout/main.jsp";
	if(request.getParameter("main")!=null){
		mainpage=request.getParameter("main");
}
	System.out.println("sessionID: " + session.getAttribute("userSessionID"));
%>
<body>
	<!-- 헤더 (로고,메뉴들까지 불러옴) -->
	<div>
		<jsp:include page="layout/header.jsp"/>
	</div>
	<!-- 메인 레이아웃 불러옴 -->
	<div class="layout main">
		<jsp:include page="<%=mainpage %>"/>
	</div>
	<!-- 푸터 -->
	<div>
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
>>>>>>> a50d283356c25e5fd3de198e87a4dc6f81e9ef1b
</html>