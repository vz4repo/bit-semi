<%@page import="data.dao.PlanDao"%>
<%@page import="data.dto.PlanDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
//데이터 읽어서 dto에 넣기
PlanDto dto=new PlanDto();
String name=request.getParameter("name");
String content=request.getParameter("content");
String chu1=request.getParameter("chu");
String jo1=request.getParameter("jo");

int chu=Integer.parseInt(chu1);
int jo=Integer.parseInt(jo1);

dto.setName(name);
dto.setContent(content);
dto.setChu(chu);
dto.setJo(jo);


//dao 선언후 insert 메서드 호출
PlanDao dao=new PlanDao();
dao.insertPlan(dto);

//gaipsuccess.jsp로 이동
response.sendRedirect("../index.jsp");
%>