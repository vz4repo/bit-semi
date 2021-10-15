<%@page import="users.UserDTO"%>
<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.btn { display:block; width:100px; height:40px; line-height:40px; border:1px #3399dd solid;; margin:15px auto; background-color:white; text-align:center; cursor: pointer; color:#333; transition:all 0.9s, color 0.3; }
	.hover1:hover{ box-shadow: 0 80px 0 0 rgba(0,0,0,0.25) inset, 0 -80px 0 0 rgba(0,0,0,0.25) inset; } 


	td{
		height:50px;
		font-size: 20pt;
	}
	.tb1 a{
		color: black;
	}
	.tb1:hover{
		background-color: #969696; 
		color:black;
		
	}
	.tb{
		width: 1000px; 
		border-collapse:collapse;
	}
	a{
		color:black;
	}
	.paging {
	text-align: center;
    }

	.paging a {
	display: inline-block;
	font-weight: bold;
	text-decoration: none;
	padding: 5px 8px;
	border: 1px solid #ccc;
	background-color: white;
	color: #000;
    }

	.paging a.select {
	background-color: black;
	color: #fff;
}
	
</style>
</head>
<body>
<% 
	
	String uls=session.getAttribute("loginok").toString();
	String userid=(String)session.getAttribute("myid");
	NoticeDao dao=new NoticeDao();
	
    
    
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
	

	List<NoticeDto> list=dao.getNotice(start, perPage);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
	if(list.size()==0 && totalCount>0)
	{%>
	  <script type="text/javascript">
	  	location.href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=currentPage-1%>";
	  </script>
	<%}
	//각 페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>
	<!-- 이미지 -->
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
	<%
	if(uls!=null && userid.equals("admin"))
	{%>
	  
	
	<button type="button" style="margin-left: 1200px;" class="btn hover1"
	onclick="location.href='index.jsp?main=notice/noticeform.jsp'">글쓰기</button>
	<br><br><br>
	<%}
	%>
	
	<!-- 테이블 -->
	<div style="margin-left: 250px;">
			<table class="tb">
				<%
					for(NoticeDto dto:list)
					{%>
					<tr class="tb1">
						<td style="text-align: center;">공지</td>
						<td style="width: 700px;">
						<a href="index.jsp?main=notice/noticeview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
	  					<%=dto.getTitle() %>
	  					</a>
						
						</td>
						<td style="text-align: center;">운영자</td>
					</tr>
					<%}
				%>
			</table>
	</div>
	
	<!-- 페이징 -->
	<div style="margin-left:340px; width:800px; text-align: center;" class="paging">	
	<%
		//이전
		if(startPage>1)
		{%>  
		  	<a href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=startPage-1 %>">이전</a>  
		<%}
	%>
	<%
		for(int pp=startPage;pp<=endPage;pp++)
		{
		  if(pp==currentPage)//현재페이지일때 활성
		  {%> 
		    	<a href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=pp%>"><%=pp %></a> 
		  <%}else{%>
		     	<a href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=pp %>"><%=pp %></a>
		  <%}
		}
		//다음
		if(endPage<totalPage)
		{%>
		  	<a href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=endPage+1 %>">다음</a>
		<%}
		
	%>	 	
</div>
</body>
</html>