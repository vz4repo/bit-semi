<%@page import="date.dto.AllPlanDTO"%>
<%@page import="date.dao.PlanDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	PlanDAO dao = new PlanDAO();
	AllPlanDTO dto = new AllPlanDTO();



	dto.setUserId(request.getParameter("userId"));

	dto.setPlanStartDay(request.getParameter("planStartDay"));
	dto.setPlanEndDay(request.getParameter("planEndDay"));

	String sday = request.getParameter("planStartDay");
	String eday = request.getParameter("planEndDay");


	dto.setPlantitle(request.getParameter("plantitle"));
	dto.setOpenPlan((request.getParameter("openPlan")=="true")?true:false);

	dao.insertPlan(dto);


%>

    