<%@page import="java.util.List"%>
<%@page import="comment.commentDTO"%>
<%@page import="comment.commentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="plan.PlanDto"%>
<%@page import="plan.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=l7xx27cfab8a671c49dea1ee85d2351dfef7"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%
	//로그인한 상태인지 확인
	String loginok= session.getAttribute("loginok").toString();
%>
<script type="text/javascript">
	/* 맵 임시! */
	function initTmap(){
		var map = new Tmap.Map({
			div:'map_div',
			width : "1200px",
			height : "300px",
		});
		map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 15);
	} 
	
	/* 팝업 띄우기 위한 script (날짜 선택 팝업!) */
	function showPopup(hasFilter) {
		const popup = document.querySelector('#popup_update');
		if (hasFilter) {
		  popup.classList.add('has-filter');
		 } else {
		  popup.classList.remove('has-filter');
		 }
		 popup.classList.remove('hide');
		}
	function closePopup() {
		const popup = document.querySelector('#popup_update');
		popup.classList.add('hide');
		}
	
	//댓글 출력하는 함수
	function list()
	{
		//console.log(1);
		var num=$("#num").val();
		var myid=$("#myid").val();
		$.ajax({
			type:"get",
			dataType:"xml",
			url:"allplan/commentxml.jsp",
			data:{"num":num},
			success:function(data){
				
				var su=$(data).find("answer").length;
				$("b.su").text(su);
				console.log(2);
				var s="";
				s+="<ul class='com_list_all'>";
				$(data).find("answer").each(function(i, element) {
					var n=$(this);
					var idx=n.attr("idx");
					var userid=n.find("userid").text();
					var contents=n.find("contents").text();
					var writeday=n.find("writeday").text();

					s+="<li class='v_comment_1'>";
					s+="<span class='com_list_1'>";
					s+="<p class='com_list_1_name'>"+userid+"</p>";
					s+="<p class='com_list_1_contents'>"+contents+"</p>";
					s+="<p class='com_list_1_day'>"+writeday+"</p>";
					
					<%-- var login="<%=loginok%>";
					console.log(login);
					if(login!="null"){
						s+="<button type='button' id='v_com_btn_1'>댓글</button>";
					} --%>
					
					var login="<%=loginok%>";
					var logid=$("#myid").val();
					console.log("1"+login+","+myid);
					if(login=="true" && logid==myid){
						s+="<button type='button' class='aup' id='v_com_btn_1' onclick='showPopup(false)'>수정</button>";
						s+="<button type='button' class='adel' id='v_com_btn_1' idx='"+idx+"'>삭제</button>";
					} 
					s+="</span>";
					s+="</li>";
					/* s+="<li class='update_commtent_form_all'>";
					s+="<table class='com_all'>";
					s+="<tr>";
					s+="<td>";
					s+="<textarea id='com_box_2' class='update_comment_form' name='content' required='required' placeholder='수정할 댓글을 입력해주세요.'></textarea>";
					s+="<button type='submit' id='v_com_check_2' class='update_comment_form'>확인</button>";
					s+="</td>";
					s+="</tr>";
					s+="</table>";
					s+="</li>"; */
					s+="</div>";
				});
				s+="</ul>";
				console.log("s="+s);
				$(".v_comment_list").html(s);	
				console.log(s);
			}
		});	
	}
	
	$(function(){
		/* $("li.update_commtent_form_all").hide(); */ //수정폼 전부 숨기기!
		list(); //처음부터 댓글 리스트 출력!!
		
		//댓글추가 이벤트
		$("#v_com_check").click(function(){
			//console.log("call");
			var num=$("#num").val();
			var myid=$("#myid").val();
			var acontent=$("#com_box").val();
			if(acontent.length==0){
				alert("댓글내용을 입력후 확인을 눌러주세요");
				return;
			}
			
			$.ajax({
				type:"post",
				dataType:"html",
				url:"allplan/commentaction.jsp",
				data:{"num":num,"myid":myid,"content":acontent},
				success:function(d){
					alert("댓글이 등록되었습니다!");
					//목록 다시 출력
					list();
					//입력값 지우기
					$("#com_box").val("");
				}
			});
		});
		
		//추천을 클릭했을 때의 이벤트
		$("span.v_likes").click(function(){
			var num=$(this).attr("num");
			var tag=$(this);
			//console.log(num); //확인됨
			$.ajax({
				type:"get",
				dataType:"json",
				url:"guest/ajaxlikechu.jsp",
				data:{"num":num},
				success:function(data){
					tag.next().text(data.chu);
					tag.next().next().animate({"font-size":"30px"},1000,function(){
						//애니메이션이 끝난 후 다시 글꼴 크기를 0px로 변경
						$(this).css("font-size","0px");
					});
				}
			});
		});
		
		/* 댓글 폼 안에 이벤트! */
		$("#com_box").click(function(){
			$(this).text("");
		});
		$("#com_box").mouseout(function(){
			$(this).text("댓글을 입력해주세요.");
		});
		
		/* 댓글 삭제 버튼 클릭시 이벤트! */
		$(document).on("click", ".adel", function(){
			var idx=$(this).attr("idx");
			console.log(idx); //삭제 아이콘 클릭하면 번호 나오는지 확인 완료!
			$.ajax({
				type:"get",
				dataType:"html",
				url:"allplan/comment_delaction.jsp",
				data:{"idx":idx},
				success:function(){
					alert("댓글이 삭제되었습니다!");
					//새로고침
					location.reload();
				}
			});
		});
		
		$("#com_box").click(function(){
			$(this).text("");
		});
		
		/* 댓글 팝업 수정 버튼 클릭시 이벤트! */
		$(document).on("click", ".btn_submit_1", function(){
			var idx=$(".aup").attr("idx");
			console.log(idx); //삭제 아이콘 클릭하면 번호 나오는지 확인 완료!
			$.ajax({
				type:"get",
				dataType:"html",
				url:"allplan/comment_update.jsp",
				data:{"idx":idx},
				success:function(){
					alert("댓글이 수정되었습니다!");
					//새로고침
					location.reload();
				}
			});
		});
	});
