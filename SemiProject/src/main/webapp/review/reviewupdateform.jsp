<%@page import="review.ReviewDto"%>
<%@page import="review.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
.notice_text_1{
	width: 120px;
}
.btn1_notice_success{
	text-align:center;
	border:1px solid black;
	width:150px; height:50px;
	background-color:black;
	color:white;
    font-size:17px;
    border-radius:100px;
    line-height:35px;
    display:inline-block;
    cursor:pointer;
    margin-top:50px;
}
.btn1_notice_back{
	text-align:center;
	border:1px solid black;
	width:150px;
	height:50px;
	background-color:white; 
    font-size:17px;
    border-radius:100px;
    line-height:35px;
    display:inline-block;
    cursor:pointer;
    margin-top:50px;
}
.btn_update{
	text-align:center;
}
.btn_update button:nth-child(1){
	margin-right:10px;
}
</style>
<%
	//프로젝트의 경로
	String root=request.getContextPath();
	//num읽기
	String num=request.getParameter("num");
	//페이지번호 읽기
	String currentPage=request.getParameter("currentPage");
	String key = request.getParameter("key");
	ReviewDao dao = new ReviewDao();
	ReviewDto dto = dao.getData(num);
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>
</head>
<body>
	<div id="sub_image" class="margin_wrap">
		<div id="sub_text">
			<p>Review</p>
		</div>
	</div>
<div class="container">
<p id="all_plan_list_title">당신만의 여행 일정을 기록해보세요!</p>
<form action="review/reviewupdateaction.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
	<table class="notice_form_table" style="width:1200px;">
		<tr>
			<td class="notice_text_1">제  목</td>
			<td class="notice_text_2">
				<input type="text" name="subject"
					required="required" value="<%=dto.getSubject()%>">
			</td>
		</tr>
		<tr>
			<td class="notice_text_1">내용</td>
			<td class="notice_text_2">
				<textarea name="content" id="content" required="required"			
				style="display:none; width:100%; height:400px;"><%=dto.getContent()%></textarea>		
			
			</td>
		</tr>
		<tr>
			<td class="notice_text_1">썸네일</td>
			<td class="notice_text_2">
				<input type="file" name="thumbnail" id="thumbnail"
					onchange="readUrl(this)" required="required">
			</td>
		</tr>
	</table>
	<div class="btn_update">
	<button type="button" id="btn1" class="btn1_notice_back"
		onclick="location.href='index.jsp?main=review/reviewlist.jsp'">취소</button>
	<button type="button" id="btn2" class="btn1_notice_success"
		onclick="submitContents(this)">수정하기</button>
	</div> 
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