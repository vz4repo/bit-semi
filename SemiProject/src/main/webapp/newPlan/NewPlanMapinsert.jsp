<%@ page import="date.dao.PlanDAO" %>
<%@ page import="date.dto.PlanDTO" %>
<%@ page import="date.dto.AllPlanDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	PlanDAO dao = new PlanDAO();
	PlanDTO dto = new PlanDTO();

	AllPlanDTO cdto = new AllPlanDTO();


	String plantitle   = request.getParameter("plantitle");
	String planDate  = request.getParameter("planDate");
	String planTime = request.getParameter("planTime");
	String mapPlan = request.getParameter("mapPlan");
	String contentPlan = request.getParameter("contentPlan");



	dto.setPlantitle(plantitle);
	dto.setPlanDate(planDate);
	dto.setPlanTime(planTime);
	dto.setMapPlan(mapPlan);
	dto.setContentPlan(contentPlan);


	dao.insertPlanContent(dto);



%>

    