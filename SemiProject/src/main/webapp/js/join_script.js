// 카카오 지도를 통한 우편번호 검색 https://postcode.map.daum.net/guide
function addr_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      let addr = ''; // 주소 변수
      let extraAddr = ''; // 참고항목 변수

      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else { // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }

      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
      if (data.userSelectedType === 'R') {
        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
          extraAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if (data.buildingName !== '' && data.apartment === 'Y') {
          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
              : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if (extraAddr !== '') {
          extraAddr = ' (' + extraAddr + ')';
        }
        // 조합된 참고항목을 해당 필드에 넣는다.
        document.getElementById("default_address").value = extraAddr;

      } else {
        document.getElementById("default_address").value = '';
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      // document.getElementById('sample6_postcode').value = data.zonecode;
      document.getElementById("default_address").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      // document.getElementById("sample6_detailAddress").focus();
    }
  }).open();
}
//
// // 카카오 로그인
// // Kakao.init('5a540d38cece314fa1d5f094089df4bd');
//
// function loginKakao() {
//   //1. 로그인 시도
//   Kakao.Auth.login({
//     success: function (authObj) {
//       //2. 로그인 성공시, API 호출
//       Kakao.API.request({
//         url: '/v2/user/me',
//         success: function (response) {
//           console.log(response);
//           let id = response.id;
//           scope : 'account_email';
//           console.log("kakao login success")
//           location.href = "http://13.209.85.24/going/users/login_action.jsp";
//         }
//       })
//       console.log(authObj);
//       let token = authObj.access_token;
//     },
//     fail: function (err) {
//       alert(JSON.stringify(err));
//     }
//   });
// }

// #id_input validation check
$(".joinValue").blur(function () {
  checkID("first");
})

// show Error Message
let msgTarget ="";
let msg = "";
function showErrorMsg(msgTarget, msg) {
  document.getElementById(msgTarget).innerHTML = msg;
  document.getElementById(msgTarget).style.color = "red";
  document.getElementById(msgTarget).style.display = "block";
}

// #id_input validation check
function checkID(event) {
  let id = $("#id_input").val();
  // let idMsg = $("id_msg");
  let oInput = $("#id_input");
  let isValidID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;

  if (id == "") {
    showErrorMsg("id_msg", "ID를 입력하세요");
  } else if (!isValidID.test(id)) {
    showErrorMsg("id_msg", "영문 소문자, 숫자, 특수기호(_, -)만 입력하세요");
  } else {
    document.getElementById("id_msg").innerHTML = "";
  }

  // TODO 미구현
  $.ajax({
    type: "GET",
    url: "/users/joinAjax?m=checkID&id=" + id,
    success: function (data) {
      let result = data.substr(4);

      if (result == "Y") {
        if (event == "valid") {
          showSuccessMsg(idMsg)
        } else {
          hideMsg(idMsg);
        }
      }
    }
  });
  return true;
}// end:id validation

  $(function () {
  //비밀번호 유효성검사
  $("#pw_input1").on("input", function checkPw() {
    const regex = /^[A-Za-z\d]{8,20}$/;
    let result = regex.exec($("#pw").val())

    if (result != null) {
      $(".joinPassword.errorMsg_box").html("");
      return true;
    } else {
      $(".joinPassword.errorMsg_box").html("대소문자,숫자 8-20자리");
      $(".joinPassword.errorMsg_box").css("color", "red");
      return false;
    }
    return true;
  });

  //비밀번호 확인
  $("#pw_input2").on("keyup", function () {
    if ($("#pw_input1").val() === $("#pw_input2").val()) {
      $("#pw_msg").css("color", "green");
      $("#pw_msg").html("비밀번호가 일치합니다");
      return true;
    } else {
      showErrorMsg('pw_msg', "비밀번호가 일치하지 않습니다");
      return false;
    }
    return true;
  })

  //이름 유효성검사
  $("#name_input").on("input", function () {
    const regex = /[가-힣a-zA-Z]{2,}/;
    let result = regex.exec($("#name").val());

    if (result != null) {
      $(".joinName.errorMsg_box").html("");
      return true;
    } else {
      showErrorMsg("name_msg", "올바른 형식이 아닙니다");
      return false;
    }
return true;
  })

  //전화번호 유효성검사
  $("#hp_input").on("input", function () {
    const regex = /^01\d\d{3,4}\d{4}$/;
    let result = regex.exec($("#hp_input").val());

    if (result != null) {
      $(".joinPhone.errorMsg_box").html("");
      return true;
    } else {
      showErrorMsg("hp_msg", "올바른 번호가 아닙니다");
      return false;
    }
    return true;
  })

  //email유효성 검사
  $("#email_input").on("input", function () {
    const regex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    let result = regex.exec($("#email_input").val());

    if (result != null) {
      $(".joinMail.errorMsg_box").html("");
      return true;
    } else {
      showErrorMsg("email_msg", "올바른 이메일이 아닙니다");
      return false;
    }
    return true;
  })
  //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행
  $(".btn_join").on("click", function () {
    var id = $("#id_input").val();
    var pw = $("#pw_input1").val();
    var name = $("#name_input").val();
    var phone = $("#hp_input").val();
    var email = $("#email_input").val();

    var idregex = /^[a-z][a-z\d]{4,11}$/;
    var pwregex = /^[A-Za-z\d]{8,12}$/;
    var nameregex = /[가-힣]{2,}/;
    var phoneregex = /^01\d\d{3,4}\d{4}$/;
    var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;

    var idre = idregex.exec(id);
    if (idre == null) {
      alert("아이디양식을 다시 확인해주세요");
      return;
    }
    var pwre = pwregex.exec(pw);
    if (pwre == null) {
      alert("비밀번호양식을 다시 확인해주세요");
      retrun;
    }
    var namere = nameregex.exec(name);
    if (namere == null) {
      alert("이름양식을 다시 확인해주세요");
      retrun;
    }
    var phonere = phoneregex.exec(phone);
    if (phonere == null) {
      alert("핸드폰번호양식을 다시 확인해주세요");
      retrun;
    }
    var emailre = emailregex.exec(email);
    if (emailre == null) {
      alert("이메일양식을 다시 확인해주세요");
      retrun;
    }
    return false;
  })
  })
