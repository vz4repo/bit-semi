<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>GOING</title>
<script type="text/javascript">

	/* 팝업 띄우기 위한 script (날짜 선택 팝업!) */
	function showPopup(hasFilter) {
		const popup = document.querySelector('#popup');
		if (hasFilter) {
		  popup.classList.add('has-filter');
		 } else {
		  popup.classList.remove('has-filter');
		 }
		 popup.classList.remove('hide');
		}
	function closePopup() {
		const popup = document.querySelector('#popup');
		popup.classList.add('hide');
		}
	
	/* 팝업 띄우기 위한 script (여행 계획 입력하는 팝업!) */	
	function showPopup2(hasFilter) {
		const popup = document.querySelector('#popup2');
		if (hasFilter) {
		 popup.classList.add('has-filter');
		} else {
		 popup.classList.remove('has-filter');
		}
		 popup.classList.remove('hide');
		}
	function closePopup2() {
		const popup = document.querySelector('#popup2');
		popup.classList.add('hide');
		}
</script>
</head>
<%
	String root=request.getContextPath();
%>
<body onload="initTmap();">
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
			<p id="cal_title">여행일정을 계획해보세요!</p>
			<form method="post" class="form-inline" name="planForm">
								
			<div class="cal_title_text">
				<div class="cal_date_open_title">
					<p>여행 제목을 입력해주세요!</p>
				</div>
				<div class="cal_date_open_title">
				<input type="text" name="plantitle" class="content_title"
					 placeholder="여행 계획 제목을 입력해주세요."
					 onkeyup="eventKeyup(this.value)">
				</div>
			</div>
			
			<div class="cal_date_open">
				<div class="cal_date_open_title">
					<p>여행 일정을 선택해주세요!</p>
				</div>
				<div class="cal_date_open_title">
					<button type="button" class="btn_data_open_pop" id="modal_btn" onclick="showPopup(false)"
					name="planStartDay">
						YYYY/MM/DD~YYYY/MM/DD
				
					</button>
				</div>
			</div>
			
			<div id="popup" class="hide">
				<div class="content">
					<p class="cal_popup_1_title">여행일자 선택</p>
					<div class="cal_popup_1">
						<iframe src="feat_calendar/calendar.html" style="width:1200px; height:400px; border:none;"></iframe>
					</div>
					<input type="hidden" id="plan_StartDay" name="planStartDay">
					<input type="hidden" id="plan_EndDay" name="planEndDay">
								
					<div class="cal_popup_1">
						<button type="button" id="btn_submit_1" onclick="closePopup()">확인</button>
						<button onclick="closePopup()" type="button" class="btn_close_1">닫기</button>
					</div>
				</div>
			</div>
			<div class="cal_open_text">
					<p>해당 여행 계획을 공개하시겠습니까?</p>
					<span>만약 공개를 선택하시면 All Plan에 올라가며 모든 사람들이 확인할 수 있습니다.</span>
				</div>
				<div class="cal_open_check">
					<input type="radio" checked="checked" name="open_Plan" value="true" checked="checked"><label>공개</label>
					<input type="radio" name="open_Plan" value="false"><label>비공개</label>
				</div>
				
			</form>
			<div class="newplan_step_1">
				<table class="newplan_info">
					<tr>
						<th>No</th>
						<th>일자</th>
						<th>상세 계획 짜기</th>
					</tr>
					<tr name="add_plan" class="add_plan"> 
						<td>1</td>
						<td id="daysCall_1">날짜</td><!--onclick="showPopup2(false)"  -->
						<td><button type="button" class="btn_travel_1" onclick="showPopup2(false)">계획짜기</button></td>
					</tr>
				 	
				 
				</table>
			</div>
			
				
			<!-- 팝업 1번 -->
			<div id="popup2" class="hide">
				<div class="content" id="plan_detail_popup">
					<div class="cal_popup_1_big_text">
						<p class="cal_popup_1_title">상세 계획 짜기</p>
					</div>
					
					<!-- 경유 자동차 지도 넣어봄 - 희수 (갑자기 안나옴 ㅠㅠ)-->
					<div id="map_wrap" class="map_wrap">
						<div id="map_div"></div>
					</div> 
					
					
						
					<div class="cal_popup_1">
						<table class="planinfo">
							<tr class="v_contents">
								<th>시간</th>
								<th>여행지</th>
								<th>비고</th>
							</tr>	
							<form method="post" class="form-inline">
							
							<tr class="A_plan">
								<input type="hidden" class="hd_title">
								<input type="hidden" class="hd_day">
								
								<td><input type="text" class="plan_time" value="원하는 시간을 입력해주세요."></td>
								<td><input type="text" class="plan_map" value="원하는 장소를 입력해주세요"></td>
								<td>
								<input type="text" class="plan_content" value="해당 일정에 대한 내용을 입력해주세요.">
								<button type="button" class="btn_submit_2">확인</button>
						
							</td>
							</tr><!-- 변경점 존재 -->
							
							
							<tr class="A_plan_2">
								<input type="hidden" class="hd_title">
								<input type="hidden" class="hd_day">
								
								<td><input type="text" class="plan_time_2" value="원하는 시간을 입력해주세요."></td>
								<td><input type="text" class="plan_map_2" value="원하는 장소를 입력해주세요"></td>
								<td>
								<input type="text" class="plan_content_2" value="해당 일정에 대한 내용을 입력해주세요.">
								<button type="button" class="btn_submit_3">확인</button>
						
							</td>
							</tr><!-- 변경점 존재 -->
							
							<tr class="A_plan_3">
								<input type="hidden" class="hd_title">
								<input type="hidden" class="hd_day">
								
								<td><input type="text" class="plan_time_3" value="원하는 시간을 입력해주세요."></td>
								<td><input type="text" class="plan_map_3" value="원하는 장소를 입력해주세요"></td>
								<td>
								<input type="text" class="plan_content_3" value="해당 일정에 대한 내용을 입력해주세요.">
								<button type="button" class="btn_submit_4">확인</button>
						
							</td>
							</tr><!-- 변경점 존재 -->
							</form>
						</table>
					</div>
					<div class="cal_popup_1">
						<button  type="button" onclick="closePopup2()" class="btn_close_2">닫기</button>
					</div>
				</div>
			</div>
			<!-- 공개여부 -->
				<!-- 확인 버튼 -->
				<div class="btn_newplan_1">
					<button type="submit" class="btn_finish_1" 
					onclick="location.href='index.jsp?main=newPlan/NewPlanCal.jsp'">계획짜기 완료</button>
				</div>	
		</div>
	</div>
	<script type="text/javascript">

	function eventKeyup(str){
		$(".hd_title").val(str); 
	}
	
	$(function() {
		$("#btn_submit_1").click(function() {
			var StartDay = localStorage.getItem('startDay');
			var planEnd = localStorage.getItem('endDay');
			
			
			
			var tDate = new Date(StartDay);
			var endDate = new Date(planEnd);
		
			
			
			var mon1 = tDate.getMonth()+1;
			var day1 = tDate.getDate();
			var days1 = mon1+"월"+day1+"일";
			
			var cal1 = $("#daysCall_1").html(days1);
			$("#daysCall_1").attr("value",days1);
			$("input[name='planday']").attr("value",days1)
			localStorage.setItem("cal1", cal1);
			
			var dateDiff = Math.ceil((endDate.getTime()-tDate.getTime())/(1000*3600*24));
			var daylen = new Array();
			for(var i = 0; i<dateDiff;i++){
				daylen[i] = tDate.getDate()+i+2;
				
			}
			var days2 = new Array();
			
			for(var a = 0; a< dateDiff;a++ ){
			tDate.setDate(daylen[a]);
			
			var mon2 = tDate.getMonth()+1;
			var day2 = tDate.getDate();
			
			days2[a] = mon2+"월"+day2+"일";
			}
			var addPlan='';
			for(var li = 0;li < dateDiff;li++){
				console.log(days2[li]);
				addPlan  += '<tr>'+
			     	   '    <td>'+(li+2)+
			     	   '	</td>'+
			     	   '    <td class="daysCall_2">'+days2[li]+'</td>'+
			     	   '    <td>'+
			     	   '	<button type="button" class="btn_travel_1" onclick="showPopup2(false)">계획짜기</button>'+
			     	   '    </td>'+
			      	   '	</tr>';
			        	
			  	
			}
			
			 $(".add_plan").after(addPlan);
			var emon = endDate.getMonth()+1;
			var eday = endDate.getDate();

			var enday = emon+"월"+eday+"일";
			$("#modal_btn").html(days1+"~"+enday);

			$("input[name=planStartDay]").attr("value",days1);
			$("input[name=planEndDay]").attr("value",enday);
			
			var plantitle=$(".content_title").val();
			var planStartDay=days1;
			var planEndDay=enday;
			
		    var openPlan = $("input[name='open_Plan']:checked").val();
			
			$.ajax({
				type: "get",
				dataType: "html",
				url:"newPlan/NewPlanCalinsert.jsp",
				data:{"plantitle":plantitle,"planStartDay":planStartDay,"planEndDay":planEndDay,"openPlan":openPlan},
				success: function(data) {
					
					alert("저장되었습니다");
				}
			});
		});
		
		$(".btn_close_2").click(function() {
			$(".plan_time").val("원하는 시간을 입력해주세요.");
			$(".plan_map").val("원하는 장소를 입력해주세요.");
			$(".plan_content").val("해당 일정에 대한 내용을 입력해주세요.");

			$(".btn_submit_2").attr("disabled", false);
			$(".plan_time_2").val("원하는 시간을 입력해주세요.");
			$(".plan_map_2").val("원하는 장소를 입력해주세요.");
			$(".plan_content_2").val("해당 일정에 대한 내용을 입력해주세요.");

			$(".btn_submit_3").attr("disabled", false);
			$(".plan_time_3").val("원하는 시간을 입력해주세요.");
			$(".plan_map_3").val("원하는 장소를 입력해주세요.");
			$(".plan_content_3").val("해당 일정에 대한 내용을 입력해주세요.");

			$(".btn_submit_4").attr("disabled", false);
		});
		
		
		$(".btn_submit_2").click(function() {
			
			var plantitle=$(".hd_title").val();
			var planDate=$("#daysCall_1").attr("value");
			var time1=$(".plan_time").val();
			var content1=$(".plan_content").val();
			var map1=$(".plan_map").val();
			
			
			$.ajax({
				type: "get",
				dataType: "html",
				url:"newPlan/NewPlanMapinsert.jsp",
				data:{"plantitle":plantitle,"planDate":planDate,"time":time1,"content":content1,"map":map1},
				success: function(data) {
					alert("완료 저장되었습니다");
					
				}
			});
			$(".btn_submit_2").attr("disabled", true);
			
		});
		
		$(".btn_submit_3").click(function() {
			
			var plantitle=$(".hd_title").val();
			var planDate=$("#daysCall_1").attr("value");
			var time1=$(".plan_time_2").val();
			var content1=$(".plan_content_2").val();
			var map1=$(".plan_map_2").val();
			
			
			$.ajax({
				type: "get",
				dataType: "html",
				url:"newPlan/NewPlanMapinsert.jsp",
				data:{"plantitle":plantitle,"planDate":planDate,"time":time1,"content":content1,"map":map1},
				success: function(data) {
					alert("완료 저장되었습니다");
					
				}
			});
			$(".btn_submit_3").attr("disabled", true);
			
		});
		
	$(".btn_submit_4").click(function() {
	
	var plantitle=$(".hd_title").val();
	var planDate=$("#daysCall_1").attr("value");
	var time1=$(".plan_time_3").val();
	var content1=$(".plan_content_3").val();
	var map1=$(".plan_map_3").val();
	
	
	$.ajax({
		type: "get",
		dataType: "html",
		url:"newPlan/NewPlanMapinsert.jsp",
		data:{"plantitle":plantitle,"planDate":planDate,"time":time1,"content":content1,"map":map1},
		success: function(data) {
			alert("완료 저장되었습니다");
		}
	});
	$(".btn_submit_4").attr("disabled", true);
});
	});

	</script>
</body>
</html>