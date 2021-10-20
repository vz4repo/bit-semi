<%@page import="comment.commentDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String idx=request.getParameter("idx");
	commentDAO dao=new commentDAO();
	dao.deleteAnswer(idx);
%>