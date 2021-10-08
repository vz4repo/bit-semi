<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>새로운 여행 계획을 설계해보자!</title>
</head>
<%
	String root=request.getContextPath();
%>
<body>
	<!--main-->
	<div id="main_wrap">
		<div id="main_text">
			<p>여러분들이 떠나고 싶은</p>
			<p>여행지로 계획 세워서 떠나세요!</p>
		</div>
	</div>
	<!--main-->
	
	<!--content_1-->
	<div id="content_1" class="margin_wrap">
		<h2 id="title_1">New PLAN</h2>
		<p id="title_2">당신만의 여행계획을 세워보세요</p>
		<p>여행일정 선택</p>
		<div>글제목
			<input type="text">
		</div>
		<ul class="clearfix">
			<li>
				<a href="#">
					<span class="con_1_box">
						<h3>여행시작!</h3>
						<jsp:include page="calenderStart.jsp"></jsp:include>
					</span>
				</a>
			</li>

			<li>
				<a href="#">
					<span class="con_1_box">
						<h3>여행종료!</h3>
						<jsp:include page="calenderEnd.jsp"></jsp:include>
					</span>
				</a>
			</li>
		</ul>
	</div>
	<!--content_1-->
	<!-- button -->
	<button type="button" style= "width:100px"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanMap.jsp'">다음
	</button>
	<!--footer-->
	<footer>Copyright(c)2021 semi_project_2조 All rights reserved.</footer>
	<!--footer-->\
</body>
</html>