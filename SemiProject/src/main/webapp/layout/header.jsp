<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
</head>
<%
	String root=request.getContextPath();
%>
<body>
	<header>
		<div id="wrapper">
			<div id="logo">
				<a href="index.jsp"><%-- <img src="<%=root%>/image/s10.JPG"> --%>LOGO</a>
			</div>
		
			<nav class="clearfix">
				<ul class="clearfix">
					<li><a href="index.jsp?main=allplan/allplanlist.jsp">All Plan</a></li>
					<li><a href="index.jsp?main=newplan_test/newplanadd.jsp">New Plan</a></li>
					<li><a href="#">Review</a></li>
					<li><a href="#">Notice</a></li>
				</ul>
			</nav>
			
			<div id="member">
			<%
				String loginok=(String)session.getAttribute("loginok");
				String myid=(String)session.getAttribute("myid");
				
				if(loginok==null){%>
				<button onclick="location='index.jsp?main=test/login.jsp'">Login</button>
				<button onclick="location='index.jsp?main=test/join.jsp'">Join</button>
			<%}else{%>
				<button onclick="location.href='test/logoutaction.jsp'">Logout</button>
				<button onclick="#">MyPage</button>
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