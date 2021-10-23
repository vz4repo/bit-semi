<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	String newplanpCal="../newPlan/NewPlanCal.jsp";
	if(request.getParameter("NewPlanmain")!=null){
	  newplanpCal=request.getParameter("NewPlanmain");
}
%>
<body>
	<!-- 헤더 (로고,메뉴들까지 불러옴) -->
	<div>
		<jsp:include page="../layout/header.jsp"/>
	</div>
	<!-- new plan 페이지 불러옴 -->
	<div class="layout main">
		<jsp:include page="<%=newplanpCal%>"/>
		
	</div>
</body>