<%@page import="date.dao.myPlanDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	myPlanDao dao = new myPlanDao();
	dao.updateGood(num);
	int goodsu = dao.getAll(num).getGoodCnt();
	JSONObject ob = new JSONObject();
	ob.put("goodsu",goodsu);
%>
<%=ob.toString()%>