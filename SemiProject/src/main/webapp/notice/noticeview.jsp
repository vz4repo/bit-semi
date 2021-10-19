<%@page import="java.util.List"%>
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
	String uls=(String)session.getAttribute("userLoginStatus");	
	String userid=(String)session.getAttribute("userSessionID");
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
	List<NoticeDto> list=dao.getNext(num);
	List<NoticeDto>	list2=dao.getPrev(num);
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
				<p>Writer&nbsp;&nbsp;<%=dto.getName() %><span>|</span></p>
				<p>Date&nbsp;&nbsp;<%=sdf.format(dto.getWriteday()) %></p>
			</div>
			<div class="v_func_2">
				<p></p>
				<p>조회수&nbsp;<%=dto.getReadcount() %></p>
			</div>
		</div>
		<!-- 상단 -->
		
		<!-- 컨텐츠 -->
		<div class="v_contents">
			<p style="font-size: 14pt;"><%=dto.getContent() %></p>
		</div>
		<!-- 컨텐츠 -->	
		<!-- 수정,삭제 -->
		<%
		if(uls!=null && userid.equals("admin"))
		{%>
		<div class="btn">
			<div class="v_btn btn">
				<a onclick="location.href='index.jsp?main=notice/noticeupdateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" class="btnlist">수정</a>
			</div>
		
			<div class="v_btn btn">
				<a onclick="location.href='notice/noticedeleteform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" class="btnlist">삭제</a>
			</div>
		<%}
		%>
		</div>
		
		<!-- 수정,삭제 -->
		
		<!-- 목록 버튼 -->
		<div class="btn">
			<div class="v_btn btn">
				<a onclick="location.href='index.jsp?main=notice/noticeboard.jsp?currentPage=<%=currentPage%>'" class="btnlist">목록</a>
			</div>
		</div>
		
		<div>
			<table style="border-collapse: collapse; width:500px; height:60px; margin-left: 450px;">
				
					<%
					for(NoticeDto dto2:list)
					{
					  if(list.size()==0){
					    %>
					    <tr>
					    	<td>다음글이 없어!!!!</td>
					    </tr>
					  <%}else{
					    %>
					
					    
				
					
					<tr>
					<td style="border-bottom: 1px solid black;">다음글</td>		
					<td style="border-bottom: 1px solid black;"><a onclick="location.href='index.jsp?main=notice/noticeview.jsp?num=<%=dto2.getNum() %>&currentPage=<%=currentPage %>&key=list'">내용:<%=dto2.getTitle() %></a></td>
					</tr>
					<%}
					}
					%>
			</table>
			<table style="border-collapse: collapse; width:500px; height:60px; margin-left: 450px;">
				
					<%
					for(NoticeDto dto2:list2)
					{
					  if(list2.size()==0){
					    %>
					    <tr>
					    	<td>이전글이 없어!!!!</td>
					    	
					    </tr>
					  <%}else{
					    %>
					  <%}
					    
					%>
					
					<tr>
					<td style="border-bottom: 1px solid black;">이전글</td>		
					<td style="border-bottom: 1px solid black;"><a onclick="location.href='index.jsp?main=notice/noticeview.jsp?num=<%=dto2.getNum() %>&currentPage=<%=currentPage %>&key=list'">내용:<%=dto2.getTitle() %></a></td>
					</tr>
					<%}
					%>
			</table>
		</div>
		<!-- 목록 버튼 -->
	</div>
	<!--view -->
</body>
</html>