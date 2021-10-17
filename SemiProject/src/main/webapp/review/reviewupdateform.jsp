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
.btncancel,.btnregister{
	width: 100px;
	height: 30px;
	margin-right: 20px;
	outline: none;
	cursor: pointer;
	font-size: 15px;
	border: 1px solid #000;
	background-color: black;
	color: white;
	border-radius: 100px;
}
</style>
<%
	//프로젝트의 경로
	String root=request.getContextPath();
	//num읽기
	String num=request.getParameter("num");
	//페이지번호 읽기
	String currentPage=request.getParameter("currentPage");
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
<div id="main_wrap" style="height: 320px;">
		<div id="main_text" style="top: 180px;">
			<p>Review 수정</p>
		</div>
</div>
<div style="width: 1250px; margin-top: 80px; margin-left: 250px; max-width: 1100px;">
<form action="review/reviewupdateaction.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
	<table style="width: 1000px;">
		<tr>
			<th bgcolor="black" width="100" height="40" style="color: white; text-align: center;">제  목</th>
			<td>
				<input type="text" name="subject"
					required="required" style="width: 890px; height: 30px;" value="<%=dto.getSubject()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 500px;display: none;"><%=dto.getContent()%></textarea>		
			
			</td>
		</tr>
		<tr>
			<th bgcolor="black" width="100" height="40" style="color: white; text-align: center;">썸네일</th>
			<td style="border: 1px solid gray;">
				<input type="file" name="thumbnail" id="thumbnail"
					required="required" onchange="readUrl(this)" value="<%=dto.getThumbnail()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="30">
				<button type="button" class="btncancel"
					style="width: 120px; margin-top: 10px;"
					onclick="location.href='index.jsp?main=review/reviewlist.jsp'">취소</button>
				<button type="button" class="btnregister"
					style="width: 120px; margin-top: 10px;"
					onclick="submitContents(this)">등록하기</button>
			</td>
		</tr>
		
	</table>   
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