<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
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
		<div> 최종 계획 확인</div>
		<table class="planinfo">
	<td>
		<img alt="	" src="../arrowimage/left_arrow.png" width="50px" height="50px"
		style="float: left; margin-left: 5px;">	
		</td>
		<td>
		<div class="travel_Day" style="margin-top: 10px;">날짜 설정</div>
		</td>
		<td>
		<img alt="" src="../arrowimage/right_arrow.png" width="50px" height="50px"
		style="float: right;  margin-right: 5px;">	
		</td>
		

</table>
<div>
	<img alt="" src="../image/1.jpg">
</div>
<table class="planinfo">
	<tr>
		<th>시간
		</th>
		<th>여행지
		</th>
		<th>비고
		</th>
	</tr>
	<tr>
		<td>"여행할 시간!"
		</td>
		<td>"여행할 장소!"
		</td>
		<td>"설명!"
		</td>
		
	</tr>
	<tr>
		<th>
			공개여부
		</th>
		<td colspan="2">
			공개
		</td>
	</tr>
</table>
<button type="button" style= "width:100px;height: 40px;margin-top: 10px;"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanMap.jsp'">이전
	</button>
<button type="button" style= "width:100px;height: 40px;margin-top: 10px;"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanCal.jsp'">취소</button><!-- 초기화 -->
<button type="button" style= "width:100px;height: 40px;margin-top: 10px;">최종 완료
</button>
		
	<!--footer-->
	<footer>Copyright(c)2021 semi_project_2조 All rights reserved.</footer>
	<!--footer-->
	<script type="text/javascript">
	
	
	</script>
</body>
</html>