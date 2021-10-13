<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="data.dao.ReviewDao"%>
<%@page import="data.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//세션으로 부터 db에 저장 할 아이디 얻기
String myid = (String)session.getAttribute("myid");
String myname = (String)session.getAttribute("userName");
String mygender = (String)session.getAttribute("userGender");
//이미지가 업로드 될 실제 경로 구하기
String realPath = getServletContext().getRealPath("/imagesave");
System.out.println(realPath);

int uploadSize = 1024 * 1024 * 2;
MultipartRequest multi = null;
try {
  multi =
  new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
  String subject = multi.getParameter("subject");
  String content = multi.getParameter("content");
  String thumbnail = multi.getFilesystemName("thumbnail");

  ReviewDto dto = new ReviewDto();
  dto.setUserID(myid);
  dto.setUserName(myname);
  dto.setUserGender(mygender);
  dto.setSubject(subject);
  dto.setContent(content);
  dto.setThumbnail(thumbnail);

  ReviewDao dao = new ReviewDao();
  dao.insertReview(dto);
  String path = "../index.jsp?main=review/reviewlist.jsp";
  response.sendRedirect(path);
} catch (Exception e) {
  System.out.println("업로드 오류" + e.getMessage());
}
%>