</script>
</head>
<%
	String root=request.getContextPath();
	
	/* 게시글 출력 관련! */
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
		currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 외에는 null rkqt
	String key=request.getParameter("key");
	PlanDao dao=new PlanDao();
	//목록에서 올 경우에만 조회수 1증가함
	if(key!=null)
		dao.updateReadcount(num);
	//num에 해당하는 dto 얻기
	PlanDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	/* ------------------------------------------------- */
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
			<p class="v_title"><%=dto.getPlantitle()%></p>
			<p class="v_day"><%=dto.getPlanDate()%></p>
			<div class="v_func">
				<p>Writer&nbsp;&nbsp;<%=dto.getUserId()%><span>|</span></p>
				<p>Date&nbsp;&nbsp;<%=sdf.format(dto.getWriteday())%></p>
				<!-- 아래 찜하기 버튼 임시 보류 -->
				<!-- <span class="v_likes">찜하기</span> -->
			</div>
			<div class="v_func_2">
				<p>View</p>
				<p><%=dto.getReadCNT()%></p>
			</div>
		</div>
		<!-- 상단 -->
		
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<div id="map_div"></div>
			<table class="planinfo">
				<tr>
					<th>일자</th>
					<th>시간</th>
					<th>여행지</th>
					<th>비고</th>
				</tr>
				<tr>
					<td>2021.10.09</td>
					<td>10:00~12:00</td>
					<td>해운대</td>
					<td>부산역에 도착하자마자<br>간단하게 브런치 사들고 바다보면서 먹기!</td>
				</tr>
				<tr>
					<td>2021.10.09</td>
					<td>12:00~14:00</td>
					<td>본전 돼지국밥 / 스타벅스</td>
					<td>돼지국밥 점심으로 먹고 스벅가서 커피 마시기</td>
				</tr>
			</table>
		</div>
		<!-- 컨텐츠 -->	
		
		<!-- 별점, 목록 버튼 -->
		<div class="btn">
			<!-- 아래 별점 일단 보류! -->
			<%-- <div class="v_btn">
				<button type="button"
				onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">별점주기</button>
			</div> --%>
			<div class="v_btn">
				<button type="button"
				onclick="location.href='index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=currentPage%>'">목록</button>
			</div>
		</div>
		<!-- 별점, 목록 버튼 -->
		
		<div class="comment_all_refresh">
			<!-- 댓글폼 -->
			<%
			//세션 아이디값 불러오기
			String myid=(String)session.getAttribute("myid");
			%>
			
			<div class="v_comment" id="test">
				<%-- <%System.out.println(dto.getNum());%> --%>
				<input type="hidden" name="num"  id="num" value="<%=num%>">
				<input type="hidden" name="myid" id="myid" value="<%=myid%>">
				<input type="hidden" name="currentPage" value="<%=currentPage%>">
			<%
			if(loginok!=null && loginok=="true"){ //로그인중일때만 입력폼이 보이도록 함!
			%>
				<table class="com_all">
					<tr>
						<td>
							<textarea id="com_box" name="content" required="required" placeholder="댓글을 입력해주세요."></textarea>
						</td>
						<td>
							<button type="button" id="v_com_check">확인</button>
						</td>
					</tr>
				</table>
			<%}else{ %>
			</div>
				<p class="loginok_comment_text">로그인 후 댓글을 입력하실 수 있습니다.</p>
			<% }%>
			<!-- 댓글폼 -->
			
			<!-- 댓글 리스트 -->
			<div class="v_comment_list_num">
				<span class="v_comment_num">총 댓글<b class="su"><%-- <%=clist.size() %> --%>0</b></span>
			</div>
			<div class="v_comment_list">
			</div>
			<!-- 댓글 리스트 -->
			
			<!-- 댓글 팝업 -->
			<%
			String idx=request.getParameter("idx");
			//db에서 num에 해당하는 dto 얻기
			commentDAO cdao=new commentDAO();
			commentDTO cdto=cdao.getData(idx);
			%>
			<div id="popup_update"  class="hide">
				<div class="content">
					<p class="cal_popup_1_title">수정하기</p>
						<textarea id="com_box_2" class="update_comment_form" name="content" 
						required="required" placeholder="">
						<%=cdto.getContents()%></textarea>
						<div class="cal_popup_1">
							<button type="submit" class="btn_submit_1">수정</button>
							<button onclick="closePopup()" class="btn_close_1">닫기</button>
						</div>
				</div>
			</div>
			<!-- 댓글 팝업 -->
		</div>
	</div>
	<!--view -->
</body>
</html>