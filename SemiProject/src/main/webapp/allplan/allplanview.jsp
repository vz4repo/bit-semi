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
		//추천을 클릭했을 때의 이벤트
		$("span.v_likes").click(function(){
			var num=$(this).attr("num");
			var tag=$(this);
			console.log(num); //확인됨
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
		
		//댓글 폼에 텍스트 관련 이벤트
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
	/* 로그인 값 가져오기 */
	String loginok=(String)session.getAttribute("loginok");
	
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
	/* ------------------------------------------------- */
	
	/* 댓글 관련! */
	commentDAO cdao=new commentDAO();
	//페이징 처리에 필요한 변수선언
	int perPage=10; //한 페이지에 보여질 글의 갯수
	int totalCount; //총 글의 수
	int totalPage; //총 페이지수
	int currentPagenow; //현재 페이지번호
	int start; //각 페이지에서 불러올 db의 시작번호
	int perBlock=5; //몇개의 페이지 번호씩 표현할 것인가
	int startPage; //각 블럭에 표시할 시작페이지
	int endPage; //각 블럭에 표시할 마지막페이지
	
	//총 갯수
	totalCount=cdao.getTotalCount();
	
	//현재 페이지번호 읽기(단 null 일 경우는 1페이지로 설정)
	if(request.getParameter("currentPagenow")==null){
	  currentPagenow=1;
	}else{
	  currentPagenow=Integer.parseInt(request.getParameter("currentPagenow"));
	}
	
	//총 페이지 갯수 구하기
	//totalCOunt를 perPage로 나눈 값이 0이면 0을 더하고, 그렇지 않으면 1을 더해야함
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
	//각 블럭의 시작페이지
	//현재 페이지가 3일 경우 (3-1)/5*5+1
	//현재 페이지가 11일 경우 (11-1)/5*5+1
	startPage=(currentPagenow-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	if(endPage>totalPage){
		endPage=totalPage;
	}
	//각 페이지에서 불러올 시작번호
	//1페이지:0,2페이지:3,3페이지:6
	start=(currentPagenow-1)*perPage;
	//각 페이지에서 필요한 게시글 가져오기
	List<commentDTO> list=cdao.getList(start, perPage);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
		if(list.size()==0 && totalCount>0)
		{ 
		%>
		<script type="text/javascript">
		  	location.href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=currentPagenow-1%>";
		  </script>
		<%
		} 
		//각 페이지에 출력할 시작번호
		int no=totalCount-(currentPagenow-1)*perPage;
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
				<!-- 아래 팔로우 버튼 임시 보류! -->
				<p>Writer&nbsp;&nbsp;<%=dto.getUserId()%><!-- <button type="button">팔로우</button> --><span>|</span></p>
				<%-- <p><%=dto.getReadCNT()%> Views<span>|</span></p> --%>
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
		
		<!-- 댓글폼 -->
		<%
		if(loginok!=null){ //로그인중일때만 입력폼이 보이도록 함!
		%>
		<form action="allplan/commentaction.jsp" method="post" enctype="multipart/form-data">
			<div class="v_comment">
				<table class="com_all">
					<!-- <tr>
						<td>
							<input type="text" id="v_com_name" placeholder="이름을 입력해주세요.">
						</td>
					</tr> -->
					<tr>
						<td>
							<textarea id="com_box" name="content" required="required" placeholder="댓글을 입력해주세요."></textarea>
						</td>
						<td>
							<button type="submit" id="v_com_check">확인</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<%}else{ %>
			<p class="loginok_comment_text">로그인 후 댓글을 입력하실 수 있습니다.</p>
		<% }%>
		<!-- 댓글폼 -->
		
		<!-- 댓글 리스트 -->
		<div class="v_comment_list_num">
			<span class="v_comment_num">총 댓글<b><%=list.size() %></b></span>
		</div>
		<div class="v_comment_list">
		<%
		String myid=(String)session.getAttribute("myid");
		for(commentDTO cdto:list){
		%>
			<ul class="com_list_all">
				<li>
					<span class="com_list_1">
						<p class="com_list_1_name"><%=myid%></p>
						<p class="com_list_1_contents"><%=cdto.getContents()%></p>
						<p class="com_list_1_day"><%=sdf.format(cdto.getWriteday())%></p>
						<button type="button" id="v_com_btn_1">댓글</button>
						<button type="button" id="v_com_btn_1">수정</button>
						<button type="button" id="v_com_btn_1">삭제</button>
					</span>
				</li>
			</ul>
		<%}
		%>
		</div>
		<!-- 댓글 리스트 -->
	</div>
	<!--view -->
</body>
</html>