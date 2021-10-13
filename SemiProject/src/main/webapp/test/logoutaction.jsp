<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	//loginok라는 세션을 제거한다!
	session.removeAttribute("loginok");
	//loginmain으로 이동!
	String path="../index.jsp?";
	response.sendRedirect(path);
%>
	
