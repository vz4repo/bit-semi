
<%@page import="date.dto.AllPlanDto"%>
<%@page import="date.dto.PlanDto"%>
<%@page import="date.dao.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");


	PlanDao dao = new PlanDao();
	PlanDto dto = new PlanDto();

	
	String plantitle   = request.getParameter("plantitle");
	String planDate  = request.getParameter("planDate");
	String planTime = request.getParameter("time");
	String mapPlan = request.getParameter("map");
	String contentPlan = request.getParameter("content");

	

	dto.setPlantitle(plantitle);
	dto.setPlanDate(planDate);
	dto.setPlanTime(planTime);
	dto.setMapPlan(mapPlan);
	dto.setContentPlan(contentPlan);
		
		
	dao.insertPlanContent(dto);
	
	
	
	
%> 