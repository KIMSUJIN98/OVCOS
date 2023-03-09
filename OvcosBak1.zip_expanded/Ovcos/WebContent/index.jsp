<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="views/common/navForIndex.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVCOS - 새로운 모험의 시작</title>
<link rel="stylesheet" href="resources/css/navStyle.css">
<link rel="stylesheet" href="resources/css/start.css">
<script src="resources/js/jquery-3.6.3.min.js"></script>
</head>
 <script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
  
    <script>
    
      $(function(){
        $("#lastgroup ul").hide();
      })
    </script>

      <div id="startWrap">
          <img src="resources/image/logo.png" alt="logo" id="logotop">

          <div id="content">
            <p id="imtext1">
              모험으로 떠나는 경로 <br>
              Do you want to Run?
            </p>
            <p id="imtext2">ovcos</p>
          </div>
          <button id="startBtn" onclick="location.href='login'">시작하기</button>
      </div>     
      <div style="background-color: black; width: 100vw; height: 100vh;">
        
      </div>
      


</body>
</html>