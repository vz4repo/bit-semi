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
</head>
<body>
<% 
	/* String uls=(String)session.getAttribute("loginok");
	String userid=(String)session.getAttribute("myid"); */
	//로그인한 상태인지 확인
    
	String loginok = "";
    String myid = "";
    if (session.getAttribute("loginok") != null) {
        loginok = session.getAttribute("loginok").toString();
        myid = (String) session.getAttribute("myid");
    }
    
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

<div class="container">
	<p id="all_plan_list_title">GOING의 공지사항을 확인해주세요!</p>
	<!-- 테이블 -->
	<div>
			<table class="notice_list">
				<%
					for(NoticeDto dto:list)
					{%>
					<tr class="tb1">
						<td><p class="notice_point">공지</p></td>
						<td>
							<a href="index.jsp?main=notice/noticeview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list" class="notice_title">
		  					&nbsp;&nbsp;&nbsp;<%=dto.getTitle() %>
		  					</a>
						</td>
						<td class="notice_admin">관리자</td>
					</tr>
					<%}
				%>
			</table>
	</div>
	
	<!-- 글쓰기 버튼 -->
	<%
	if(loginok=="true" && myid.equals("admin"))
	{%>
	  
	<div>
	<button type="button" class="btn1"
	onclick="location.href='index.jsp?main=notice/noticeform.jsp'"><span>글쓰기</span></button>
	<%}
	%>
	</div>
	
	<!-- 페이징 -->
		<div class="paging">
		<%
		//이전
		if (startPage > 1) {
		%>
		<a
			href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=startPage - 1%>">이전</a>
		<%
		}

		for (int pp = startPage; pp <= endPage; pp++) {
		if (pp == currentPage) {
		%>
		<a class="select"
			href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=pp%>"><%=pp%></a>
		<%
		} else {
		%>
		<a href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=pp%>"><%=pp%></a>
		<%
		}
		}

		//다음
		if (endPage < totalPage) {
		%>
		<a
			href="index.jsp?main=notice/noticeboard.jsp?currentPage=<%=endPage + 1%>">다음</a>
		<%
		}
		%>
		</div>
</div>
</body>
</html>