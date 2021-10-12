<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="users.UserDAO"%>
<%@ page import="users.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>join action</title>
</head>
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
	
	System.out.println(userID +":"+ userPassword +":"+ userName +":"+ userPhone +":"+ userMail +":"+ userAddr +":"+ userGender +":"+ userDate);
	// -1: 서버 오류 / 0: 이미존재하는 아이디 / 1: 성공
	if (userID == null || userPassword == null || userName == null || userGender == null
	    || userDate == null) {
	  PrintWriter script = response.getWriter();
	  script.println("<script>");
	  script.println("alert('빈칸을 확인해 주세요')");
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

	  PrintWriter script = response.getWriter();
	  script.println("<script> alert('join action 일단은 실행. 결과는 모름.') ");	  
	  script.println("location.href = '../index.jsp' </script>");
	}
	%>
</body>
</html>
