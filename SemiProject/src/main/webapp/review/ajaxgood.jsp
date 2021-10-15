<%@page import="org.json.simple.JSONObject"%>
<%@page import="review.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	ReviewDao dao = new ReviewDao();
	dao.updateGood(num);
	int good = dao.getData(num).getGood();
	JSONObject ob = new JSONObject();
	ob.put("good",good);
%>
<%=ob.toString()%>