<?xml version="1.0" encoding="UTF-8"?>
<%@page import="mysql.db.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DBConnect"%>
<%@page import="comment.commentDTO"%>
<%@page import="users.UserDAO"%>
<%@page import="comment.commentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
<%
	System.out.println("> commentxml.jsp");
	String num=request.getParameter("num");
	//System.out.println(num);
	commentDAO adao=new commentDAO();
	UserDAO mdao=new UserDAO();
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
	<%
	System.out.println(list.toString());
	}
%>
</data>
