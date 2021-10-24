const toggleBtn = document.querySelector('.navbar_toggle');
const menu = document.querySelector('.navbar_menu');
const users = document.querySelector('.navbar_user');

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    users.classList.toggle('active');
});


/* 상단 메뉴바 스크롤시 이벤트! */
$(document).ready(function () {
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        if (scroll > 1) {
            $(".navbar").css("background", "#ff7b27");
            $(".navbar").css("opacity", "1");
        } else {
            $(".navbar").css("background", "");
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