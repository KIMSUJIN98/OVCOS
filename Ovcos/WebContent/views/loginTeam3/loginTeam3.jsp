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
    <link rel="stylesheet" href="../../resources/css/loginStyle.css">

    <title>OVCOS</title>
</head>    
<body>

    <div id="wrap">
      <div id="navi">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark ">
          <!-- Brand/logo -->
          <a class="navbar-brand" href="index.html">
            <img src="../resources/img/logo.png" alt="logo" style="width:100px;">
          </a>
            
          <!-- Links -->
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#">Section1</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Section2</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Section3</a>
            </li>
          </ul>
        </nav>
      </div>

      <div id="body">
          <div id="c1"> <!-- 화면 살짝 어둡게 하는 태그-->
          </div>
          <img src="../../resources/image/logo.png" alt="로고" id="logotop">
          
          <form action="login.me" method="post">
          <div id="content">
            <div id="login">
                <div id="loginbox" class="loginitem">
                  <input type="text" name="userId" class="loginform" id="userId" placeholder="USER ID"><br>
                  <input type="password" name="userPwd" class="loginform" id="userPwd" placeholder="PASSWORD">
                  <br><br>
                  <div ><input type="submit" id="loginbtn" class="btn1" value="로그인"></div>
                  <div id="api">api 구역</div>
                  <div>
                    <a href="">아이디찾기</a>
                    <a href="">비번찾기</a>
                    <a href="">회원가입</a>
                  </div>
                </div>
              </div>
            </div>
          

          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>