<%@page import="data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	NoticeDao dao=new NoticeDao();
	
	dao.deleteNotice(num);
	response.sendRedirect("../index.jsp?main=notice/noticeboard.jsp");
%>
