<%@page import="plan.PlanDto"%>
<%@page import="plan.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String userId = (String)session.getAttribute("sessionId");
// num,userId,plantitle,planDate,content,readCNT,good,writeday
String plantitle=request.getParameter("plantitle");
String planDate=request.getParameter("planDate");
String content=request.getParameter("content");

//데이터 읽어서 dto에 넣기
PlanDto dto=new PlanDto();
dto.setUserId(userId);
dto.setPlantitle(plantitle);
dto.setPlanDate(planDate);
dto.setContent(content);

//dao 선언후 insert 메서드 호출
PlanDao dao=new PlanDao();
dao.insertPlan(dto);

//gaipsuccess.jsp로 이동
response.sendRedirect("../index.jsp");
%>