<%@page import="review.ReviewDto"%>
<%@page import="review.ReviewDao"%>
<%@page import="users.UserDAO"%>
<%@page import="users.UserDTO"%>
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
	width: 150px;
	height: 50px;
	margin-right: 20px;
	outline: none;
	cursor: pointer;
	font-size: 17px;
	border: 1px solid #000;
	background-color: black;
	color: white;
	border-radius: 100px;
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
int perPage = 12;// ??? ???????????? ????????? ?????? ??????
int totalCount;//??? ?????? ???
int currentPage;//?????? ????????? ??????
int totalPage;//??? ????????? ???
int start;//??? ??????????????? ????????? db??? ????????????
int perBlock = 5;//????????? ????????? ?????? ??? ?????? ??? ?????????
int startPage;//??? ????????? ?????? ??? ???????????????
int endPage;//??? ????????? ????????? ????????? ?????????

//??? ??????
totalCount = dao.getTotalCount();
//?????? ????????? ?????? ??????(??? null??? ????????? 1 ???????????? ??????)
if (request.getParameter("currentPage") == null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
//??? ????????? ?????? ?????????
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
//??? ????????? ???????????????
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;
if (endPage > totalPage)
	endPage = totalPage;
//??? ??????????????? ?????? ??? ????????????
start = (currentPage - 1) * perPage;

//????????? ??????
List<ReviewDto> list1 = dao.getLatestList(start, perPage);

if (list1.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";
</script>
<%
}
//???????????? ??????
List<ReviewDto> list2 = dao.getGoodList(start, perPage);

if (list2.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";
</script>
<%
}
//????????? ??????
List<ReviewDto> list3 = dao.getWatchedList(start, perPage);

if (list3.size() == 0 && totalCount > 0) {
%>
<script type="text/javascript">
			location.href = "index.jsp?main=review/reviewlist.jsp?currentPage=<%=currentPage - 1%>";
</script>
<%
}
String loginok = "";
String myid = "";
if (session.getAttribute("loginok") != null) {
    loginok = session.getAttribute("loginok").toString();
    myid = (String) session.getAttribute("myid");
} // ????????? ????????? ?????????????????
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
	<p id="all_plan_list_title">????????? ?????? ????????? ??????????????????!</p>
	<div class="all_plan_list_container">
		<!-- ????????? ??? -->
		<p id="all_plan_list_cnt">??? <%=totalCount%>???</p>
		<!-- ????????? ?????? -->
		<select name="listsel" id="sel_group" class="selpln">
			<option disabled="disabled" selected="selected">??????????????????</option>
			<option value="latest">?????????</option>
			<option value="readcount">?????????</option>
			<option value="good">????????????</option>
		</select>
	</div>
</div>
<!-- ????????? -->
	<div id="t1" class="tb" style="width:1200px; margin: 0 auto;">
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
							<li class="name">????????? : <%=dto.getUserID()%></li>
							<br>
							<li class="gandb"><span class="good">????????? <%=dto.getGood()%></span>
							<br>
							<li class="wandr"><span class="writeday"><%=sdf.format(dto.getWriteday())%></span>&nbsp;&nbsp;|&nbsp;&nbsp;
								<span class="readcount">?????????&nbsp;<%=dto.getReadcount()%></span></li>
						</ul>
				</a></td>
				<%
				}
				%>
			</tr>
		</table>
	</div>
	<!-- ???????????? -->
	<div id="t2" class="tb" style="width:1200px; margin: 0 auto;">
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
							<li class="name">????????? : <%=dto.getUserID()%></li>
							<br>
							<li class="gandb"><span class="good">????????? <%=dto.getGood()%></span>
							<br>
							<li class="wandr"><span class="writeday"><%=sdf.format(dto.getWriteday())%></span>&nbsp;&nbsp;|&nbsp;&nbsp;
								<span class="readcount">?????????&nbsp;<%=dto.getReadcount()%></span></li>
						</ul>
				</a></td>
				<%
				}
				%>
			</tr>
		</table>
	</div>
	<!-- ????????? -->
	<div id="t3" class="tb" style="width:1200px; margin: 0 auto;">
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
							<li class="name">????????? : <%=dto.getUserID()%></li>
							<br>
							<li class="gandb"><span class="good">????????? <%=dto.getGood()%></span>
							<br>
							<li class="wandr"><span class="writeday"><%=sdf.format(dto.getWriteday())%></span>&nbsp;&nbsp;|&nbsp;&nbsp;
								<span class="readcount">?????????&nbsp;<%=dto.getReadcount()%></span></li>
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
			onclick="location.href='index.jsp?main=review/reviewform.jsp'">????????????</button>
		<%
		}
		%>
	</div>
	<div class="paging">
		<%
		//??????
		if (startPage > 1) {
		%>
		<a
			href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=startPage - 1%>">??????</a>
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

		//??????
		if (endPage < totalPage) {
		%>
		<a
			href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=endPage + 1%>">??????</a>
		<%
		}
		%>
	</div>
</body>
</html>