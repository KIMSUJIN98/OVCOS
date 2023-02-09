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
              <img src="../../resources/image/logo.png" alt="로고" id="logotop">
              <div id="step">
                  <ul id="joinStep">
                    <li>약관 동의</li>
                    <li>이메일 동의</li>
                    <li><b>정보 기입</b></li>
                    <li>완료</li>
                  </ul>
                </div>
                <table id="provision">
                  <tr>
                    <td>
                      <input type="text" id="insertId" placeholder="아이디 입력" required>
                    </td>
                    <td>
                      <input type="button" value="중복확인"> <br>
                    </td>
                  </tr>

                  <tr>
                    <td>
                    <input type="password" id="insertPwd" placeholder="비밀번호 입력" required> <br>
                  </td>
                  <td></td>
                  </tr>
                  
                  <tr>
                    <td>
                      <input type="password" id="pwdCheck" placeholder="비밀번호 확인" required> <br>
                    </td>
                    <td></td>
                  </tr>

                  <tr>
                    <td>
                      <input type="text" id="insertName" placeholder="이름 입력" required> <br>
                    </td>
                    <td></td>
                  </tr>

                  <tr>
                    <td>
                      <input type="text" id="insertBirth" placeholder="생년월일(8자)" required> <br>
                    </td>
                    <td></td>
                  </tr>

                  <tr>
                    <td>
                      <input type="text" id="insertNickName" placeholder="닉네임 입력">

                    </td>
                    <td>
                      <input type="button" value="중복확인"> <br>

                    </td>
                  </tr>


                </div>
                <button class="btn"><a href="joinComplete.html">다음</a></button>
              
              
            
            
            </div>
          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>