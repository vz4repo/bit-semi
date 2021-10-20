<%@page import="java.util.List" %>
<%@page import="comment.commentDTO" %>
<%@page import="comment.commentDAO" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="plan.PlanDto" %>
<%@page import="plan.PlanDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=l7xx27cfab8a671c49dea1ee85d2351dfef7"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <%
        String root = request.getContextPath();
        //로그인한 상태인지 확인
        String loginok = "";
        String myid = "";
        if (session.getAttribute("loginok") != null) {
            loginok = session.getAttribute("loginok").toString();
            myid = (String) session.getAttribute("myid");
        }
    %>
 
    <script>
    
      /* 수정하기 위한 팝업! */
      function showPopup(hasFilter, idx) {
        const popup = document.querySelector('#popup_update');
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
        const popup = document.querySelector('#popup_update');
        popup.classList.add('hide');
      }
      
      //댓글 출력하는 함수(현재 사용안함..)
      function list() {
        var num = $("#num").val();
        var myid = $("#myid").val();
        $.ajax({
          type: "get",
          dataType: "xml",
          url: "allplan/commentxml.jsp",
          data: {"num": num},
          success: function (data) {
            var su = $(data).find("answer").length;
            $("b.su").text(su);
            var s = "";
            s += "<ul class='com_list_all'>";
            $(data).find("answer").each(function (i, element) {
              var n = $(this);
              var idx = n.attr("idx");
              var userid = n.find("userid").text();
              var contents = n.find("contents").text();
              var writeday = n.find("writeday").text();
              s += "<li class='v_comment_1'>";
              s += "<span class='com_list_1'>";
              s += "<p class='com_list_1_name'>" + userid + "</p>";
              s += "<p class='com_list_1_contents'>" + contents + "</p>";
              s += "<p class='com_list_1_day'>" + writeday + "</p>";
              <%-- var login="<%=loginok%>";
              console.log(login);
              if(login!="null"){
                  s+="<button type='button' id='v_com_btn_1'>댓글</button>";
              } --%>
              var login = "<%=loginok%>";
              var logid = $("#myid").val();
              console.log("1" + login + "," + myid);
              if (login == "true" && logid == myid) {
                s += "<button type='button' class='aup v_com_btn_1' onclick='showPopup(false)' idx='" + idx + "'>수정</button>";
                s += "<button type='button' class='adel v_com_btn_1' idx='" + idx + "'>삭제</button>";
              }
              s += "</span>";
              s += "</li>";
              /* s+="<li class='update_commtent_form_all'>";
              s+="<table class='com_all'>";
              s+="<tr>";
              s+="<td>";
              s+="<textarea id='com_box_2' class='update_comment_form' name='content' required='required' placeholder='수정할 댓글을 입력해주세요.'></textarea>";
              s+="<button type='submit' id='v_com_check_2' class='update_comment_form'>확인</button>";
              s+="</td>";
              s+="</tr>";
              s+="</table>";
              s+="</li>"; */
              s += "</div>";
            });
            s += "</ul>";
            $(".v_comment_list").html(s);
          }
        });
      }
      $(function () {
        /* $("li.update_commtent_form_all").hide(); */ //수정폼 전부 숨기기!
       // list(); //처음부터 댓글 리스트 출력!!
        
        //댓글추가 이벤트
        $("#v_com_check").click(function () {
          <% if (myid == null) { %>
          alert("login first");
          location.href = 'index.jsp?main=users/login.jsp';
          <%} else {%>
          var num = $("#num").val();
          var myid = $("#myid").val();
          var acontent = $("#com_box").val();
          if (acontent.length == 0) {
            alert("댓글내용을 입력후 확인을 눌러주세요");
            return;
          }
          $.ajax({
            type: "post",
            dataType: "html",
            url: "allplan/commentaction.jsp",
            data: {"num": num, "myid": myid, "content": acontent},
            success: function (d) {
              alert("댓글이 등록되었습니다!");
              //목록 다시 출력
              //list();
              location.reload();
              //입력값 지우기
              $("#com_box").val("");
            }
          });
          <% } %>
        });
       
        /* 댓글 폼 안에 이벤트! */
        $("#com_box").click(function () {
          $(this).text("");
        });
        $("#com_box").mouseout(function () {
          $(this).text("댓글을 입력해주세요.");
        });
        
        /* 댓글 삭제 버튼 클릭시 이벤트! */
        $(document).on("click", ".adel", function () {
          var idx = $(this).attr("idx");
          console.log("del-idx" + idx); //삭제 아이콘 클릭하면 번호 나오는지 확인 완료!
          $.ajax({
            type: "get",
            dataType: "html",
            url: "allplan/comment_delaction.jsp",
            data: {"idx": idx},
            success: function () {
              alert("댓글이 삭제되었습니다!");
              //새로고침
              location.reload();
            }
          });
        });
        
        $("#com_box").click(function () {
          $(this).text("");
        });
        
        /* 댓글 팝업 수정 버튼 클릭시 이벤트! */
        $(".btn_submit_1").click(function () {
          let idx = $('#popup_update').attr("idx");
          let content = $('#com_box_2').val();
          $.ajax({
            type: "get",
            dataType: "html",
            url: "allplan/comment_update.jsp",
            data: {"idx": idx, "content": content},
            success: function () {
              alert("댓글이 수정되었습니다!");
              //새로고침
              location.reload();
            }
          });
        });
      });
    </script>
