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

    <%@ include file="../../views/common/headerForIndex.jsp" %>

    <script>
      $(function(){
        $("#lastgroup").remove();
      })
    </script>

      <div id="startWrap">

          <form action="test1.do" method="post">
            <div id="content">
              <div id="login">
              <img src="../../resources/image/logo.png" alt="로고" id="logotop">              <div id="step">
                  <ul id="joinStep">
                    <li>아이디 찾기</li>
                    <li>비밀번호 찾기</li>
                  </ul>
                </div>
                <div id="provision">
              <h3>일치하는 정보를 찾을 수 없습니다.</h3>


                </div>
                <button class="btn" id="btn1"><a href="findId.html">되돌아가기</a></button>
                <button class="btn" id="btn2"><a href="agree.html">회원가입</a></button>

              
              
            
            
            </div>
          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>