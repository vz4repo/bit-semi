<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.alist{
		text-decoration: none;
		color: black;
	}
	table{
		border: 1px solid black;
	}
	.listview{
		overflow: hidden;
		float: left;
		width: 240px;
		height: 310px;
		border: 5px solid gray;
		margin: 20px 0px 20px 20px;
		background-position: center;
		display: list-item;
		
	}
	.thumbnail{
		width: 240px;
		height: 200px;
		object-fit: contain;
		background-color: black;
	}
	span.subject{
		font-weight: bold;
		font-size: 1.5em;
	}
	span{
		color: black;
		font-size: 1.2em;
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
        background-color: #F5F5DC;
    	color: #000;
    }
    .paging a.select{
    	background-color: #FFA7A7;
    	color: #fff;
    }

</style>
</head>
<%
	ReviewDao dao = new ReviewDao();
	int perPage = 12;// 한 페이지에 보여질 글의 갯수
	int totalCount;//총 글의 수
	int currentPage;//현재 페이지 번호
	int totalPage;//총 페이지 수
	int start;//각 페이지에서 불러올 db의 시작번호
	int perBlock = 5;//몇개의 페이지 번호 씩 표현 할 것인가
	int startPage;//각 블럭에 표시 할 시작페이지
	int endPage;//각 블럭에 표시할 마지막 페이지
	
	//총 갯수
	totalCount = dao.getTotalCount();
	//현재 페이지 번호 읽기(단 null일 경우는 1 페이지로 설정)
	if(request.getParameter("currentPage")==null)
		currentPage = 1;
	else
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	//총 페이지 갯수 구하기
	totalPage = totalCount/perPage+(totalCount%perPage==0?0:1);
	//각 블럭의 시작페이지
	startPage = (currentPage-1)/perBlock*perBlock+1;
	endPage = startPage+perBlock-1;
	if(endPage>totalPage)
		endPage = totalPage;
	//각 페이지에서 불러 올 시작번호
	start = (currentPage-1)*perPage;
	
	//최신순 나열
	List<ReviewDto> list1 = dao.getLatestList(start, perPage);
	
	if(list1.size()==0 && totalCount>0){%>
		<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage-1%>";
		</script>  
	<%
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<!-- 셀렉트 박스 -->
<select class="selectmenu" style="margin-top: 80px; width: 70px; height: 50px; margin-left: 1200px;">
	<option value="latest" selected="selected">최신순</option>
	<option value="readcount">조회순</option>
	<option value="like">좋아요순</option>
</select>
<!-- 최신순 -->
<div id="" class=""
	style="width: 1250px; border: 10px solid black; margin-top: 80px; margin-left: 200px; max-width: 1100px;">
	<table>
		<tr>
			<%
			for(int row=0; row<list1.size(); row++){
				ReviewDto dto = list1.get(row);%>
				<td class="listview">
					<a class="alist" href="index.jsp?main=review/reviewdetail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
						<%
						if(dto.getThumbnail()!=null){%>
							<img alt="" src="imagesave/<%=dto.getThumbnail()%>" class="thumbnail"/>
						<%  
						}
						%>
						<br>
						<br>
						<span class="subject"><%=dto.getSubject()%></span><br><br>
						<span class="name">작성자 : 누구누구</span><br><br>
						<span class="good">좋아요&nbsp;0</span>&nbsp;<span class="bad">싫어요&nbsp;0</span><br><br>
						<span class="writeday"><%=sdf.format(dto.getWriteday())%></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="readcount">조회수&nbsp;<%=dto.getReadcount()%></span>
					</a>
				</td>
			<%}%>
		</tr>
	</table>	
	<div align="right"><button type="button" onclick="location.href='index.jsp?main=review/reviewform.jsp'">등록하기</button></div>
	<div class="paging">
		<%
		//이전
		if(startPage>1)
		{%>
			<a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=startPage-1%>">이전</a>
		<%}
	  
		for(int pp=startPage;pp<=endPage;pp++)
		{
			if(pp==currentPage)
			{%>
				<a class="select" href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			<%}else{%>
				<a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
			<%}
		}
	
		//다음
		if(endPage<totalPage)
		{%>
			<a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=endPage+1%>">다음</a>
		<%}
		%>
	</div>
</div>
<div style="height: 100px;"></div>
</body>
</html>








