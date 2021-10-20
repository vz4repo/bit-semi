<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩
	request.setCharacterEncoding("UTF-8");
	//데이터 읽어서 dto에 넣기
	NoticeDto dto=new NoticeDto();
	dto.setTitle(request.getParameter("title"));
	dto.setContent(request.getParameter("content"));
	
	//db insert
	NoticeDao dao=new NoticeDao();
	dao.insertNotice(dto);
	
	//방명록 목록으로 이동
	String path="../index.jsp?main=notice/noticeboard.jsp";
	response.sendRedirect(path);
%>