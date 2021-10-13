<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.PlanDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{
		height:50px;
		font-size: 20pt;
	}
</style>
</head>
<body>
<%
	PlanDao dao=new PlanDao();
	//페이징
	int perPage=5;//한페이지에 보여질 글의 개수
	int totalCount;//총 글의 수
	int totalPage;//총 페이지수
	int currentPage;//현재 페이지 번호
	int perBlock=3;//몇개의 페이지번호씩 표현할지
	int start;//각 페이지에서 불러올 db의 시작번호
	int jo;
	int chu;
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
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
	if(list.size()==0 && totalCount>0)
	{%>
	  <script type="text/javascript">
	  	location.href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=currentPage-1%>";
	  </script>
	<%}
	//각 페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>
<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Notice</p>
		</div>
	</div>
	<!-- notice게시판 왕제목 -->
	<div style="font-size: 30pt; margin-top: 50px; margin-left: 250px;" >
		<b>공지사항</b>
	</div>
	<br><br>
	
	<!-- 글쓰기 버튼 -->
	<button type="button" style="margin-left: 1200px;">글쓰기</button>
	<br><br><br>
	
	<!-- 테이블 -->
	<div style="margin-left: 250px;">
			<table style="width: 1200px;">
				<%
					for(PlanDto dto:list)
					{%>
					<tr>
						<td>공지</td>
						<td><%=dto.getContent() %></td>
						<td>운영자</td>
					</tr>
					  
					<%}
				%>
			</table>
	</div>
</body>
</html>