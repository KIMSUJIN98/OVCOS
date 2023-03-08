<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <% String contextPath=request.getContextPath(); %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
      <script src="https://kit.fontawesome.com/66bc1e54e8.js" crossorigin="anonymous"></script>

      <link rel="stylesheet" href="../../resources/css/findId.css?abc">
      <link rel="stylesheet" href="resources/css/findPwd3.css?abc">
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

              <br><span id="title">비밀번호 재설정</span> <br>

            </div>
          </div>

          <div class="popup_body">
            <!--       <ul id="navi">
        <li><a href="/Ovcos/views/loginRegister/findId.jsp" id="findId">아이디 찾기</a></li>
        <li><a href="/Ovcos/views/loginRegister/findPwd.jsp" id="findPwd">비밀번호 재설정</a></li>
      </ul> -->

          </div>
          <div>
            <div>
              <p>비밀번호 변경이 완료되었습니다.</p>
            </div>
            <div>
              <button type="submit" class="next_btn"
                onclick="location.href='<%=contextPath%>/views/loginRegister/login.jsp'">로그인</button>

            </div>
          </div>
    </body>


    <script>
    </script>

    </html>