<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
					<li><a href="index.jsp?main=allplan/allplanview.jsp">All Plan</a></li>
					<li><a href="#">New Plan</a></li>
					<li><a href="#">Review</a></li>
					<li><a href="#">Notice</a></li>
				</ul>
			</nav>
			
			<div id="member">
				<button onclick="location='index.jsp?main=users/login.jsp'">Login</button>
				<button onclick="location='index.jsp?main=users/join.jsp'">Join</button>
			</div>
		</div>
	</header>
</body>
</html>