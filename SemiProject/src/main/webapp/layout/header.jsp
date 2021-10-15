<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%
    String root = request.getContextPath();
%>
<script type="text/javascript">
/* 상단 메뉴바 스크롤시 이벤트! */
$(document).ready(function(){
    $(window).scroll(function(){
      var scroll = $(window).scrollTop();
      if (scroll > 1) {
        $("header").css("background" , "#4c6ef5");
      }
      else{
        $("header").css("background" , "");
      }
    });
});
</script>
<body>
	<header>
		<div id="wrapper">
			<div id="logo">
				<a href="index.jsp"><%-- <img src="<%=root%>/image/s10.JPG"> --%>LOGO</a>
			</div>

			<nav class="clearfix">
				<ul class="clearfix">
					<li><a href="index.jsp?main=allplan/allplanlist.jsp">All Plan</a></li>
					<li><a href="index.jsp?main=newPlan/NewPlanCal.jsp">New Plan</a></li>
					<li><a href="#">Review</a></li>
					<li><a href="index.jsp?main=notice/noticeview.jsp">Notice</a></li>
				</ul>
			</nav>

			<div id="member">
			<%
				String myid=(String)session.getAttribute("myid");

				if(session.getAttribute("loginok")==null){%>
				<button onclick="location='index.jsp?main=users/login.jsp'">Login</button>
				<button onclick="location='index.jsp?main=users/join.jsp'">Join</button>
			<%}else{%>
				<button onclick="location='index.jsp?main=users/logout_action.jsp'">Logout</button>
				<button onclick="location.href='#'">MyPage</button>
			<%}
			%>
			<!-- 아래 기존! -->
			<!-- <div id="member">
				<button onclick="location='index.jsp?main=test/login.jsp'">Login</button>
				<button onclick="location='index.jsp?main=test/join.jsp'">Join</button>
			</div> -->
			</div>
		</div>
	</header>
</body>
</html>