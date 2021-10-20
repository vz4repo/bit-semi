<%@page import="java.util.List"%>
<%@page import="users.UserDTO"%>
<%@page import="users.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         	<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <!-- meta 선언 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- link 선언 -->
    <link rel="stylesheet" href="../css/style.css">
    <!-- 아래 style 잠시 주석처리함(희수) -->
    <!-- <link rel="stylesheet" href="../css/style_join.css"> -->

    <title>GOING</title>
</head>
<%
    String root=request.getContextPath();
	//login.jsp 시작
	System.out.println("> join.jsp");
	// 세션 체크
	/*  if (session.getAttribute("myid") != null) {
	  System.out.println("session not null");
	  PrintWriter script = response.getWriter();
	  script.println("<script>");
	  script.println("alert('이미 로그인 중')");
	  script.println("history.back()");
	  script.println("</script>");
	}  */
	
	String userID = (String)session.getAttribute("myid");
	UserDAO dao = new UserDAO();
	UserDTO dto = dao.getUser(userID);
%>
<body>
	<!-- sub -->
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>My Page</p>
		</div>
	</div>
	<!-- sub -->
	
	<div class="container">
	    <!-- sub contents -->
	    <div class="margin_wrap">
	        <div id="join_text">
	            <p>내 정보 수정하기</p>
	        </div>
	    </div>
	    <!-- sub contents -->
	    <div class="join_container">
	        <p id="join_info">회원 정보</p>
	        <form method="post" action="${pageContext.request.contextPath}/users/mypageupdate.jsp">
	            <div class="joinName joinValue">
	                <label class="id_form_title"><b class="point">*</b>이름</label>
	                <input type="text" class="joinInput" id="name_input" value="<%=dto.getUserName()%>"
	                       name="userName" title="이름" maxlength="20">
	            </div>
	            <div class="joinID joinValue">
	                <label for="id_input" class="id_form_title"><b class="point">*</b>아이디</label>
	                <input type="text" class="joinInput" id="id_input" style="ime-mode: disabled;"
	                       value="<%=dto.getUserID()%>" name="userID" title="아이디" maxlength="20" readonly="readonly">
	                
	            </div>
	            <div class="joinPassword joinValue">
	                <label for="pw_input1" class="id_form_title"><b class="point">*</b>비밀번호</label>
	                <input type="password" class="joinInput" id="pw_input1" value="<%=dto.getUserPassword()%>"
	                       name=userPassword title="비밀번호" maxlength="40">
	            </div>
	
	            <div class="joinPhone joinValue">
	                <label class="id_form_title"><b class="point">*</b>전화번호</label>
	                <input type="tel" class="joinInput" id="hp_input"
	                       value="<%=dto.getUserPhone()%>"
	                       name="userPhone" title="전화번호" maxlength="11">
	            </div>
	            <div class="joinMail joinValue">
	                <label class="id_form_title"><b class="point">*</b>이메일</label>
	                <input type="email" class="joinInput" id="email_input" value="<%=dto.getUserMail()%>"
	                       name="userMail" title="이메일" maxlength="60">
	            </div>
	            <div class="joinAddr joinValue">
	                <label class="id_form_title"><b class="point">*</b>주소</label>
	                <input type="text" id="default_address" class="joinInput" value="<%=dto.getUserAddr()%>"
	                       name="userAddr" title="주소" maxlength="120" readonly>
	                <input type="button" onclick="addr_execDaumPostcode()" class="joinInput_addr"
	                       value="주소 검색">
	                <div id="kakao_map"
	                     style="width:300px;height:300px;margin-top:10px;display:none"></div>
	            </div>
	            <!-- <div class="joinGender joinValue">
	                <label class="id_form_title"><b class="point">*</b>성별</label>
	                <div class="gender_input">
	                    <input type="radio" name="userGender" value="M" title="성별"><label
	                        id="rd_gender">남자</label>
	                    <input type="radio" name="userGender" value="F" title="성별"><label
	                        id="rd_gender">여자</label>
	                </div>
	            </div> -->
	            <div class="joinDate joinValue">
	                <label class="id_form_title"><b class="point">*</b>생년월일</label>
	                <input type="date" class="joinInput" id="birth_input" value="<%=dto.getUserDate()%>"
	                       name="userDate">
	            </div>
	            <div class="join_bottom"></div>
	            <input type="submit" class="btn_join" value="수정하기">
	        </form>
	    </div>
	</div>
<!-- script 선언 -->
<script defer src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script defer src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a540d38cece314fa1d5f094089df4bd&libraries=services"></script>
<script defer src="js/join_script.js"></script>
</body>
</html>