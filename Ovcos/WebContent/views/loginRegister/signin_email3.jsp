<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
   	<link rel="stylesheet" href="../../resources/css/start.css">
    <link rel="stylesheet" href="../../resources/css/header.css">
    <link rel="stylesheet" href="../../resources/css/findId.css">

    <title>OVCOS</title>
</head>    
<body>

    <%@ include file="../../views/common/navForIndex.jsp" %>

    <script>
      $(function(){
        $("#lastgroup").remove();
      })
    </script>

      <div id="startWrap">

          <form action="test1.do" method="post">
            <div id="content">
              <div id="login">
              <img src="../../resources/image/logo.png" alt="로고" id="logotop">
              	<link rel="stylesheet" href="../../resources/css/start.css">
    <link rel="stylesheet" href="../../resources/css/header.css">
    <link rel="stylesheet" href="../../resources/css/findId.css">

    <title>OVCOS</title>
</head>    
<body>

    <%@ include file="../../views/common/navForIndex.jsp" %>

    <script>
      $(function(){
        $("#lastgroup").remove();
      })
    </script>

      <div id="startWrap">

          <form action="test1.do" method="post">
            <div id="content">
              <div id="login">
              <img src="../../resources/image/logo.png" alt="로고" id="logotop">
                       <div id="step">
                  <ul id="joinStep">
                    <li>약관 동의</li>
                    <li><b>이메일 동의</b></li>
                    <li>정보 기입</li>
                    <li>완료</li>
                  </ul>
                </div>
                <div id="provision">
                  <h5>이메일 인증 코드 시간이 초과되었습니다.</h5>
              
                </div>
             
                <button class="btn"><a href="email2.html">코드 재전송</a></button>

              
            
            
            </div>
          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>