<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.PlanDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.PlanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.tt{
	
	    overflow: hidden;
		display: list-item;
		float:left;
		width:250px;
		height:150px;
		border: 5px solid black;
		margin:50px 50px 30px;
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
	});
</script>
</head>
<%
	PlanDao dao=new PlanDao();
	//시간순 나열
	ArrayList<PlanDto> list=dao.getAllPlans();
	//추천순 나열
	ArrayList<PlanDto> list2=dao.getAllPlans2();
	//좋아요순 나열
	ArrayList<PlanDto> list3=dao.getAllPlans3();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	
	//페이징
	int count = dao.getTotalCount();  //전체글갯수
	String tempStart = request.getParameter("page");
	//현재 페이지를 받아옴
	int startPage=0; //limit의 시작값 첫 limit 0,10
	int onePageCnt=9;//한페이지에 출력할 행의 갯수
	count=(int)Math.ceil((double)count/(double)onePageCnt);
	
	if(tempStart!=null){
	  startPage=(Integer.parseInt(tempStart)-1)*onePageCnt;
	}
	
	List<PlanDto> plan=dao.getPlan(startPage, onePageCnt);
%>

<body>
<!-- 제목 & 이미지 삽입 -->
<div style="height:200px; border: 10px solid black; margin-top: 70px; font-size: 20pt;" align="center" >
<br><br><br>이미지 삽입<br><br><br>All 플랜</div>

<!-- 셀렉트 박스 -->
<select class="selpln" style="margin-top: 80px; width:70px; height:50px; margin-left: 1200px;">
	<option value="jo">좋아요순</option>
	<option value="chu">추천순</option>
	<option value="rec" selected="selected">최신순</option>
</select>

<!-- 모든계획 나열표 -->
<!-- 시간순 나열 -->
<div id="t1" class="tb"
style="width:1250px; height:1000px; border: 10px solid black; margin-top: 80px;margin-left: 200px; max-width: 1100px;">
	<table>
	  <tr >
			<% 
			for(int row=0;row<list.size();row++)
			{
				PlanDto dto=list.get(row);
	   			
			%>
			
			<td class="tt">
			번호.<%=list.size()-row%>번<br>작성자:<%=dto.getName() %><br>내용:<%=dto.getContent() %><br>
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
style="display:none;  width:1100px; height:900px; border: 10px solid black; margin-top: 80px;margin-left: 200px; max-width: 1100px;">
	<table>
	  <tr >
			<% 
			for(int row=0;row<list2.size();row++)
			{
				PlanDto dto=list2.get(row);
	   			
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
style="display:none;  width:1100px; height:900px; border: 10px solid black; margin-top: 80px;margin-left: 200px; max-width: 1100px;">
	<table>
	  <tr >
			<% 
			for(int row=0;row<list3.size();row++)
			{
				PlanDto dto=list3.get(row);
	   			
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

</body>
</html>