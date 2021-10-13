<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link 선언 -->
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style_login.css">
<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="js/join_script.js"></script>
<title>login.jsp</title>
</head>
<%
String root = request.getContextPath();
%>
<body>
	<div class="container">
		<!-- sub -->
		<div class="margin_wrap">
			<div id="login_text">
				<p>GOING 로그인</p>
				<p>GOING에서 다양한 여행계획 정보를 얻어가세요.</p>
			</div>
		</div>
		<!-- sub -->

		<!-- get session attr-->
		<%
		// login.jsp 시작
	    System.out.println("> login.jsp");
		// 세션 체크
		if (session.getAttribute("userSessionID") != null) {
		  System.out.println("session not null");
		  PrintWriter script = response.getWriter();
		  script.println("<script>");
		  script.println("alert('이미 로그인 중')");
		  script.println("history.back()");
		  script.println("</script>");
		}
		%>

		<div class="login_containers">
			<form method="post"
				action="${pageContext.request.contextPath}/users/login_action.jsp">
				<div class="loginID loginValue">
					<label class="login_form_title">아이디</label> <label> <input
						type="text" class="loginInput" placeholder="아이디를 입력해주세요."
						name="userID" maxlength="20">
					</label>
				</div>
				<div class="loginPassword loginValue">
					<label class="login_form_title">비밀번호</label> <label> <input
						type="password" class="loginInput" placeholder="비밀번호를 입력해주세요."
						name="userPassword" maxlength="40">
					</label>
				</div>
				<input type="submit" class="btn_login" value="로그인">
				<div class="login_form_text">
					<p>아직도 GOING 온라인 회원이 아니신가요?</p>
					<a href="index.jsp?main=users/join.jsp">회원가입 하러가기</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>