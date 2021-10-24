<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String root = request.getContextPath();
%>
<body>
<header>
        <nav class="navbar">
            <div id="logo" class="navbar_logo logo">
                <a href="index.jsp"><img src="<%=root%>/image/going.svg" alt="going_logo"></a>
            </div>
            <ul class="clearfix navbar_menu">
                <li><a href="index.jsp?main=allplan/allplanlist.jsp">All Plan</a></li>
                <%
                    String myid = (String) session.getAttribute("myid");
                    /* 비회원일 경우 로그인 팝업이 나오고 회원일 경우 바로 NEWPALN으로 이동! */
                    if (session.getAttribute("loginOK") == null || !((boolean) session.getAttribute("loginOK"))) {%>
                <li><a href="javascript:void(0);" onclick="showPopup(false);">New Plan</a></li>
                <%} else {%>
                <li><a href="index.jsp?main=newPlan/NewPlanCal.jsp">New Plan</a></li>
                <%
                    }
                %>
                <li><a href="index.jsp?main=review/reviewlist.jsp">Review</a></li>
                <li><a href="index.jsp?main=notice/noticeboard.jsp">Notice</a></li>
            </ul>

            <ul class="navbar_user">
                <% /* 비회원일 경우 LOGIN,JOIN 보이고 회원일 경우 LOGOUT,MYPAGE 보임! */
                    if (session.getAttribute("loginOK") == null || !((boolean) session.getAttribute("loginOK"))) {%>
                <li><a href='index.jsp?main=users/login.jsp'>Login</a></li>
                <li><a href='index.jsp?main=users/join.jsp'>Join</a></li>
                <%} else {%>
                <li><a href='index.jsp?main=users/logout_action.jsp'>Logout</a></li>
                <li><a href='index.jsp?main=users/mypage.jsp'>MyPage</a></li>
                <%
                    }
                %>
            </ul>

            <a href="#" class="navbar_toggle logo">
                <img src="<%=root%>/image/btn_menu.svg" alt="menu">
            </a>
        </nav>


        <!-- 수정 팝업 내용 -->
        <div id="popup_newplan" class="hide">
            <div class="content">
                <a href="javascript:void(0);" onclick="closePopup();"><img id="popup_del_newplan" src="<%=root %>/image/del.png"></a>
                <p class="cal_popup_login_title">로그인 해주세요!</p>
                <p class="cal_popup_login_text">여행 계획은 GOING 회원만 등록가능합니다!</p>
                <form method="post" action="${pageContext.request.contextPath}/users/login_action.jsp">
                    <div class="loginID loginValue_np">
                        <input type="text" class="loginInput_np" placeholder="아이디를 입력해주세요." name="userID" maxlength="20">
                    </div>
                    <div class="loginPassword loginValue_np">
                        <input type="password" class="loginInput_np" placeholder="비밀번호를 입력해주세요." name="userPassword" maxlength="40">
                    </div>
                    <input type="submit" class="btn_login_np" value="로그인">
                    <div class="login_form_text">
                        <p>아직도 GOING 온라인 회원이 아니신가요?</p>
                        <a href="index.jsp?main=users/join.jsp">회원가입 하러가기</a>
                    </div>
                </form>
            </div>
        </div>
        <!-- 수정 팝업 내용 -->

</header>
</body>
<script src="js/header.js" defer></script>