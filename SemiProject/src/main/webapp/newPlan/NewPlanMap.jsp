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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
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


<body>
	<!--main-->
	
	<div id="main_wrap">
		<div id="main_text">
			<p>여러분들이 떠나고 싶은</p>
			<p>여행지로 계획 세워서 떠나세요!</p>
		</div>
	</div>
	<!--main-->
	<div class="container">
	<!--content_1-->
	<div id="content_1" class="margin_wrap">
		<h2 id="title_1">New PLAN</h2>
		<p id="title_2">당신만의 여행계획을 세워보세요</p>
	</div>
	<div>
	<span class="glyphicon glyphicon-road" style="font-size: 1.4em; margin-left: 200px;">여행지 선택</span>
	</div>


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


<table class="planinfo">
	
	
		
	
	<tr>	
		<td colspan="3">
			
			<input type="text" style="margin-left: 10px; width: 400px;">
			<button type="button" style="background-color: white;">지도 검색</button>
			<br>
			<input value="지도불러기" style="margin-left: 10px;margin-top: 10px;width: 450px;">
		</td>
		
		<tr class="v_contents">
			<div id="map_div"></div>
			
				<tr>
					<th>시간</th>
					<th>여행지</th>
					<th>비고</th>
				</tr>
				<tr name="add_plan">
					<td>
					<input type="text" class="plan_time">
					</td>
					<td>해운대</td>
					<td>
					<input type="text" class="plan_content">
					<button	name="del_plan">삭제</button>
					</td>
					
				</tr>
		</tr><!-- 변경점 존재 -->
		<tr>
			<td colspan='3'>
				<button style="background-color: white;margin-top: 10px;width: 450px;
				margin-left: 10px;" name="add_btn">추가+</button>
			</td>
		</tr>
		
		<tr style="margin-top: 10px;margin-left: 10px;">
			<th>
				공개여부
			</th>
			<td colspan="2">	
				<input type="radio" checked="checked" name="opne_check">공개
				<input type="radio" name="opne_check" >비공개
			</td>
		</tr>
			
	</tr>
</table>
<div style="margin-left: 500px">
	
	<button type="button" style= "width:100px;height: 40px;margin-top: 10px;"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanCal.jsp'">이전
	</button>
	
	<button type="button" style= "width:100px;height: 40px;margin-top: 10px;"
	onclick="window.location.reload()">취소</button><!-- 초기화 -->
	<button type="button" style= "width:100px;height: 40px;margin-top: 10px;"
	onclick="location.href='NewPlanMain.jsp?NewPlanmain=NewPlanResult.jsp'">다음
	</button>
	
</div>	
</div>	
	<!--footer-->
	<footer>Copyright(c)2021 semi_project_2조 All rights reserved.</footer>
	<!--footer-->
<script type="text/javascript">
//추가 버튼
$(document).on("click","button[name=add_btn]",function(){
    
    var addPlan = '<tr name="add_plan">'+
        '    <td>'+
        '        <input type="text" class="plan_time">'+
        '	</td>'+
        '        <td>해운대</td>'+
        '        <td>'+
        '       <input type="text" class="plan_content">'+
        '	<button	name="del_plan">삭제</button>'+
        '    </td>'+
        '</tr>';
        
    var trHtml = $("tr[name=add_plan]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
    
    trHtml.after(addPlan); //마지막 trStaff명 뒤에 붙인다.
    
});

$(document).on("click","button[name=add_btn]",function(){
    
    var addPlan = '<tr name="add_plan">'+
        '    <td>'+
        '        <input type="text" class="plan_time">'+
        '	</td>'+
        '        <td>해운대</td>'+
        '        <td>'+
        '       <input type="text" class="plan_content">'+
        '	<button	name="del_plan">삭제</button>'+
        '    </td>'+
        '</tr>';
        
    var trHtml = $("tr[name=add_plan]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
    
    trHtml.after(addPlan); //마지막 trStaff명 뒤에 붙인다.
    
});


$(document).on("click","button[name=del_plan]",function(){
    
    var trHtml = $(this).parent().parent();
    
    trHtml.remove(); //tr 테그 삭제
    
});

</script>
</body>

</html>