<%@page import="users.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave"); //체크안하면 null
	
	UserDAO dao=new UserDAO();
	
	//위에서 선언한 dao의 isIdPass 메소드를 불러오고
	//위에 id,pass의 값을 b에 담아줌
	boolean b=dao.isIdPass(id,pass);
	
	//아이디와 비번이 맞으면 3개의 세션을 저장하고
	//로그인 메인으로 이동
	if(b){
		//세션 유지시간(생략시 기본이 30분)
		session.setMaxInactiveInterval(60*60*4); //4시간!
		session.setAttribute("loginok", "yes");
		session.setAttribute("myid", id);
		//cbsave가 null이면 null을 저장, 그렇지 않으면 yes를 저장!
		session.setAttribute("saveok", cbsave==null?null:"yes");
		//로그인 메인으로 이동
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	}else{%>
		<script type="text/javascript">
			alert("아이디 또는 비번이 맞지 않습니다!");
			history.back();
		</script>
	<%}
%>