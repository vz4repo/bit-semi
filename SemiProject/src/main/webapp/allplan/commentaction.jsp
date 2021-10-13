<%@page import="comment.commentDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String myid=(String)session.getAttribute("myid");
	String content=request.getParameter("content");
	
	//dto에 저장
	commentDTO dto=new commentDTO();
	dto.setName(myid);
%>