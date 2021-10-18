<%@page import="date.dto.myAllPlanDto"%>
<%@page import="date.dao.myPlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

	myPlanDao dao = new myPlanDao();
	myAllPlanDto dto = new myAllPlanDto();

	
	
	dto.setUserId(request.getParameter("userId"));
	
	dto.setPlanStartDay(request.getParameter("planStartDay"));
	dto.setPlanEndDay(request.getParameter("planEndDay"));

	String sday = request.getParameter("planStartDay");
	String eday = request.getParameter("planEndDay");
	

	dto.setPlantitle(request.getParameter("plantitle"));
	dto.setOpenPlan((request.getParameter("openPlan")=="true")?true:false);

	dao.insertPlan(dto);

	
%>

    