</head>
<%
    /* 게시글 출력 관련! */
    String num = request.getParameter("num");
    String currentPage = request.getParameter("currentPage");
    if (currentPage == null) {
        currentPage = "1";
    }
    //key는 목록에서만 값이 넘어오고 그 외에는 null rkqt
    String key = request.getParameter("key");
    PlanDao dao = new PlanDao();
    //목록에서 올 경우에만 조회수 1증가함
    if (key != null) {
        dao.updateReadcount(num);
    }
    //num에 해당하는 dto 얻기
    PlanDto dto = dao.getData(num);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    /* ------------------------------------------------- */
%>
<body>
<!-- sub -->
<div id="sub_image" class="margin_wrap">
    <div id="sub_text">
        <p>All Plan</p>
    </div>
</div>
<!-- sub -->

<!-- view -->
<div class="container">
    <!-- 상단 -->
    <div class="view_top">
        <p class="v_title"><%=dto.getPlantitle()%>
        </p>
        <p class="v_day"><%=dto.getPlanDate()%>
        </p>
        <div class="v_func">
            <p>Writer&nbsp;&nbsp;<%=dto.getUserId()%><span>|</span></p>
            <p>Date&nbsp;&nbsp;<%=sdf.format(dto.getWriteday())%>
            </p>
            <!-- 아래 찜하기 버튼 임시 보류 -->
            <!-- <span class="v_likes">찜하기</span> -->
        </div>
        <div class="v_func_2">
            <p>View</p>
            <p><%=dto.getReadCNT()%>
            </p>
        </div>
        <div class="v_func_2_chu">
			<p>Like</p>
			<p class="goodsu"><%=dto.getGood()%></p>
		</div>
    </div>
    <!-- 상단 -->

    <!-- 컨텐츠 -->
    <div class="v_contents">
        <!-- <div id="map_div"></div> -->
        <table class="planinfo">
            <tr>
                <th>일자</th>
                <th>시간</th>
                <th>여행지</th>
                <th>비고</th>
            </tr>
            <tr>
                <td>2021.10.13</td>
                <td>10:00~11:00</td>
                <td>우도 선착장</td>
                <td>우도 선착장에 가서<br>배 타고 우도로 들어가기!</td>
            </tr>
            <tr>
                <td>2021.10.13</td>
                <td>11:00~12:00</td>
                <td>섬소나이</td>
                <td>섬소나이 가서 우도톳면 먹어보기!</td>
            </tr>
            <tr>
                <td>2021.10.13</td>
                <td>12:00~15:00</td>
                <td>우도 전기차</td>
                <td>우도 전기차 빌려서 우도섬 한 바퀴 돌기!</td>
            </tr>
            <tr>
                <td>2021.10.13</td>
                <td>15:00~16:30</td>
                <td>블랑로쉐</td>
                <td>카페가서 땅콩아이스크림 먹기!</td>
            </tr>
            <tr>
                <td>2021.10.13</td>
                <td>16:30~17:00</td>
                <td>우도 선착장</td>
                <td>우도에서 제주도로 넘어가기!</td>
            </tr>
        </table>
    </div>
    <!-- 컨텐츠 -->

    <!-- 별점, 목록 버튼 -->
    <div class="btn">
        <!-- 아래 별점 일단 보류! -->
        <div class="v_btn">
            <button type="button" class="good" num="<%=dto.getNum()%>">추천하기</button>
        </div>
        
        <script type="text/javascript">
	      //추천 클릭시 이벤트!
	     $("button.good").click(function() {
	    	var num = $("button.good").attr("num");
	    	var tag = $("p.goodsu");
	    	//console.log(num); //확인 완료!
	    	$.ajax({
	    		type: "get",
	    		dataType: "json",
	    		url: "allplan/chuaction.jsp",
	    		data: {"num":num},
	    		success: function(data) {
	    			alert("추천! "); //+data.good 확인할때 개수 찍어보면됨!
	    			tag.text(data.good);
	    		}
	    	});
	    });
        </script>
        
        <div class="v_btn">
            <button type="button"
                    onclick="location.href='index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=currentPage%>'">목록
            </button>
        </div>
    </div>
    <!-- 별점, 목록 버튼 -->

    <div class="comment_all_refresh">
        <!-- 댓글폼 -->
        <div class="v_comment" id="test">
            <%-- <%System.out.println(dto.getNum());%> --%>
            <input type="hidden" name="num" id="num" value="<%=num%>">
            <input type="hidden" name="myid" id="myid" value="<%=myid%>">
            <input type="hidden" name="currentPage" value="<%=currentPage%>">
            <%
                if (loginok == null || loginok == "false") { //로그인중일때만 입력폼이 보이도록 함!
            %>
            <p class="loginok_comment_text">로그인 후 댓글을 입력하실 수 있습니다.</p>
            <%} else { %>
            <table class="com_all">
                <tr>
                    <td>
                        <textarea id="com_box" name="content" required="required" placeholder="댓글을 입력해주세요."></textarea>
                    </td>
                    <td>
                        <button type="button" id="v_com_check">확인</button>
                    </td>
                </tr>
            </table>
            <% }%>

            <%
                // TODO : 댓글 기능 (임시!)
                commentDAO test_dao = new commentDAO();
                List<commentDTO> list = test_dao.getAllAnswer(request.getParameter("num"));
            %>
            <%-- <div class="comment-count">
                <h2> comments count <%=list.size()%>
                </h2>
            </div> --%>
            <div class="v_comment_list_num">
          	  <span class="v_comment_num">총 댓글<b class="su"><%=list.size()%></b></span>
       	 	</div>
            <ul>
                <% for (int i = 0; i < list.size(); i++) { %>

                <div class=" v_comment_list">
                	<ul class='com_list_all'>
	                    <li class='v_comment_1'>
	                    <span class='com_list_1'>
			              <p class='com_list_1_name'> <%=list.get(i).getUserId()%> </p>
			              <p class='com_list_1_contents comm_idx_<%=list.get(i).getIdx()%>'> <%=list.get(i).getContents()%></p>
			              <p class='com_list_1_day'> <%=list.get(i).getWriteday()%></p>
			                        <% if (myid != null && myid.equals(list.get(i).getUserId())) { %>
			              <button type='button' class='aup v_com_btn_1' id='btn_modify' idx='<%=list.get(i).getIdx()%>'
			                      onclick='showPopup(false, <%=list.get(i).getIdx()%>)'>수정</button>
			              <button type='button' class='adel v_com_btn_1' id='btn_del' idx='<%=list.get(i).getIdx()%>'>삭제</button>
			                        <%}%>
	                    </span>
	                    </li>
                    </ul>
                </div>
                <%}%>
            </ul>
        </div>
        <!-- 댓글폼 -->

		<!-- 아래 ajax list 출력 안하기 때문에 주석! -->
        <!-- 댓글 리스트 -->
        <!-- <div class="v_comment_list_num">
            <span class="v_comment_num">총 댓글<b class="su">0</b></span>
        </div> -->
        <!-- <div class="v_comment_list">
        </div> -->
        <!-- 댓글 리스트 -->
        
        <%
            String idx = request.getParameter("idx");
            System.out.println("idx? :" + idx);
            commentDAO cdao = new commentDAO();
            commentDTO cdto = cdao.getData(idx);
            System.out.println("idx?? : " + cdto.getContents());
        %>
        
        <!-- 수정 팝업 내용 -->
        <div id="popup_update" class="hide">
            <div class="content">
                <p class="cal_popup_1_title">수정하기</p>
                <textarea id="com_box_2" class="update_comment_form" name="content"
                          required="required">
						</textarea>
                <div class="cal_popup_1">
                    <button type="submit" class="btn_submit_1">수정</button>
                    <button onclick="closePopup()" class="btn_close_1">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--view -->
</body>
</html>