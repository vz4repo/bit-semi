<?xml version="1.0" encoding="UTF-8"?>
<%@page import="comment.commentDTO"%>
<%@page import="member_test.memberDAO"%>
<%@page import="comment.commentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
	String num=request.getParameter("num");
System.out.println(num);
	commentDAO adao=new commentDAO();
	memberDAO mdao=new memberDAO();
	List<commentDTO> list=adao.getAllAnswer(num);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	for(commentDTO dto:list)
	{
	 %>
	 	<answer idx="<%=dto.getIdx()%>" num="<%=dto.getNum()%>">
	 		<userid><%=dto.getUserId()%></userid>
	 		<contents><%=dto.getContents()%></contents>
	 		<writeday><%=sdf.format(dto.getWriteday())%></writeday>
	 	</answer>
	<%}
%>
</data>