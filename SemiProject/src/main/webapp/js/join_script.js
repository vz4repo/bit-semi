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

// id validation
function validation() {
  var hobbyCheck = false;
  var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
  var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
  var getName = RegExp(/^[가-힣]+$/);

  //아이디 공백 확인
  if ($("#tbID").val() == "") {
    alert("아이디 입력바람");
    $("#tbID").focus();
    return false;
  }

  //이름의 유효성 검사
  if (!getCheck.test($("#tbID").val())) {
    alert("형식에 맞게 입력해주세요");
    $("#tbID").val("");
    $("#tbID").focus();
    return false;
  }

  //비밀번호
  if (!getCheck.test($("#tbPwd").val())) {
    alert("형식에 맞춰서 PW를 입력해줘용");
    $("#tbPwd").val("");
    $("#tbPwd").focus();
    return false;
  }

  //아이디랑 비밀번호랑 같은지
  if ($("#tbID").val() == ($("#tbPwd").val())) {
    alert("비밀번호가 ID와 똑같으면 안!대!");
    $("#tbPwd").val("");
    $("#tbPwd").focus();
  }

  //비밀번호 똑같은지
  if ($("#tbPwd").val() != ($("#cpass").val())) {
    alert("비밀번호가 틀렸네용.");
    $("#tbPwd").val("");
    $("#cpass").val("");
    $("#tbPwd").focus();
    return false;
  }

  //이메일 공백 확인
  if ($("#mail").val() == "") {
    alert("이메일을 입력해주세요");
    $("#mail").focus();
    return false;
  }

  //이메일 유효성 검사
  if (!getMail.test($("#mail").val())) {
    alert("이메일형식에 맞게 입력해주세요")
    $("#mail").val("");
    $("#mail").focus();
    return false;
  }

  //이름 유효성
  if (!getName.test($("#name").val())) {
    alert("이름 똑띠 쓰세용");
    $("#name").val("");
    $("#name").focus();
    return false;
  }

  //주민번호
  if (($("#id_num").val() == "") || ($("#id_num_back").val() == "")) {
    alert("주민등록번호를 입력해주세요");
    $("#id_num").focus();
    return false;
  }

  if (check_jumin() == false) {
    return false;
  }

  //관심분야
  for (var i = 0; i < $('[name="hobby[]"]').length; i++) {
    if ($('input:checkbox[name="hobby[]"]').eq(i).is(":checked") == true) {
      hobbyCheck = true;
      break;
    }
  }

  if (!hobbyCheck) {
    alert("하나이상 관심분야를 체크해 주세요");
    return false;
  }
  return true;
}

// #id_input validation check
$("#id_input").blur(function () {
  checkID("first");
})

// show Error Message
function showErrorMsg(msgTarget, msg) {
  document.getElementById(msgTarget).textContent = msg;
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
  }
  if (!isValidID.test(id)) {
    showErrorMsg("id_msg", "영문 소문자, 숫자, 특수기호(_, -)만 입력하세요");
  }

  // 미구현
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

// #password_input validation check