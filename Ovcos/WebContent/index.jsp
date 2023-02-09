<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/navStyle.css">
<link rel="stylesheet" href="resources/css/start.css">
<script src="resources/js/jquery-3.6.3.min.js"></script>
</head>
<body>
  
    <%@ include file="views/common/navForIndex.jsp" %>

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
          <button class="btn" onclick="location.href='com/ovcos/view/login.html'">시작하기</button>

          
        </div>        
  </div>
</body>
</html>