<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

<body>
<div class="container">
    <!-- sub -->
    <div class="margin_wrap">
        <div id="join_text">
            <p>GOING 온라인 회원가입</p>
        </div>
    </div>
    <!-- sub -->

    <div class="join_container">
        <p id="join_info">회원 정보</p>
        <form method="post" action="./join_action.jsp">
            <div class="joinName joinValue">
                <label class="id_form_title"><b class="point">*</b>이름</label>
                <input type="text" class="joinInput" id="name_input" placeholder="이름을 입력해주세요."
                       name="userName" title="이름" maxlength="20">
            </div>
            <div class="joinID joinValue">
                <label for="id_input" class="id_form_title"><b class="point">*</b>아이디</label>
                <input type="text" class="joinInput" id="id_input" style="ime-mode: disabled;"
                       placeholder="아이디를 입력해주세요" name="userID" title="아이디" maxlength="20">
                <div><span class="errorMsg_box" id="id_msg" style="display: none"
                           aria-live="assertive"></span></div>
            </div>
            <div class="joinPassword joinValue">
                <label for="pw_input1" class="id_form_title"><b class="point">*</b>비밀번호</label>
                <input type="password" class="joinInput" id="pw_input1" placeholder="비밀번호를 입력해주세요."
                       name=userPassword title="비밀번호" maxlength="40">
                <input type="password" class="joinInput" id="pw_input2" placeholder="비밀번호를 확인해주세요."
                       title="비밀번호확인" maxlength="40">
            </div>

            <div class="joinPhone joinValue">
                <label class="id_form_title"><b class="point">*</b>전화번호</label>
                <input type="tel" class="joinInput" id="hp_input"
                       placeholder="휴대폰 번호를 '-' 없이 입력해주세요."
                       name="userPhone" title="전화번호" maxlength="11">
            </div>
            <div class="joinMail joinValue">
                <label class="id_form_title"><b class="point">*</b>이메일</label>
                <input type="email" class="joinInput" id="email_input" placeholder="이메일 주소를 입력해주세요."
                       name="userMail" title="이메일" maxlength="60">
            </div>
            <div class="joinAddr joinValue">
                <label class="id_form_title"><b class="point">*</b>주소</label>
                <input type="text" id="default_address" class="joinInput" placeholder="주소를 입력해주세요."
                       name="userAddr" title="주소" maxlength="120" readonly>
                <input type="button" onclick="addr_execDaumPostcode()" class="joinInput_addr"
                       value="주소 검색">
                <div id="kakao_map"
                     style="width:300px;height:300px;margin-top:10px;display:none"></div>
            </div>
            <div class="joinGender joinValue">
                <label class="id_form_title"><b class="point">*</b>성별</label>
                <div class="gender_input">
                    <input type="radio" name="userGender" value="M" title="성별"><label
                        id="rd_gender">남자</label>
                    <input type="radio" name="userGender" value="F" title="성별"><label
                        id="rd_gender">여자</label>
                </div>
            </div>
            <div class="joinDate joinValue">
                <label class="id_form_title"><b class="point">*</b>생년월일</label>
                <input type="date" class="joinInput" id="birth_input" placeholder="생년월일"
                       name="userDate">
            </div>
            <div class="join_bottom"></div>
            <input type="submit" class="btn_join" value="회원가입">
        </form>
    </div>
</div>
<!-- script 선언 -->
<script defer src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script>
<script defer src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script defer src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5a540d38cece314fa1d5f094089df4bd&libraries=services"></script>
<script defer src="../js/join_script.js"></script>
</body>
</html>