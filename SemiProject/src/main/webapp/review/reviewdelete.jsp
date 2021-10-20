
<%@page import="review.ReviewDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	
	
	ReviewDao dao = new ReviewDao();
	String thumbnail = dao.getData(num).getThumbnail();
	
	dao.deleteReview(num);
	
	String realPath = getServletContext().getRealPath("/imagesave");
	File file = new File(realPath+"\\"+thumbnail);
	file.delete();
	
	String go = "../index.jsp?main=review/reviewlist.jsp?currentPage="+currentPage;
	response.sendRedirect(go);
%>