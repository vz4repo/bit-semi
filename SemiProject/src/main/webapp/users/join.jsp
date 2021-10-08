<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta 선언 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- link 선언 -->
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style_join.css">
<!-- script 선언 -->
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a540d38cece314fa1d5f094089df4bd&libraries=services"></script>
<script src="../js/join_script.js"></script>
<title>join.jsp</title>
</head>
<body>
  <!-- home,login,menu 임시 -->
  <header>
    <div class="header_container">
      <div class="logo_container">
        <a href="../index.jsp">HOME</a>
      </div>
      <div class="nav_container" id="nav_menu">
        <div class="login_container">
          <ul class="login">
            <li class="menu_login"><a class="menu_title"
              href="./login.jsp">로그인</a></li>
            <li class="menu_join"><a class="menu_title"
              href="./join.jsp">회원가입</a></li>
          </ul>
        </div>
      </div>
    </div>
  </header>
  <div class="join_container">
    <h2>회원 가입</h2>
    <form method="post" action="./join_Action.jsp">
      <h3>아이디</h3>
      <div class="joinID joinValue">
        <input type="text" class="joinInput" style="ime-mode: disabled;"
          placeholder="ID" name="userID" title="아이디" maxlength="20">
      </div>
      <h3>비밀번호</h3>
      <div class="joinPassword joinValue">
        <input type="password" class="joinInput" placeholder="PASSWORD"
          name="userPassword" title="비밀번호" maxlength="40">
      </div>
      <h3>이름</h3>
      <div class="joinName joinValue">
        <input type="text" class="joinInput" placeholder="NAME"
          name="userName" title="이름" maxlength="20">
      </div>
      <h3>전화번호</h3>
      <div class="joinPhone joinValue">
        <input type="tel" class="joinInput" placeholder="000-0000-0000"
          name="userPhone" title="전화번호" maxlength="11">
      </div>
      <h3>이메일</h3>
      <div class="joinMail joinValue">
        <input type="email" class="joinInput" placeholder="E-MAIL"
          name="userMail" title="이메일" maxlength="60">
      </div>
      <h3>주소</h3>
      <div class="joinAddr joinValue">
        <input type="text" id="default_address" class="joinInput" placeholder="Address"
          name="userAddr" title="주소" maxlength="120" readonly>
          <input type="button" onclick="addr_execDaumPostcode()" value="주소 검색">
          <div id="kakao_map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

      </div>
      <h3>성별</h3>
      <div class="joinGender joinValue">
        <input type="radio" name="userGender" value="M" title="성별">남자
        <input type="radio" name="userGender" value="F" title="성별">여자
      </div>
      <h3>생년월일</h3>
      <div class="joinDate joinValue">
        <input type="date" class="joinInput" placeholder="생년월일"
          name="userDate">
      </div>
      <input type="submit" class="btn_join" value="회원가입">
    </form>
  </div>
  <footer>
    <!-- require kang's commit -->
  </footer>
</body>
</html>
