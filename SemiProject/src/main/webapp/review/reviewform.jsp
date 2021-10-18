<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%
	//프로젝트의 경로
	String root=request.getContextPath();
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
<style type="text/css">
.notice_text_1{
	width: 120px;
}
#btn1{
	width: 200px;
	height: 50px;
	font-size: 20px;
	border: 1px solid #000;
	background-color: black;
	color: white;
	border-radius: 100px;
}
#btn2{
	width: 200px;
	height: 50px;
	font-size: 20px;
	border: 1px solid #000;
	background-color: white;
	color: black;
	border-radius: 100px;
}
</style>
</head>
<body>
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Review</p>
		</div>
	</div>
<div class="container">
<p id="all_plan_list_title">당신만의 여행 일정을 기록해보세요!</p>
<form action="review/reviewaction.jsp" method="post" enctype="multipart/form-data">
	<table class="notice_form_table" style="width:1200px;">
		<tr>
			<td class="notice_text_1">제목</td>
			<td class="notice_text_2">
				<input type="text" name="subject"
					required="required" placeholder="제목을 입력해주세요.">
			</td>
		</tr>
		<tr>
			<td class="notice_text_1">내용</td>
			<td class="notice_text_2">
				<textarea name="content" id="content" required="required"
				style="display:none; width:100%; height:400px;"></textarea>		
			
			</td>
		</tr>
		<tr>
			<td class="notice_text_1">썸네일</td>
			<td class="notice_text_2">
				<input type="file" name="thumbnail" id="thumbnail"
					required="required" onchange="readUrl(this)">
			</td>
		</tr>
	</table>
	<button type="button" id="btn1" class="btn1_notice_success"
		onclick="location.href='index.jsp?main=review/reviewlist.jsp'">취소</button>
	<button type="button" id="btn2" class="btn1_notice_success"
		onclick="submitContents(this)">등록하기</button>  
</form>
</div>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/imagesave/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>
</body>
</html>