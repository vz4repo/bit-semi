<%@page import="java.text.SimpleDateFormat"%>
<%@page import="plan.PlanDto"%>
<%@page import="plan.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Review</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- view -->
	<div class="container">
		<!-- 상단 -->
		<div class="view_top">
			<p class="v_title">제목</p>
			<div class="v_func">
				<p>Writer&nbsp;&nbsp;작성자 아이디만 출력<span>|</span></p>
				<p>Date&nbsp;&nbsp;작성일 출력</p>
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