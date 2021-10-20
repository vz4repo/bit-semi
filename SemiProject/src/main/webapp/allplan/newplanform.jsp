<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="plan/newplanadd.jsp" method="post" class="form-inline" name="planfrm">
<table class="table table-bordered" style="width:500px; margin-top: 300px;">
	<caption><b>새 여행 계획</b></caption>
	<tr>
		<th width="100" bgcolor="#aaa">이름</th>
		<td>
			<input type="text" name="name"  class="form-control"
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
		<th width="100" bgcolor="#aaa">추천</th>
		<td>
			<input type="text" name="chu"  class="form-control"
			 style="width: 120px;">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">좋아요</th>
		<td>
			<input type="text" name="jo" class="form-control"
			 style="width: 120px;">
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
</body>
</html>