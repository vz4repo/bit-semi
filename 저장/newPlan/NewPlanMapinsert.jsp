
<%@page import="org.json.simple.JSONObject"%>
<%@page import="date.dto.myAllPlanDto"%>
<%@page import="date.dto.myPlanDto"%>
<%@page import="date.dao.myPlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");


	myPlanDao dao = new myPlanDao();
	myPlanDto dto = new myPlanDto();

	
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