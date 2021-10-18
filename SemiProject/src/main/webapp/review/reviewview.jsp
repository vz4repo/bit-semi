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
</head>
<body>
<%
	String loginok = "";
	String myid = "";
	if (session.getAttribute("loginok") != null) {
 	   loginok = session.getAttribute("loginok").toString();
	    myid = (String) session.getAttribute("myid");
	} // 로그인 안해도 보여줄건가??
	
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
		<div class="v_contents" style="margin-left: 50px; margin-right: 50px; font-size: 1.5em;">
			<p><%=dto.getContent()%></p>
		</div>
		<!-- 컨텐츠 -->	
		
		<!-- 목록 버튼 -->
		<div class="btn">
			<div class="v_btn">
				<%
				if (myid!=null && dto.getUserID().equals(myid)){%>
					<button style="width: 150px;" type="button" class="btnlist" onclick="location.href='index.jsp?main=review/reviewupdateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">수정</button>
					<button style="width: 150px;" type="button" class="btnlist" onclick="location.href='review/reviewdelete.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">삭제</button>
				<%  
				}
				%>
				
				<button style="width: 150px;" type="button" class="good" num="<%=dto.getNum()%>">추천하기</button>
				<button style="width: 150px;" type="button" onclick="location.href='index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage%>'">목록</button>
			</div>
		</div>
		<script type="text/javascript">
		$("button.good").click(function() {
			var num = $("button.good").attr("num");
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