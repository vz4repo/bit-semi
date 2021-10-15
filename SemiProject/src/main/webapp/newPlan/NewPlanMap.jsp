<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx27cfab8a671c49dea1ee85d2351dfef7"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

var map;
var marker_s, marekr_e;

//경로그림정보
var drawInfoArr = [];


function initTmap(){
	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center: new Tmapv2.LatLng(37.56701114710962, 126.9973611831669),
		width : "100%",
		height : "400px",
		zoom : 15,
		zoomControl : true,
		scrollwheel : true
	});
	
	// 시작, 도착 심볼찍기
	// 시작
	marker_s = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.568085523663385, 126.98605733268329),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	// 도착 
	marker_e = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.56445848334345, 127.00973587385866),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.56626352138058, 126.98735015742581),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_1.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.56568310756034, 127.00221495976581),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_2.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.570369, 126.992153),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_3.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.56335290252303, 127.00352387777271),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_4.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.570721714117965, 127.00186090818215),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_5.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	marker = new Tmapv2.Marker({
		position : new Tmapv2.LatLng(37.56515390827723, 126.99066536776698),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_6.png",
		iconSize : new Tmapv2.Size(24, 38),
		map:map
	});
	
	var headers = {}; 
	headers["appKey"]="l7xx27cfab8a671c49dea1ee85d2351dfef7";
	
	$.ajax({
		type:"POST",
		headers : headers,
		url:"https://apis.openapi.sk.com/tmap/routes/routeOptimization30?version=1&format=json",//
		async:false,
		contentType: "application/json",
		data: JSON.stringify({
				  "reqCoordType": "WGS84GEO",
				  "resCoordType" : "EPSG3857",
				  "startName": "출발",
				  "startX": "126.98605733268329",
				  "startY": "37.568085523663385",
				  "startTime": "201711121314",
				  "endName": "도착",
				  "endX": "127.00973587385866",
				  "endY": "37.56445848334345",
				  "searchOption" : "0",
				  "viaPoints": [
				    {
				      "viaPointId": "test01",
				      "viaPointName": "test01",
				      "viaX": "126.98735015742581",
				      "viaY": "37.56626352138058",
				    },
				    {
				      "viaPointId": "test02",
				      "viaPointName": "test02",
				      "viaX": "127.00221495976581",
				      "viaY": "37.56568310756034",
				    },
				    {
				      "viaPointId": "test03",
				      "viaPointName": "test03",
				      "viaX": "126.992153",
				      "viaY": "37.570369",
				    },
				    {
				      "viaPointId": "test04",
				      "viaPointName": "test04",
				      "viaX": "127.00352387777271",
				      "viaY": "37.56335290252303",
				    },
				    {
				      "viaPointId": "test05",
				      "viaPointName": "test05",
				      "viaX": "127.00186090818215",
				      "viaY": "37.570721714117965",
				    },
				    {
				      "viaPointId": "test06",
				      "viaPointName": "test06",
				      "viaX": "126.99066536776698", 
				      "viaY": "37.56515390827723",
				    }
				  ]
		}),
		success:function(response){
			var resultData = response.properties;
			var resultFeatures = response.features;
			
			// 결과 출력
			var tDistance = "총 거리 : " + resultData.totalDistance + "km,  ";
			var tTime = "총 시간 : " + resultData.totalTime + "분,  ";
			var tFare = "총 요금 : " + resultData.totalFare + "원";
			
			$("#result").text(tDistance+tTime+tFare);
			
			for(var i in resultFeatures) {
				var geometry = resultFeatures[i].geometry;
				var properties = resultFeatures[i].properties;
				var polyline_;
				
				drawInfoArr = [];
				
				if(geometry.type == "LineString") {
					for(var j in geometry.coordinates){
						// 경로들의 결과값(구간)들을 포인트 객체로 변환 
						var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
						// 포인트 객체를 받아 좌표값으로 변환
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);
						// 포인트객체의 정보로 좌표값 변환 객체로 저장
						var convertChange = new Tmapv2.LatLng(convertPoint._lat, convertPoint._lng);
						
						drawInfoArr.push(convertChange);
					}
					polyline_ = new Tmapv2.Polyline({
						path : drawInfoArr,
						strokeColor : "#FF0000",
						strokeWeight: 6,
						map : map
					});
				}
			}
		},
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
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
	
	<!-- 해당 날짜에 대한 여행지, 시간 등 입력폼 -->
	<div class="container">
		<!--상단 타이틀-->
		<div class="cal_map_container">
			<p id="cal_title"><b>STEP 2</b>상세 여행 계획하기</p>
				
			<div class="cal_map_container_smallbox">
				<div class="cal_day_top">
					<button type="button" class="btn_cal_1">이전</button>
					<a href="#" id="day_check" class="travel_Day">선택 날짜 출력</a>
					<button type="button" class="btn_cal_1">다음</button>
				</div>
				
				<!-- 경유 자동차 지도 넣어봄 - 희수 -->
				<div id="map_wrap" class="map_wrap">
					<div id="map_div"></div>
				</div> 
				
				<!-- 계획폼 -->
				<table class="planinfo">
					<tr class="v_contents">
						<tr>
							<th>시간</th>
							<th>여행지</th>
							<th>비고</th>
						</tr>
						<tr name="add_plan">
							<td><input type="text" class="plan_time" value="원하는 시간을 입력해주세요."></td>
							<td>해운대</td>
							<td>
							<input type="text" class="plan_content" value="해당 일정에 대한 내용을 입력해주세요.">
							<button	name="del_plan" class="plan_del">삭제</button>
							</td>
						</tr><!-- 변경점 존재 -->
						<tr>
							<td colspan='3'>
								<button name="add_btn" class="plan_add">추가하기</button>
							</td>
						</tr>
				</table>
				
				<!-- 공개여부 -->
				<div class="cal_open_text">
					<p>해당 여행 계획을 공개하시겠습니까?</p>
					<span>만약 공개를 선택하시면 All Plan에 올라가며 모든 사람들이 확인할 수 있습니다.</span>
				</div>
				<div class="cal_open_check">
					<input type="radio" checked="checked" name="opne_check"><label>공개</label>
					<input type="radio" name="opne_check" ><label>비공개</label>
				</div>
				
				<div class="btn_all_1">
					<button type="button" class="btn_move_1" 
					onclick="location.href='index.jsp?main=newPlan/NewPlanCal.jsp'">이전</button>
					<!-- 여기선 취소 필요없을 것 같아서 주석함(희수) -->
					<!-- <button type="button" class="btn_next_1" onclick="window.location.reload()">취소</button> --><!-- 초기화 -->
					<button type="button" class="btn_next_2" 
					onclick="location.href='index.jsp?main=newPlan/NewPlanResult.jsp'">다음</button>
				</div>	
			</div>	
		</div>
	</div>
<script type="text/javascript">
//추가 버튼
$(document).on("click","button[name=add_btn]",function(){
    
    var addPlan = '<tr name="add_plan">'+
        '    <td>'+
        '        <input type="text" class="plan_time" value="원하는 시간을 입력해주세요.">'+
        '	</td>'+
        '        <td>해운대</td>'+
        '        <td>'+
        '       <input type="text" class="plan_content" value="해당 일정에 대한 내용을 입력해주세요.">'+
        '	<button	name="del_plan" class="plan_del">삭제</button>'+
        '    </td>'+
        '</tr>';
        
    var trHtml = $("tr[name=add_plan]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
    
    trHtml.after(addPlan); //마지막 trStaff명 뒤에 붙인다.
    
});

/* 위에랑 중복? 되는 것 같아서 잠시 주석(희수) */
/* $(document).on("click","button[name=add_btn]",function(){
    
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
    
}); */


$(document).on("click","button[name=del_plan]",function(){
    
    var trHtml = $(this).parent().parent();
    
    trHtml.remove(); //tr 테그 삭제
    
});
</script>
</body>
</html>