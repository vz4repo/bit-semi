<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String root=request.getContextPath();
%>
	<!--main-->
	<div id="main_wrap">
		<%-- <div id="main_img">
			<img alt="" src="<%=root%>/image/main.jpg">
		</div> --%>
		<div id="main_text">
			<p>여러분들이 떠나고 싶은</p>
			<p>여행지로 계획 세워서 떠나세요!</p>
			<button type="button">START</button>
		</div>
	</div>
	<!--main-->
	
	<div class="container">
		<!--content_1-->
		<div id="content_1" class="margin_wrap">
			<h2 id="title_1">BEST PLAN</h2>
			<p id="title_2">인기 많은 여행 계획을 참고해보세요!</p>
			<ul class="clearfix">
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3>부산여행</h3>
							<p>기간:2021-03-10~2021-03-12</p>
							<p>홍길동</p>
						</span>
					</a>
				</li>
	
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3>제주여행</h3>
							<p>기간:2021-03-10~2021-03-12</p>
							<p>홍길동</p>
						</span>
					</a>
				</li>
	
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3>시원한 바다여행</h3>
							<p>기간:2021-03-10~2021-03-12</p>
							<p>홍길동</p>
						</span>
					</a>
				</li>
	
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3>을왕리 코스</h3>
							<p>기간:2021-03-10~2021-03-12</p>
							<p>홍길동</p>
						</span>
					</a>
				</li>
					
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3>파주탐방</h3>
							<p>기간:2021-03-10~2021-03-12</p>
							<p>홍길동</p>
						</span>
					</a>
				</li>
					
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3>속초 맛집 여행</h3>
							<p>기간:2021-03-10~2021-03-12</p>
							<p>홍길동</p>
						</span>
					</a>
				</li>
			</ul>
		</div>
		<!--content_1-->
	</div>
	
	<!--content_2-->
	<div id="content_2" class="margin_wrap">
		<div id="main_sub_text">
			<p>TRAVLE</p>
		</div>
	</div>
	<!--content_2-->
		
	<div class="container">	
		<!--content_3-->
		<div id="content_3">
			<h2 id="title_3">BEST REVIEW</h2>
			<p id="title_4">인기 많은 리뷰를 구경해보세요!</p>
			<ul class="clearfix">
				<li>
					<a href="#">
						<img src="<%=root%>/image/1.jpg" alt="" />
						<span class="con_3_box">
							<h3>저는 부산을 처음 가보는데 많은...</h3>
							<p>작성자:홍길동</p>
						</span>
					</a>
				</li>
	
				<li>
					<a href="#">
						<img src="<%=root%>/image/1.jpg" alt="" />
						<span class="con_3_box">
							<h3>이번 기회에 새로운 곳을 가보고...</h3>
							<p>작성자:홍길동</p>
						</span>
					</a>
				</li>
	
				<li>
					<a href="#">
						<img src="<%=root%>/image/1.jpg" alt="" />
						<span class="con_3_box">
							<h3>너무 좋았어용</h3>
							<p>작성자:홍길동</p>
						</span>
					</a>
				</li>
	
				<li>
					<a href="#">
						<img src="<%=root%>/image/1.jpg" alt="" />
						<span class="con_3_box">
							<h3>색다른 여행 경험</h3>
							<p>작성자:홍길동</p>
						</span>
					</a>
				</li>
			</ul>		
		</div> 
		<!--content_3-->
	</div>
