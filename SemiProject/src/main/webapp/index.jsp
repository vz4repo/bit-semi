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
	System.out.println("myid: " + session.getAttribute("myid"));
	System.out.println("loginok? : " + session.getAttribute("loginok"));
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
</html>