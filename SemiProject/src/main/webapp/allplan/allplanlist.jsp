<%@page import="plan.PlanDto"%>
<%@page import="plan.PlanDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOING</title>
<script type="text/javascript">
$(function () {
	$("select.selpln").change(function () {
	       //var sel=$(".selpln option:selected").val();
	      var s=$(this).val();
	         //alert(s);
	      if(s=="rec"){
	         $(".tb").hide();
	         $("#t1").show();
	         localStorage.tt="t1";
	         
	        }/* else if(s=="chu"){
	          $(".tb").hide();
	          $("#t2").show();
	          localStorage.tt="t2";
	          
	      } */else if(s=="jo"){
	          $(".tb").hide();
	          $("#t3").show();
	          localStorage.tt="t3";
	      }
	      
	      });
	   
	   var tt=localStorage.tt;
	   
	   if(tt=="t1"){
	      $(".tb").hide();
	      $("#t1").show();   
	   }/* else if(tt=="t2"){
	      $(".tb").hide();
	      $("#t2").show();
	   } */else{
	      $(".tb").hide();
	      $("#t3").show();
	   }

});
</script>
</head>
<%
	String userId=(String)session.getAttribute("userId");

	String root=request.getContextPath();
	PlanDao dao=new PlanDao();
	//페이징
	int perPage=9;//한페이지에 보여질 글의 개수
	int totalCount;//총 글의 수
	int totalPage;//총 페이지수
	int currentPage;//현재 페이지 번호
	int perBlock=3;//몇개의 페이지번호씩 표현할지
	int start;//각 페이지에서 불러올 db의 시작번호
	int startPage;//각 블럭에 표시할 시작페이지
	int endPage;//각 블럭에 표시할 마지막페이지
	
	//총 갯수
	totalCount=dao.getTotalCount();
	//현재 페이지 번호 읽기(단 null일 경우는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
	  currentPage=1;
	else
	  currentPage=Integer.parseInt(request.getParameter("currentPage"));
	//총 페이지 갯수 구하기
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	//각 블럭 시작페이지
	startPage=(currentPage-1)/perBlock*perBlock+1;
	//끝 페이지
	endPage=startPage+perBlock-1;
	if(endPage>totalPage)
	  endPage=totalPage;
	//각 페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage;
	//각 페이지에서 필요한 게시글 가져오기
	//시간순 나열
	List<PlanDto> list=dao.getPlan(start, perPage);
	//추천순 나열
	/* List<PlanDto> list2=dao.getPlan2(start, perPage); */
	//조회순 나열
	List<PlanDto> list3=dao.getPlan3(start, perPage);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
	if(list.size()==0 && totalCount>0)
	{ 
	%>
	<script type="text/javascript">
	  	location.href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=currentPage-1%>";
	  </script>
	<%
	} 
	//각 페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>
<body>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>All Plan</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- view -->
	<div class="container">
		<p id="all_plan_list_title">다양한 여행 계획을 참고해보세요!</p>
		<div class="all_plan_list_container">
			<!-- 게시글 수 -->
			<p id="all_plan_list_cnt">총 <%=totalCount%>개</p>
			<!-- 셀렉트 박스 -->
			<select name="sel" class="selpln">
				<option selected="selected" value="rec" id="rec">최신순</option>
				<!-- <option value="jo" id="jo">좋아요순</option> -->
				<option value="jo" id="jo">조회순</option>
			</select>
		</div>
		<!-- 모든계획 나열표 -->
		<!-- 시간순 나열 -->
		<div id="t1" class="tb">
			<ul class="clearfix">
				<% 
				for(PlanDto dto:list){
				%>
				<li>
					<a href="index.jsp?main=allplan/allplanview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
						<span class="list_box_1">
							<h3><%=dto.getPlantitle()%></h3>
							<%-- <%System.out.println(dto.getNum()); %> --%>
							<p><%=dto.getPlanDate()%></p>
							<p><%=dto.getUserId()%></p>
						</span>
					</a>
				</li>
				<%} 
				%>
			</ul>
		</div>
	
		<!-- 추천순 나열 -->
		<%-- <div id="t2" class="tb">
			<ul class="clearfix">
				<% 
				for(PlanDto dto:list){
				%>
				<li>
					<a href="#">
						<span class="con_1_box">
							<h3><%=dto.getTitle() %></h3>
							<p><%=dto.getDays() %></p>
							<p>작성자:<%=dto.getName() %></p>
						</span>
					</a>
				</li>
				<%} 
				%>
			</ul>
		</div> --%>
		
		<!-- 조회순순 나열 -->
		<div id="t3" class="tb" style="display:none;">
			<ul class="clearfix">
				<% 
				for(PlanDto dto:list3){
				%>
				<li>
					<a href="index.jsp?main=allplan/allplanview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
						<span class="list_box_1">
							<h3><%=dto.getPlantitle()%></h3>
							<%System.out.println(dto.getNum()); %>
							<p><%=dto.getPlanDate()%></p>
							<p><%=dto.getUserId()%></p>
						</span>
					</a>
				</li>
				<%} 
				%>
			</ul>
		</div>
		
		<!-- 페이징 -->
		<div class="paging">
		<%
		//이전
		if (startPage > 1) {
		%>
		<a
			href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=startPage - 1%>">이전</a>
		<%
		}

		for (int pp = startPage; pp <= endPage; pp++) {
		if (pp == currentPage) {
		%>
		<a class="select"
			href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
		<%
		} else {
		%>
		<a href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
		<%
		}
		}

		//다음
		if (endPage < totalPage) {
		%>
		<a
			href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=endPage + 1%>">다음</a>
		<%
		}
		%>
		</div>
		<!-- <script type="text/javascript">
		var selectedp = [[${selectedp}]]; 
		if(selectedp == rec){
		    $('#rec').attr('selected','selected');
		} else if(selectedp == jo){
		    $('#jo').attr('selected','selected');
		} else{
		    $('#chu').attr('selected','selected');
		}
		</script> -->
	</div>
</body>
</html>