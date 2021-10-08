<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
 th,td{
	border: 2px solid black;
}
</style>
</head>

<script type="text/javascript">


</script>
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
		<div>
	<span class="glyphicon glyphicon-road">여행지 선택</span>
</div>

<table>

	<tr>
	
		<th>
		<button><</button>
		<div class="trvelDay">날짜 설정</div>
		<button>></button>
		</th>
		
	
	</tr>
	<tr>	
		<td>
			검색
			<input type="text">
			<button>검색</button>
			
			<input value="지도불러오기">
		</td>
		<table>
		<tr>
			<th>시간
			</th>
			<th>여행지
			</th>
			<th>비고
			</th>
		</tr>
		<tr>
			<td>
			<input type="text">
			</td>
			<td>
			<input type="text">
			</td>
			<td>
			<input type="text">
			</td>
		</tr>
		<tr>
		<td colspan='3'>
				<button >추가+</button>
		</td>
		</tr>
		</table>
		<table>
		<tr>
			<th>
				공개여부
			</th>
			<td>	
				<input type="radio" checked="checked">공개
				<input type="radio" >비공개
			</td>
			</tr>
		</table>	
	</tr>

</table>

	<button type="button" style= "width:100px"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanCal.jsp'">이전
	</button>
	
	<button>취소</button>
	<button type="button" style= "width:100px"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanResult.jsp'">다음
	</button>
		
	<!--footer-->
	<footer>Copyright(c)2021 semi_project_2조 All rights reserved.</footer>
	<!--footer-->\
</body>
</html>