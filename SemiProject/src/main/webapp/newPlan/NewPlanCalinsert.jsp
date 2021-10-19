<%@page import="date.dto.AllPlanDto"%>
<%@page import="date.dao.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

	PlanDao dao = new PlanDao();
	AllPlanDto dto = new AllPlanDto();

	
	
	dto.setUserId(request.getParameter("userId"));
	
	dto.setPlanStartDay(request.getParameter("planStartDay"));
	dto.setPlanEndDay(request.getParameter("planEndDay"));
	dto.setPlantitle(request.getParameter("plantitle"));
	dto.setOpenPlan((request.getParameter("openPlan").equals("true"))?true:false);

	dao.insertPlan(dto);

	
%>

    