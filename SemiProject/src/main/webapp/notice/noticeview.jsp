<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.PlanDto"%>
<%@page import="data.dao.PlanDao"%>
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
	String userid=(String)session.getAttribute("userSessionID");
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
	  currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 이외의 null값
	String key=request.getParameter("key");
	
	NoticeDao dao=new NoticeDao();
	
	
	//num에 해당하는 dto 얻기
	NoticeDto dto=dao.getNot(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	
	
%>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Notice</p>
		</div>
	</div>
	<!-- sub -->
	
	<!-- view -->
	
	<div class="container">
		<!-- 상단 -->
		<div class="view_top">
			<p class="v_title"><%=dto.getContent() %></p>
			<div class="v_func">
				<p>Writer&nbsp;&nbsp;<%=dto.getName() %><span>|</span></p>
				<p>Date&nbsp;&nbsp;<%=sdf.format(dto.getWriteday()) %></p>
			</div>
			<div class="v_func_2">
				<p>View</p>
				<p>10</p>
			</div>
		</div>
		<!-- 상단 -->
		
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<p><%=dto.getContent() %></p>
		</div>
		<!-- 컨텐츠 -->	
		
		<!-- 목록 버튼 -->
		<div class="btn">
			<div class="v_btn">
				<a onclick="location.href='index.jsp?main=notice/noticeboard.jsp?currentPage=<%=currentPage%>'" class="btnlist">목록</a>
			</div>
		</div>
		<!-- 목록 버튼 -->
	</div>
	<!--view -->
</body>
</html>