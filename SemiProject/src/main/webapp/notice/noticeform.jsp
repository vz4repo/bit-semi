<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn1{
		width:100px;
		height:40px;
		border-radius: 50px;
		font-size: 13pt;
		margin-left: 1200px;
		
	}
	.btn1:hover{
		background-color:#dcdcdc;
	}
</style>
</head>
<body>
<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Notice</p>
		</div>
</div>

<div style="margin-top: 60px; margin-left: 500px;">
	<form action="notice/noticeaction.jsp" method="post">
		<table style="width:580px;">
			<caption style="margin-bottom:30px; margin-right: 80px; font-size: 30pt;"><b>공지사항 작성</b></caption>
			
			<tr>
				<td width="500">
					<input type="text" style="width:480px; height:30px;"
					name="title" required="required" placeholder="제목을 입력해주세요.">
				</td>
			</tr>
			<tr>
				<td width="500">
					 <textarea style="width:480px; height:300px;" 
					 name="content" required="required" placeholder="내용을 입력해주세요."></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn1"
					style="margin-left:190px; width:100px; height:50px;">등록</button>
				</td>
				
				
			</tr>
		
		</table>
	</form>
</div>
</body>
</html>