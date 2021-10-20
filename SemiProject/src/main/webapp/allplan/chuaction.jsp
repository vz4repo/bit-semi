<%@page import="plan.PlanDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	PlanDao dao = new PlanDao();
	dao.updateGood(num);
	int good = dao.getData(num).getGood();
	JSONObject ob = new JSONObject();
	ob.put("good",good);
%>
<%=ob.toString()%>