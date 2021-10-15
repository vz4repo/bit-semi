다 <%@page import="java.io.Console"%>
<%@page import="users.UserDAO"%>
<%@page import="users.UserDTO"%>
<%@page import="review.ReviewDto"%>
<%@page import="review.ReviewDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
.alist {
	text-decoration: none;
	color: black;
}

.listview {
	overflow: hidden;
	float: left;
	width: 240px;
	height: 320px;
	margin: 20px 10px 20px 20px;
	background-position: center;
	box-shadow: 2px 2px 13px 3px rgba(0, 0, 0, 0.2);
}

.thumbnail {
	width: 240px;
	height: 200px;
	object-fit: cover;
	background-color: black;
}

.subject {
	color: black;
	font-weight: bold;
	font-size: 15pt;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	width: 240px;
	text-indent: 5px;
}

.name, .gandb, .wandr {
	color: gray;
	font-size: 10pt;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	width: 240px;
	text-indent: 5px;
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

.btnreviewform {
	width: 150px;
	height: 32px;
	margin-right: 20px;
	outline: none;
	cursor: pointer;
	font-size: 12px;
	border: 1px solid #000;
	background-color: black;
	color: white;
	border-radius: 100px;
}

#latest, #readcount, #good, #all, #M, #F {
	display: none;
}

label {
	width: 40px;
	height: 20px;
	border-radius: 10px;
	background: gray;
	display: inline-block;
	text-indent: -9999em;
	position: relative;
	transition: 0.3s;
}

label:after {
	content: '';
	width: 15px;
	height: 15px;
	position: absolute;
	background: white;
	border-radius: 50%;
	left: 2.5px;
	top: 2.5px;
	transition: 0.3s;
}

#latest:checked+label, #readcount:checked+label, #good:checked+label,
	#all:checked+label, #M:checked+label, #F:checked+label {
	background: black;
}

#latest:checked+label:after, #readcount:checked+label:after, #good:checked+label:after,
	#all:checked+label:after, #M:checked+label:after, #F:checked+label:after
	{
	left: 23px;
	background: white;
}

.toption {
	font-size: 11pt;
	color: black;
}

.r {
	text-align: right;
	width: 65px;
}

.btnop {
	width: 100px;
	height: 25px;
	margin-bottom: 1px;
	outline: none;
	cursor: pointer;
	font-size: 12px;
	border: 1px solid #000;
	background-color: white;
	color: black;
	border-radius: 100px;
	font-weight: bold;
}
</style>
</head>
<%
ReviewDao dao = new ReviewDao();
int perPage = 1;// 한 페이지에 보여질 글의 갯수
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
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
//총 페이지 갯수 구하기
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
//각 블럭의 시작페이지
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;
if (endPage > totalPage)
	endPage = totalPage;
//각 페이지에서 불러 올 시작번호
start = (currentPage - 1) * perPage;

//최신순 나열
List<ReviewDto> list1 = dao.getLatestList(start, perPage);
//좋아요순 나열
List<ReviewDto> list2 = dao.getGoodList(start, perPage);
//조회순 나열
List<ReviewDto> list3 = dao.getWatchedList(start, perPage);

if (list1.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>
	";
</script>
<%
}
if (list2.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>
	";
</script>
<%
}
if (list3.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>
	";
</script>
<%
}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ReviewDto dto = new ReviewDto();
UserDAO udao = new UserDAO();
String userLoginStatus = (String)session.getAttribute("userLoginStatus");
String myid = (String)session.getAttribute("userSessionID");
%>
<body>
	<div id="main_wrap" style="height: 320px;">
		<div id="main_text" style="top: 180px;">
			<p>Review</p>
		</div>
	</div>
	<div style="height: 10px;"></div>
	<div
		style="width: 1250px; margin-top: 80px; margin-left: 200px; max-width: 1100px;">
		<table class="toption">
			<tr>
				<th width="40" style="font-size: 11pt;">정렬 |</th>
				<td class="r">최신순</td>
				<td><input checked="checked" value="list1" name="listarray"
					type="radio" id="latest"><label for="latest">최신순</label></td>
				<td class="r">조회순</td>
				<td><input value="list2" name="listarray" type="radio"
					id="readcount"><label for="readcount">최신순</label></td>
				<td class="r">좋아요순</td>
				<td><input value="list3" name="listarray" type="radio" id="good"><label
					for="good">최신순</label></td>
			</tr>
			<tr>
				<th style="font-size: 11pt;">성별 |</th>
				<td class="r">전체</td>
				<td><input checked="checked" value="all" name="gender"
					type="radio" id="all"><label for="all">전체</label></td>
				<td class="r">남성</td>
				<td><input value="M" name="gender" type="radio" id="M"><label
					for="M">남성</label></td>
				<td class="r">여성</td>
				<td><input value="F" name="gender" type="radio" id="F"><label
					for="F">여성</label></td>
				<td id="btnop" rowspan="2" width="130" style="text-align: right;"><button
						class="btnop" type="button" onclick="location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";">적용하기</button>
						</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	function changeList() {
		$("input[name='listarray']:checked").
		
	};
	</script>
	<!-- 최신순 -->
	<div id="listview" class=""
		style="width: 1250px; border-top: 3px solid black; border-bottom: 3px solid black; margin-top: 10px; margin-left: 200px; max-width: 1100px;">
		<table>
			<tr>
				<%
				for (int row = 0; row < list1.size(); row++) {
				  dto = list1.get(row);
				%>
				<td class="listview"><a class="alist"
					href="index.jsp?main=review/reviewview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
						<%
						if (dto.getThumbnail() != null) {
						%> <img alt="" src="imagesave/<%=dto.getThumbnail()%>"
						class="thumbnail" /> <%
 						}else{%> <img class="thumbnail" /> <%}
 %> <br><br>
						<ul>
							<li class="subject"><%=dto.getSubject()%></li>
							<br>
							<br>
							<li class="name">작성자 : <%=dto.getUserID()%></li>
							<br>
							<li class="gandb"><span class="good">좋아요 <%=dto.getGood()%></span>
							<br>
							<li class="wandr"><span class="writeday"><%=sdf.format(dto.getWriteday())%></span>&nbsp;&nbsp;|&nbsp;&nbsp;
								<span class="readcount">조회수&nbsp;<%=dto.getReadcount()%></span></li>
						</ul>
				</a></td>
				<%
				}
				%>
			</tr>
		</table>
	</div>
	<div align="right"
		style="width: 1250px; margin-top: 10px; margin-left: 200px; max-width: 1100px;">
		<%
		if(userLoginStatus!=null){%>
			<button class="btnreviewform" type="button"
			onclick="location.href='index.jsp?main=review/reviewform.jsp'">등록하기</button>
		<%
		}
		%>
	</div>
	<div class="paging"
		style="width: 1250px; margin-left: 200px; max-width: 1100px;">
		<%
		//이전
		if (startPage > 1) {
		%>
		<a
			href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=startPage - 1%>">이전</a>
		<%
		}

		for (int pp = startPage; pp <= endPage; pp++) {
		if (pp == currentPage) {
		%>
		<a class="select"
			href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
		<%
		} else {
		%>
		<a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
		<%
		}
		}

		//다음
		if (endPage < totalPage) {
		%>
		<a
			href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=endPage + 1%>">다음</a>
		<%
		}
		%>
	</div>
	<div style="height: 100px;"></div>
</body>
</html>








