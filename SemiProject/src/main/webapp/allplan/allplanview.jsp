<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=l7xx27cfab8a671c49dea1ee85d2351dfef7"></script>
<script type="text/javascript">
	function initTmap(){
		var map = new Tmap.Map({
			div:'map_div',
			width : "1200px",
			height : "300px",
		});
		map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
	} 
	
	$(function(){
		$("#com_box").click(function(){
			$(this).text("");
		});
		$("#com_box").mouseout(function(){
			$(this).text("댓글을 입력해주세요.");
		});
	});
</script>
</head>
<%
	String root=request.getContextPath();
%>
<body onload="initTmap()">
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>All Plan</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- view -->
	<div class="container">
		<!-- 상단 -->
		<div class="view_top">
			<p class="v_title">고잉 웹사이트 오픈!</p>
			<p class="v_day">2021.10.07~2021.10.10</p>
			<div class="v_func">
				<p>홍길동<button type="button">팔로우</button>|</p>
				<p>136 Views</p>
			</div>
		</div>
		<!-- 상단 -->
		
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<div id="map_div"></div>
			<table class="planinfo">
				<tr>
					<th>시간</th>
					<th>여행지</th>
					<th>비고</th>
				</tr>
				<tr>
					<td>10:00~12:00</td>
					<td>해운대</td>
					<td>부산역에 도착하자마자<br>간단하게 브런치 사들고 바다보면서 먹기!</td>
				</tr>
				<tr>
					<td>12:00~14:00</td>
					<td>본전 돼지국밥 / 스타벅스</td>
					<td>돼지국밥 점심으로 먹고 스벅가서 커피 마시기</td>
				</tr>
			</table>
		</div>
		<!-- 컨텐츠 -->	
		
		<!-- 별점, 목록 버튼 -->
		<div class="btn">
			<div class="v_btn">
				<a href="#" class="btnstar">별점주기</a>
			</div>
			<div class="v_btn">
				<a href="#" class="btnlist">목록</a>
			</div>
		</div>
		<!-- 별점, 목록 버튼 -->
		
		<!-- 댓글폼 -->
		<div class="v_comment">
			<table class="com_all">
				<tr>
					<td>
						<textarea id="com_box" name="content" required="required">댓글을 입력해주세요.</textarea>
					</td>
					<td>
						<button type="submit" id="com_check">확인</button>
					</td>
				</tr>
			</table>
		</div>
		<!-- 댓글폼 -->
		
		<!-- 댓글 리스트 -->
		<div class="v_comment_list">
			<ul class="com_list_all">
				<li>
					<span class="list_1">
						<p>홍길동</p>
						<p>저도 이 여행 계획을 참고해봐야겠어요!</p>
					</span>
				</li>
				<li>
					<span class="list_1">
						<p>홍길동</p>
						<p>저도 이 여행 계획을 참고해봐야겠어요!</p>
					</span>
				</li>
			</ul>
		</div>
		<!-- 댓글 리스트 -->
		
	</div>
	<!--view -->
</body>
</html>