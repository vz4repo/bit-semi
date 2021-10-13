<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.ReviewDto"%>
<%@page import="data.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	if(currentPage==null){
	  currentPage="1";
	}
	String key = request.getParameter("key");
	ReviewDao dao = new ReviewDao();
	if(key!=null){
	  dao.updateReadcount(num);
	}
	ReviewDto dto = new ReviewDto();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
</body>
</html>