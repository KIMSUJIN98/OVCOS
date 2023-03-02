<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
      crossorigin="anonymous"></script>
      <script src="https://kit.fontawesome.com/66bc1e54e8.js" crossorigin="anonymous"></script>
   
    <link rel="stylesheet" href="../../resources/css/findId.css?abc">
    <title>OVCOS</title>
  </head>

  <body>
    <script>
      $(function () {
        $("#lastgroup").remove();
      })
    </script>

    <div id="wrap">

      <div class="popup_area">
        <div class="signin_box">
          <div class="popup_top">

            <div id="x-box"><i class="fa-solid fa-x" onclick="location.href='/Ovcos/views/loginRegister/login.jsp'"></i>
            </div>


            <br><span id="title">회원정보 찾기</span> <br>

          </div>
        </div>
      
    <div class="popup_body">
      <ul id="navi">
        <li><a href="/Ovcos/views/loginRegister/findId.jsp" id="findId">아이디 찾기</a></li>
        <li><a href="/Ovcos/views/loginRegister/findPwd.jsp" id="findPwd">비밀번호 재설정</a></li>
      </ul>
      
      <table>
        <tr>
          <td>이름</td>
          <td><input type="text" placeholder="이름을 입력해주세요" required></td>
          <td></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" placeholder="이메일 주소" required></td>
          <td id="mark"></td>
        </tr>
        <tr>
          <td></td>
          <td><select name="email">

              <option value="" selected>선택하세요</option>
              <option value="@gmail.com">@gmail.com</option>
              <option value="@naver.com">@naver.com</option>
              <option value="@daum.net">@daum.net</option>
              <option value="@nate.com">@nate.com</option>
            </select></td>
          <td><button onclick="findId();">인증요청</button></td>
        </tr>
      </table>
      
      <script>
      
      </script>
      
      <div id="info">
      <b>이메일 본인인증을 해주세요.</b> <br>
      인증번호는 이메일로 전송됩니다. <br>
      전송된 인증번호를 입력하셔야 본인인증이 완료됩니다.
      </div>
      <button type="submit" class="next_btn">아이디 찾기</button>
    </div>
  </div>
</div>
  </body>

  </html>