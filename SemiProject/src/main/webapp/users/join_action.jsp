<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="users.UserDAO"%>
<%@ page import="users.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<body>
	<%
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userPhone = request.getParameter("userPhone");
	String userMail = request.getParameter("userMail");
	String userAddr = request.getParameter("userAddr");
	String userGender = request.getParameter("userGender");
	String userDate = request.getParameter("userDate");


		// 세션 체크
		if(session.getAttribute("myid") != null){
			userID = (String)session.getAttribute("myid");
		}
		// 세션에 ID가 담겼으면 로그인 불가
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert("+ userID +"', 로그인 중')");
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
		}

	System.out.println(userID +":"+ userPassword +":"+ userName +":"+ userPhone +":"+ userMail +":"+ userAddr +":"+ userGender +":"+ userDate);
	// -1: 서버 오류 / 0: 이미존재하는 아이디 / 1: 성공
	if (userID == null || userPassword == null || userName == null ) {
	  PrintWriter script = response.getWriter();
	  script.println("<script>");
	  script.println("alert('빈칸(ID,PW,NAME)을 확인해 주세요')");
	  script.println("history.back()");
	  script.println("</script>");
	} else {
	  UserDTO dto = new UserDTO();

	  dto.setUserID(userID);
	  dto.setUserPassword(userPassword);
	  dto.setUserName(userName);
	  dto.setUserPhone(userPhone);
	  dto.setUserMail(userMail);
	  dto.setUserAddr(userAddr);
	  dto.setUserGender(userGender);
	  dto.setUserDate(userDate);

	  UserDAO dao = new UserDAO();
	  dao.join(dto);
	}
	%>
</body>