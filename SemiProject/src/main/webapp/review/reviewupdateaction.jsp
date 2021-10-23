<%@page import="review.ReviewDto"%>
<%@page import="review.ReviewDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String realPath = getServletContext().getRealPath("/imagesave");
	int uploadSize = 1024*1024*2;//2mb
	MultipartRequest multi = null;
	
	try{
	multi = new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
	String num = multi.getParameter("num");
	ReviewDao dao = new ReviewDao();
	String before_thumbnail=dao.getData(num).getThumbnail();
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String thumbnail = multi.getFilesystemName("thumbnail");
	String currentPage = multi.getParameter("currentPage");
	
	ReviewDto dto = new ReviewDto(); 
	dto.setNum(num);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setThumbnail(thumbnail==null?before_thumbnail:thumbnail);
	
	dao.updateReview(dto);
	String path = "../index.jsp?main=review/reviewview.jsp?num="+num+"&currentPage="+currentPage;
	response.sendRedirect(path);
	}catch(Exception e){
	  System.out.println("업로드오류:"+e.getMessage());
	}
%>