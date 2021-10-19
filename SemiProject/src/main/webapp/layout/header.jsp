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
	        $("header").css("background" , "#ff7b27");
	      }
	      else{
	        $("header").css("background" , "");
	      }
	    });
	});

	/* 비회원이 NEWPLAN 클릭시 로그인 하라는 팝업! */
	function showPopup(hasFilter, idx) {
	  const popup = document.querySelector('#popup_newplan');
	  popup.setAttribute("idx", idx);     // idx="idx" attr 추가
	  let target = '.comm_idx_' + idx;  // 수정 댓글 경로 만들기
	  $('#com_box_2').val($(target).text()); // 수정 댓글 text 넣기
	  if (hasFilter) {
	    popup.classList.add('has-filter');
	  } else {
	    popup.classList.remove('has-filter');
	  }
	  popup.classList.remove('hide');
	}
	function closePopup() {
	  const popup = document.querySelector('#popup_newplan');
	  popup.classList.add('hide');
	}
</script>
</head>
<%
	String root=request.getContextPath();
%>
<body>
	<header>
		<div id="wrapper">
			<div id="logo">
				<a href="index.jsp"><img src="<%=root%>/image/logo_new2.png"></a>
			</div>

			<nav class="clearfix">
				<ul class="clearfix">
					<li><a href="index.jsp?main=allplan/allplanlist.jsp">All Plan</a></li>
					<%
					String myid=(String)session.getAttribute("myid");
					/* 비회원일 경우 로그인 팝업이 나오고 회원일 경우 바로 NEWPALN으로 이동! */
					if(session.getAttribute("loginok")==null || (boolean)session.getAttribute("loginok") == false){%>
					<li><a href="javascript:void(0);" onclick="showPopup(false);">New Plan</a></li>
					<%}else{%>
						<li><a href="index.jsp?main=newPlan/NewPlanCal.jsp">New Plan</a></li>
					<%}
					%>
					<li><a href="index.jsp?main=review/reviewlist.jsp">Review</a></li>
					<li><a href="index.jsp?main=notice/noticeboard.jsp">Notice</a></li>
				</ul>
			</nav>

			<div id="member">
			<%	/* 비회원일 경우 LOGIN,JOIN 보이고 회원일 경우 LOGOUT,MYPAGE 보임! */
				if(session.getAttribute("loginok")==null || (boolean)session.getAttribute("loginok") == false){%>
				<button onclick="location='index.jsp?main=users/login.jsp'">Login</button>
				<button onclick="location='index.jsp?main=users/join.jsp'">Join</button>
			<%}else{%>
				<button onclick="location='index.jsp?main=users/logout_action.jsp'">Logout</button>
				<button onclick="location.href='index.jsp?main=users/mypage.jsp'">MyPage</button>
			<%}
			%>
			</div>

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
		</div>
	</header>
</body>
</html>