<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.PlanDto"%>
<%@page import="data.dao.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<body>
<%
	String loginok = "";
	String myid = "";
	if (session.getAttribute("loginok") != null) {
	    loginok = session.getAttribute("loginok").toString();
	    myid = (String) session.getAttribute("myid");
	}	

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	if(currentPage==null)
	  currentPage="1";
	//key는 목록에서만 값이 넘어오고 그 이외의 null값
	String key=request.getParameter("key");
	NoticeDao dao=new NoticeDao();
	
	if(key!=null)
		dao.updateReadCount(num);
	
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
			<p class="v_title"><%=dto.getTitle() %></p>
			<div class="v_func">
				<p>Writer&nbsp;&nbsp;관리자<span>|</span></p>
				<p>Date&nbsp;&nbsp;<%=sdf.format(dto.getWriteday()) %></p>
			</div>
			<div class="v_func_2">
	            <p>View</p>
	            <p><%=dto.getReadcount()%>
	            </p>
        	</div>
		</div>
		<!-- 상단 -->
		
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<p style="font-size: 14pt;"><%=dto.getContent() %></p>
		</div>
		<!-- 컨텐츠 -->	
		<!-- 수정,삭제 -->
		<div class="btn">
			<div class="v_btn">
		<%
		if(loginok=="true" && myid.equals("admin"))
		{%>
				<button type="button" onclick="location.href='index.jsp?main=notice/noticeupdateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" class="btn_notice_change">수정</button>
				<button type="button" onclick="location.href='notice/noticedeleteform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" class="btn_notice_del">삭제</button>
		<%}
		%>
			<!-- 목록 버튼 -->
				<button type="button" onclick="location.href='index.jsp?main=notice/noticeboard.jsp?currentPage=<%=currentPage%>'" class="btn_notice_list">목록</button>
			</div>
			<!-- 목록 버튼 -->
		</div>
		
		<!-- 수정,삭제 -->
		
	</div>
	<!--view -->
</body>
</html>