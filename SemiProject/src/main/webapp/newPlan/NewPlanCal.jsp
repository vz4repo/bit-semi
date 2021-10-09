<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>새로운 여행 계획을 설계해보자!</title>
<style type="text/css">
.cal_Plan_box{
	display:block;
	margin-top:30px;
	float:left;
	margin-left:200px;
	width:1000px;
	height:400px;
	box-shadow:2px 2px 13px 3px rgba(0,0,0,0.2);
	padding:10px 25px 25px 25px;
	text-align:center;
}

#cal_title{
	margin-left:550px;
}
img:hover {
 	cursor: pointer;
 }
 
 	#map_div{margin:80px 0px 100px 0px;}
	.planinfo{border:1px solid black; border-collapse:collapse; width:1200px; margin-top:50px;}
	.planinfo th{border:1px solid white; background-color:black; color:white; height:35px; 
			 font-weight:400; font-size:17px; padding:5px}	  
	.planinfo th:nth-child(1){width:200px;}
	.planinfo th:nth-child(2){width:150px;}
	.planinfo th:nth-child(3){width:400px;}
	.planinfo td{border:1px solid black; border-collapse:collapse;
			 text-align:center; font-size:15px; padding:10px}
	container{width:1200px; margin: 0 auto;}
</style>
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
		<h3 id="cal_title">여행일정 선택</h3>
		<div style="margin-left: 350px;font-size: 1.4em;">제목&nbsp;&nbsp;&nbsp;
			<input type="text" class="content_title" style="width: 500px;opacity: 0.5;"
			 value="당신의 여행계획은?">
		</div>
		<ul class="clearfix">
			<li>
					<span class="cal_Plan_box" >
						<h3>여행시작!</h3>
						<iframe src="../feat_calendar/calendar.html" style="width: 900px;height: 330px;"></iframe>
					</span>
				
			</li>
		</ul>
	</div>
	<!--content_1-->
	<!-- button -->
	<button type="button" style= "width:80px;height: 50px;margin-left: 630px;   border: none;
    outline:none;"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanMap.jsp'">다음
	</button>
	<!--footer-->
	<footer>Copyright(c)2021 semi_project_2조 All rights reserved.</footer>
	<!--footer-->
</body>
</html>