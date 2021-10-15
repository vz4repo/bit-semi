<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String loginok=(String)session.getAttribute("loginok");
	String myid=(String)session.getAttribute("myid");
%>
<body>
	<%
	if(loginok!=null){ //로그인중일때만 입력폼이 보이도록 함!
	%>
	<form action="newplan_test/newplanadd.jsp" method="post" class="form-inline" name="planfrm">
		<table class="table table-bordered" style="width:500px; margin-top: 300px;">
			<caption><b>새 여행 계획</b></caption>
			<tr>
				<th width="100" bgcolor="#aaa">작성자</th>
				<td><%=myid%></td>
			</tr>
			<tr>
				<th width="100" bgcolor="#aaa">제목</th>
				<td>
					<input type="text" name="plantitle"  class="form-control"
					 style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#aaa">기간</th>
				<td>
					<input type="text" name="planDate"  class="form-control"
					 style="width: 120px;">
				</td>
			</tr>
			<tr>
				<th width="100" bgcolor="#aaa">내용</th>
				<td>
					<input type="text" name="content"  class="form-control"
					 style="width: 320px;">
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button type="submit" class="btn btn-default"
					style="width:100px;">저장하기</button>
					
					<button type="reset" class="btn btn-default"
					style="width:100px;">다시하기</button>
				</td>
			</tr>
		</table>
	</form>
	<%}else{ %>
				<p class="loginok_newplanform_text">로그인 후 여행 계획을 만드실 수 있습니다.</p>
			<% }%>
</body>
</html>