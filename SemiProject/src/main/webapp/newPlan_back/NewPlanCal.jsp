<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GOING</title>
</head>
<%
	String root=request.getContextPath();
%>
<body>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>New Plan</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- 제목, 일정 입력폼 -->
	<div class="container">
		<!-- 상단 타이틀 -->
		<div class="cal_container">
			<p id="cal_title"><b>STEP 1</b>여행일정 선택하기</p>
			
			<div class="cal_name">
				<input type="text" class="content_title" placeholder="여행 계획 제목을 입력해주세요.">
			</div>
				
			<!-- 가는날, 오는날 텍스트는 calendar.html에 입력후 air-datepicker.css로 줌(희수) -->
			
			<div class="cal_alldays">
				<iframe src="feat_calendar/calendar.html" style="width:1200px; height:400px; border:none;"></iframe>
			</div>
		</div>
		
		<!-- 다음 버튼 -->
		<button type="button" class="btn_next_1" onclick="location.href='index.jsp?main=newPlan/NewPlanMap.jsp'">다음</button>
		<!-- 다음 버튼 -->
	</div>
</body>
</html>