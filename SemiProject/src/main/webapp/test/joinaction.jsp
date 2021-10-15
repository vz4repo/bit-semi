<%@page import="member_test.memberDTO"%>
<%@page import="member_test.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	request.setCharacterEncoding("utf-8");

	memberDTO dto=new memberDTO();
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String hp=request.getParameter("hp");
	String email=request.getParameter("email");
	String addr=request.getParameter("addr");
	String gender=request.getParameter("gender");
	String birth=request.getParameter("birth");
	
	dto.setName(name);
	dto.setId(id);
	dto.setPw(pw);
	dto.setHp(hp);
	dto.setEmail(email);
	dto.setAddr(addr);
	dto.setGender(gender);
	dto.setBirth(birth);
	
	memberDAO dao=new memberDAO();
	dao.insertMember(dto);
	
	response.sendRedirect("../index.jsp");
%>