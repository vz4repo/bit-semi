<%@page import="member_test.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	memberDAO dao=new memberDAO();
	
	boolean b=dao.loginPass(id, pw);
	
	if(b){
		session.setMaxInactiveInterval(60*60*4); 
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		response.sendRedirect("../index.jsp?");
	}else{%>
		<script type="text/javascript">
			alert("아이디 또는 비번이 맞지 않습니다!");
			history.back();
		</script>
	<%}
%>