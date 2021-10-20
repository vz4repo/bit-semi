<%@page import="comment.commentDTO"%>
<%@page import="comment.commentDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
//엔코딩
	request.setCharacterEncoding("UTF-8");

	//데이터 읽어서 DTO에 넣기!
	commentDTO dto=new commentDTO();
	dto.setIdx(request.getParameter("idx"));
	dto.setContents(request.getParameter("content")); //내가 입력한것!!
	
	//페이지번호 읽기 (어느 글에 달렸는지 알 수 있음)
	String currentPage=request.getParameter("currentPage");
	
	//db에 저장
	commentDAO dao=new commentDAO();
	dao.updateComment(dto);
%>
