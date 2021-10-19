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
	width:250px;
	height:330px;
	margin:20px 10px 20px 30px;
	border:1px solid rgba(0,0,0,0.1);
}

.thumbnail {
	width: 250px;
	height: 200px;
	object-fit: cover;
	background-color: black;
}

.subject {
	color: black;
	font-weight: bold;
	font-size: 15px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	width: 220px;
	text-indent: 5px;
	margin-left: 15px;
}

.name, .gandb, .wandr {
	color:#456824;
	font-size: 12px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline-block;
	width: 220px;
	text-indent: 5px;
	margin-left: 15px;
}

.btnreviewform {
	width: 200px;
	height: 50px;
	margin-right: 20px;
	outline: none;
	cursor: pointer;
	font-size: 20px;
	border: 1px solid #000;
	background-color: black;
	color: white;
	border-radius: 100px;
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
#btn_group button{
	width: 150px;
	height: 30px;
	border: 1px solid black;
	background-color: rgba(0,0,0,0);
	color: black;
	cursor: pointer;
}

#latest{
	border-top-left-radius: 10px;
	margin-right: -3px;
}

#good{
	border-top-right-radius: 10px;
	margin-left: -3px;
}
</style>
<script type="text/javascript">
$(function () {
	$("select.selpln").change(function() {
		var s = $(this).val();
		if(s=="latest"){
			$(".tb").hide();
	    	$("#t1").show();
	    	localStorage.tt="t1";
		}else if(s=="good"){
			$(".tb").hide();
	    	$("#t2").show();
	    	localStorage.tt="t2";
		}else if(s=="readcount"){
			$(".tb").hide();
	    	$("#t3").show();
	    	localStorage.tt="t3";
		}
	});
	var tt = localStorage.tt;
	if(tt=="t1"){
		$(".tb").hide();
		$("#t1").show();
	}else if(tt=="t2"){
		$(".tb").hide();
		$("#t2").show();
	}else{
		$(".tb").hide();
		$("#t3").show();
	}
});
</script>
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

if (list1.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
<<<<<<< HEAD
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>
	";
=======
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60
</script>
<%
}
//좋아요순 나열
List<ReviewDto> list2 = dao.getGoodList(start, perPage);

if (list2.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
<<<<<<< HEAD
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>
	";
=======
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60
</script>
<%
}
//조회순 나열
List<ReviewDto> list3 = dao.getWatchedList(start, perPage);

if (list3.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
<<<<<<< HEAD
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>
	";
=======
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60
</script>
<%
}
String loginok = "";
String myid = "";
if (session.getAttribute("loginok") != null) {
    loginok = session.getAttribute("loginok").toString();
    myid = (String) session.getAttribute("myid");
} // 로그인 안해도 보여줄건가??
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
ReviewDto dto = new ReviewDto();
UserDAO udao = new UserDAO();
%>
<body>
<div id="sub_image" class="margin_wrap">
	<div id="sub_text">
		<p>Review</p>
	</div>
</div>
<!-- view -->
<div class="container">
	<p id="all_plan_list_title">당신의 여행 일정을 공유해보세요!</p>
	<div class="all_plan_list_container">
		<!-- 게시글 수 -->
		<p id="all_plan_list_cnt">총 <%=totalCount%>개</p>
		<!-- 셀렉트 박스 -->
		<select name="listsel" id="sel_group" class="selpln">
			<option disabled="disabled" selected="selected">선택해주세요</option>
			<option value="latest">최신순</option>
			<option value="readcount">조회순</option>
			<option value="good">좋아요순</option>
		</select>
	</div>
</div>
<!-- 최신순 -->
	<div id="t1" class="tb" style="border-top: 2px solid black; border-bottom: 2px solid black; width:1200px; margin: 0 auto;">
		<table >
			<tr>
				<%
				for (int row = 0; row < list1.size(); row++) {
				  dto = list1.get(row);
				%>
				<td class="listview"><a class="alist"
					href="index.jsp?main=review/reviewview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list1">
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
	<!-- 좋아요순 -->
	<div id="t2" class="tb" style="border-top: 2px solid black; border-bottom: 2px solid black; width:1200px; margin: 0 auto;">
		<table>
			<tr>
				<%
				for (int row = 0; row < list2.size(); row++) {
				  dto = list2.get(row);
				%>
				<td class="listview"><a class="alist"
					href="index.jsp?main=review/reviewview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list1">
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
	<!-- 조회순 -->
	<div id="t3" class="tb" style="border-top: 2px solid black; border-bottom: 2px solid black; width:1200px; margin: 0 auto;">
		<table>
			<tr>
				<%
				for (int row = 0; row < list3.size(); row++) {
				  dto = list3.get(row);
				%>
				<td class="listview"><a class="alist"
					href="index.jsp?main=review/reviewview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list1">
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
		style="width:1200px; margin: 0 auto; margin-top: 10px;">
		<%
		if(myid!=null){%>
			<button class="btnreviewform" type="button"
			onclick="location.href='index.jsp?main=review/reviewform.jsp'">등록하기</button>
		<%
		}
		%>
	</div>
	<div class="paging"
		style="width:1200px; margin: 0 auto;">
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
</body>
</html>