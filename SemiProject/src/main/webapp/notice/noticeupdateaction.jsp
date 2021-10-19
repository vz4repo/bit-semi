<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	NoticeDto dto=new NoticeDto();
	String num=request.getParameter("num");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	NoticeDao dao=new NoticeDao();
	dao.updateNotice(dto);
	
	response.sendRedirect("../index.jsp?main=notice/noticeboard.jsp");
%>