<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th,td{
		border: 1px solid black;
	}
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
<div>
	<img alt="" src="../image/1.jpg">
</div>
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
		<td>"여행할 시간!"
		</td>
		<td>"여행할 장소!"
		</td>
		<td>"설명!"
		</td>
		
	</tr>
</table>
<table>
	<tr>
		<th>
			공개여부
		</th>
		<td>
			공개
		</td>
	</tr>

</table>
<button type="button" style= "width:100px"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanMap.jsp'">이전
	</button>
<button>취소
</button>
<button>최종 완료
</button>
		
	<!--footer-->
	<footer>Copyright(c)2021 semi_project_2조 All rights reserved.</footer>
	<!--footer-->\
</body>
</html>