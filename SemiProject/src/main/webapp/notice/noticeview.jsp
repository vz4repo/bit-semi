<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<%
String userID=	(String)session.getAttribute("userSessionID");

DateFormat date = DateFormat.getDateInstance(DateFormat.LONG);
String currentDate = date.format(new Date());
%>

<body>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Notice</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- view -->
	
	<div class="container">
		<!-- 상단 -->
		<div class="view_top">
			<p class="v_title">제목</p>
			<div class="v_func">
				<p>Writer<span>:<%=userID%>:</span>&nbsp;&nbsp;작성자 아이디만 출력<span>|</span></p>
				<p>Date<span>:<%=currentDate%>:</span>&nbsp;&nbsp;작성일 출력</p>
			</div>
			<div class="v_func_2">
				<p>View</p>
				<p>10</p>
			</div>
		</div>
		<!-- 상단 -->
		
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<p>내용출력</p>
		</div>
		<!-- 컨텐츠 -->	
		
		<!-- 목록 버튼 -->
		<div class="btn">
			<div class="v_btn">
				<a href="#" class="btnlist">목록</a>
			</div>
		</div>
		<!-- 목록 버튼 -->
	</div>
	<!--view -->
</body>
</html>