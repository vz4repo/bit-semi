<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.a{border:1px solid black}

</style>
  <script language="javascript">
  function showPopup() { window.open("NewPlanMain.jsp?NewPlanmain=NewPlanMap.jsp'", "a", "width=400, height=300, left=100, top=50"); }
  </script>
</head>
<body>

<table class="a">
   <tr>
      <td>
         <div>날짜</div>
         <button onclick="showPopup();">계획 설계</button>
      </td>
   </tr>
</table>
</body>
</html>