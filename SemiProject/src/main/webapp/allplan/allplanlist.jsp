<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.PlanDto"%>
<%@page import="data.dao.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
	.tt{
	    overflow: hidden;
		display: list-item;
		float:left;
		width:250px;
		height:150px;
		border: 5px solid black;
		margin:50px 55px 30px;
	    background-position:center;
	}
	
</style>
<script type="text/javascript">
$(function () {
	$("select.selpln").change(function () {
	    var s=$(this).val();
	   	//alert(s);
		if(s=="rec"){
			$(".tb").hide();
			$("#t1").show();	
		  }else if(s=="chu"){
			 $(".tb").hide();
			 $("#t2").show();
		}else if(s=="jo"){
			 $(".tb").hide();
			 $("#t3").show();
		}
		});
	$(document).ready(function () {
		  selbox = $("select.selpln").attr("data-type");
		  $("select.selpln option[value='" + selbox + "']").attr("selected", "selected");
		});
	
	});

    
</script>
</head>
<%
	PlanDao dao=new PlanDao();
	//페이징
	int perPage=9;//한페이지에 보여질 글의 개수
	int totalCount;//총 글의 수
	int totalPage;//총 페이지수
	int currentPage;//현재 페이지 번호
	int perBlock=3;//몇개의 페이지번호씩 표현할지
	int start;//각 페이지에서 불러올 db의 시작번호
	int startPage;//각 블럭에 표시할 시작페이지
	int endPage;//각 블럭에 표시할 마지막페이지
	
	//총 갯수
	totalCount=dao.getTotalCount();
	//현재 페이지 번호 읽기(단 null일 경우는 1페이지로 설정)
	if(request.getParameter("currentPage")==null)
	  currentPage=1;
	else
	  currentPage=Integer.parseInt(request.getParameter("currentPage"));
	//총 페이지 갯수 구하기
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	//각 블럭 시작페이지
	startPage=(currentPage-1)/perBlock*perBlock+1;
	//끝 페이지
	endPage=startPage+perBlock-1;
	if(endPage>totalPage)
	  endPage=totalPage;
	//각 페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage;
	//각 페이지에서 필요한 게시글 가져오기
	
	//시간순 나열
	List<PlanDto> list=dao.getPlan(start, perPage);
	//추천순 나열
	List<PlanDto> list2=dao.getPlan2(start, perPage);
	//좋아요순 나열
	List<PlanDto> list3=dao.getPlan3(start, perPage);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	//현재 페이지의 list가 더이상 없을경우 이전페이지로 이동
	if(list.size()==0 && totalCount>0)
	{%>
	  <script type="text/javascript">
	  	location.href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=currentPage-1%>";
	  </script>
	<%}
	//각 페이지에 출력할 시작번호
	int no=totalCount-(currentPage-1)*perPage;
%>

<body>
<!-- 제목 & 이미지 삽입 -->
<div style="height:200px; border: 10px solid black; margin-top: 70px; font-size: 20pt;" align="center" >
<br>이미지 삽입<br>All 플랜</div>

<!-- 셀렉트 박스 -->
<select name="sel" class="selpln" style="margin-top: 80px; width:70px; height:50px; margin-left: 1200px;">
	<option value="rec">최신순</option>
	<option value="jo">좋아요순</option>
	<option value="chu">추천순</option>
</select>


<!-- 모든계획 나열표 -->
<!-- 시간순 나열 -->
<div id="t1" class="tb"
style="width:1250px; height:740px; border: 10px solid black; margin-top: 80px;margin-left: 200px; max-width: 1100px;">
	<table>
	  <tr >
			<% 
			for(PlanDto dto:list)
			{	
			%>
			<td class="tt">
			번호.<%=no--%>번<br>작성자:<%=dto.getName() %><br>내용:<%=dto.getContent() %><br>
			추천:<%=dto.getChu() %>  좋아요:<%=dto.getJo() %><br>작성일<%=sdf.format(dto.getWriteday()) %>
			</td>
		   <%
	       }
	       %>
	  </tr>	             
	</table>
</div>

<!-- 추천순 나열 -->
<div id="t2" class="tb"
style="display:none;  width:1100px; height:740px; border: 10px solid black; margin-top: 80px;margin-left: 200px; max-width: 1100px;">
	<table>
	  <tr >
			<% 
			for(PlanDto dto:list2)
			{	
			%>
			<td class="tt">
			번호.<%=dto.getNum()%>번<br>작성자:<%=dto.getName() %><br>내용:<%=dto.getContent() %><br>
			추천:<%=dto.getChu() %>  좋아요:<%=dto.getJo() %><br>작성일<%=sdf.format(dto.getWriteday()) %>
			</td>
		   <%
	       }
	       %>
	  </tr>	             
	</table>
</div>

<!-- 좋아요순 나열 -->
<div id="t3" class="tb"
style="display:none;  width:1100px; height:740px; border: 10px solid black; margin-top: 80px;margin-left: 200px; max-width: 1100px;">
	<table>
	  <tr >
			<% 
			for(PlanDto dto:list3)
			{	
			%>
			<td class="tt">
			번호.<%=dto.getNum()%>번<br>작성자:<%=dto.getName() %><br>내용:<%=dto.getContent() %><br>
			추천:<%=dto.getChu() %>  좋아요:<%=dto.getJo() %><br>작성일<%=sdf.format(dto.getWriteday()) %>
			</td>
		   <%
	       }
	       %>
	  </tr>	             
	</table>
</div>
<!-- 페이징 -->
<div style="margin-left:340px; width:800px; text-align: center;">
	<ul class="pagination">
	<%
		//이전
		if(startPage>1)
		{%>
		  <li>
		  	<a href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=startPage-1 %>">이전</a>
		  </li>
		<%}
	%>
	<%
		for(int pp=startPage;pp<=endPage;pp++)
		{
		  if(pp==currentPage)//현재페이지일때 활성
		  {%>
		    <li class="active">
		    	<a href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
		    </li>
		  <%}else{%>
		    <li>	
		      	<a href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=pp %>"><%=pp %></a>
		    </li>
		  <%}
		}
		//다음
		if(endPage<totalPage)
		{%>
		  <li>
		  	<a href="index.jsp?main=allplan/allplanlist.jsp?currentPage=<%=endPage+1 %>">다음</a>
		  </li>
		<%}
		
	%>
	</ul>		
</div>
<script type="text/javascript">
/*var selectedp = [[${selectedp}]]; 
if(selectedp == rec){
    $('#rec').attr('selected','selected');
} else if(selectedp == jo){
    $('#jo').attr('selected','selected');
} else{
    $('#chu').attr('selected','selected');
}
*/
</script>
</body>
</html>