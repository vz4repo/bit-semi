<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<%
    String root = request.getContextPath();
%>
<script type="text/javascript">
	/* 상단 메뉴바 스크롤시 이벤트! */
	$(document).ready(function(){
		$(window).scroll(function(){
			var scroll = $(window).scrollTop();
			if (scroll > 1) {
				$("header").css("background" , "#4c6ef5");
			}
			else{
				$("header").css("background" , "");
			}
		});
	});
</script>


<header>
    <div id="wrapper">
        <div id="logo">
            <a href="index.jsp"><%-- <img src="<%=root%>/image/s10.JPG"> --%>LOGO</a>
        </div>

        <nav class="clearfix">
            <ul class="clearfix">
                <li><a href="index.jsp?main=allplan/allplanlist.jsp">All Plan</a></li>
                <li><a href="index.jsp?main=allplan/newplanform.jsp">New Plan</a></li>
                <li><a href="index.jsp?main=newplan_test/newplanadd.jsp">New Plan(Test)</a></li>
                <li><a href="#">Review</a></li>
                <li><a href="index.jsp?main=notice/noticeboard.jsp">Notice</a></li>
            </ul>
        </nav>
        <div id="member">
            <%
                // 세션에 ID가 있을 경우
                if (session.getAttribute("userSessionID") != null) {
            %>
            <button onclick="location='index.jsp?main=users/info.jsp'">info</button>
            <button onclick="location='index.jsp?main=users/logout_action.jsp'">Log Out</button>
            <%
                // 세션에 ID가 없을 경우
            } else {
            %>
            <button onclick="location='index.jsp?main=users/login.jsp'">Login</button>
            <button onclick="location='index.jsp?main=users/join.jsp'">Join</button>
            <%
                }
            %>
        </div>
    </div>
</header>