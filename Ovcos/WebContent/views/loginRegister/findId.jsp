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
	<link rel="stylesheet" href="../../resources/css/start.css?abc">
    <link rel="stylesheet" href="../../resources/css/header.css?abc">
    <link rel="stylesheet" href="../../resources/css/findId.css?abc">

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
                    <li><b>아이디 찾기</b></li>
                    <li>비밀번호 찾기</li>
                  </ul>
                </div>
                <div id="provision">
              <h2>회원정보 입력</h2>
              <table id="insertInfo" border="1px">
                <tr>
                  <td>이름</td>
                  <td><input type="text" placeholder="이름을 입력하세요"></td>
                </tr>
                <tr>
                  <td>이메일</td>
                  <td><input type="text" placeholder="회원가입한 이메일을 입력하세요"></td>
                </tr>

              </table>


                </div>
                <!-- <button class="btn" onclick="location.href='findId2.html'">시작하기</button> -->

                <button class="btn"><a href="findId2.html">다음</a></button>
                <!-- <button class="btn"><a href="findId3.html">다음</a></button> -->

              
              
            
            
            </div>
          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>