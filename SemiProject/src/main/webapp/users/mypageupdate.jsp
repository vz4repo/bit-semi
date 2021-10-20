<%@page import="users.UserDAO"%>
<%@page import="users.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//데이타 읽어서 dto 에 넣기
	UserDTO dto=new UserDTO();
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userPhone = request.getParameter("userPhone");
	String userMail = request.getParameter("userMail");
	String userAddr = request.getParameter("userAddr");
	String userGender = request.getParameter("userGender");
	String userDate = request.getParameter("userDate");
	
	dto.setUserID(userID);
	dto.setUserPassword(userPassword);
	dto.setUserName(userName);
	dto.setUserPhone(userPhone);
	dto.setUserMail(userMail);
	dto.setUserAddr(userAddr);
	dto.setUserGender(userGender);
	dto.setUserDate(userDate);
	
	//dao 선언후 update 메서드 호출
	UserDAO dao=new UserDAO();
	dao.updateUser(dto);

	
	//목록으로 이동
	response.sendRedirect("../index.jsp?");
%>