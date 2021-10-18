<%@page import="comment.commentDAO"%>
<%@page import="plan.PlanDao"%>
<%@page import="plan.PlanDto"%>
<%@page import="comment.commentDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//String myid=(String)session.getAttribute("myid");	// 쓰는 이유?
	String myid = request.getParameter("myid");
	String content=request.getParameter("content");
	String num = request.getParameter("num");
	
	//dto에 저장
	commentDTO dto=new commentDTO();
	dto.setNum(num);
	dto.setUserId(myid);
	dto.setContents(content);

	//dao 선언
	commentDAO dao=new commentDAO();

	//insert
	dao.commentInsert(dto);

	//방명록 목록으로 이동
	String path="../index.jsp?main=allplan/allplanlist.jsp";
	response.sendRedirect(path);
%>