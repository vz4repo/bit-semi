<%@page import="review.ReviewDto"%>
<%@page import="review.ReviewDao"%>
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
<style type="text/css">
a{
	cursor: pointer;
}
</style>
</head>
<body>
<%
	String userLoginStatus = (String)session.getAttribute("userLoginStatus");
	String myid = (String)session.getAttribute("userSessionID");
	
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	if(currentPage==null){
	  currentPage="1";
	}
	String key = request.getParameter("key");
	ReviewDao dao = new ReviewDao();
	if(key!=null){
	  dao.updateReadcount(num);
	}
	ReviewDto dto = dao.getData(num);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Review</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- view -->
	<div class="container">
		<!-- 상단 -->
		<div class="view_top">
			<p class="v_title"><%=dto.getSubject()%></p>
			<div class="v_func">
				<p>Writer&nbsp;&nbsp;<%=dto.getUserID()%><span>|</span></p>
				<p>Date&nbsp;&nbsp;<%=dto.getWriteday()%></p>
			</div>
			<div class="v_func_2">
				<p>View</p>
				<p><%=dto.getReadcount()%></p>
			</div>
			<div class="v_func_2" style="margin-right: 100px;">
				<p>Like</p>
				<p class="pgood"><%=dto.getGood()%></p>
			</div>
		</div>
		<!-- 상단 -->
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<p><%=dto.getContent()%></p>
		</div>
		<!-- 컨텐츠 -->	
		
		<!-- 목록 버튼 -->
		<div class="btn">
			<div class="v_btn">
				<%
				if (userLoginStatus!=null && dto.getUserID().equals(myid)){%>
					<a>수정</a>
					<a href="review/reviewdelete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>">삭제</a>
				<%  
				}
				%>
				
				<a class="good" num="<%=dto.getNum()%>">추천하기</a>
				<a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage%>" class="">목록</a>
			</div>
		</div>
		<script type="text/javascript">
		$("a.good").click(function() {
			var num = $("a.good").attr("num");
			var tag = $("p.pgood");
			console.log(num);
			$.ajax({
				type: "get",
				dataType: "json",
				url: "review/ajaxgood.jsp",
				data: {"num":num},
				success: function(data) {
					tag.text(data.good);
				}
			});
		});
		</script>
		<!-- 목록 버튼 -->
	</div>
	<!--view -->
</body>
</html>