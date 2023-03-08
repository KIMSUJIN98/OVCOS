<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <% String contextPath=request.getContextPath(); %>
    <%! public int getRandom(){ int random=0; random=(int)Math.floor((Math.random()*(99999-10000+1)))+10000; return
      random; }%>
      <!DOCTYPE html>
      <html lang="en">


      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Favicon-->
        <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/favicon.png"
          sizes="16x16" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
          crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/66bc1e54e8.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="../../resources/css/findPwd.css?abc">
        <title>OVCOS - 비밀번호재설정</title>
      </head>
      <link rel="stylesheet" href="../../resources/css/findPwd.css?abc">
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


                <br><span id="title">회원정보 찾기</span> <br>

              </div>
            </div>

            <div class="popup_body">
              <ul id="navi">
                <li><a href="/Ovcos/views/loginRegister/findId.jsp" id="findId">아이디 찾기</a></li>
                <li><a href="/Ovcos/views/loginRegister/findPwd.jsp" id="findPwd">비밀번호 재설정</a></li>
              </ul>

              <form id="find_pwd" action="<%=contextPath %>/findPwd.me" method="post">
                <table>
                  <tr>
                    <td>아이디</td>
                    <td><input type="text" placeholder="아이디 입력해주세요" required id="memId" name="memId"></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td>이메일</td>
                    <td><input type="text" placeholder="이메일 주소" required id="memEml" name="memEml"></td>
                    <td id="mark"></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td><select name="email-provider" id="email-select">

                        <option value="" selected>직접입력</option>
                        <option value="@gmail.com">@gmail.com</option>
                        <option value="@naver.com">@naver.com</option>
                        <option value="@daum.net">@daum.net</option>
                        <option value="@nate.com">@nate.com</option>
                      </select></td>
                    <td> <button type="button" id="authBtn" onclick="callServlet()">인증요청</button>
                      <input type="hidden" readonly="readonly" name="codeCheck" id="codeCheck" value="<%=getRandom()%>">
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td id="checkEml" class="result"></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td>
                      <input type="text" id="code" name="code" placeholder="인증번호">
                    </td>
                    <td> <button type="button" onclick="checkCode()" id="checkBtn">인증확인</button>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td id="checkCode">
                      <input type="hidden" readonly="readonly" name="code_check" id="code_check"
                        value="<%=request.getAttribute(" code")%>">
                    </td>
                  </tr>
                </table>

                <div id="info">
                  <b>이메일 본인인증을 해주세요.</b> <br>
                  인증번호는 이메일로 전송됩니다. <br>
                  전송된 인증번호를 입력하셔야 본인인증이 완료됩니다.
                </div>

                <button type="submit" class="next_btn">비밀번호 재설정</button>
              </form>
            </div>
          </div>
        </div>

        <script>

          function callServlet() {
            var email = document.getElementById('memEml');
            if (email.value.trim() === "") {
              document.getElementById('checkEml').innerHTML = "이메일 주소를 입력해주세요."
            } else {
              document.getElementById('checkEml').innerHTML = "이메일로 인증번호가 전송되었습니다.";

              const emailSelect = document.querySelector('#email-select');
              const emailInput = document.getElementById('memEml');
              const email = emailInput.value + emailSelect.value;
              const code = document.getElementById('codeCheck').value;
              const id = document.getElementById('memId').value;

              const data = {
                'code': code,
                'email': email,
                'id': id
              };

              console.log(data);

              var xhr = new XMLHttpRequest();
              xhr.open('POST', '<%=contextPath %>/send.ma1', true);
              xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');

              xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                  if (xhr.status === 200) {
                    //  console.log(xhr.responseText);
                  } else {
                    console.error('There was a problem with the request.');
                  }
                }
              };

              xhr.send(JSON.stringify(data));
              console.log("안녕");
            }
          }




          function checkCode() {
            var v1 = document.getElementById('codeCheck').value;
            var v2 = document.getElementById('code').value;
            const selectInput = document.querySelector("#code_check");

            if (v1 != v2) {
              document.getElementById('checkCode').style.color = "red";
              document.getElementById('checkCode').innerHTML = "잘못된 인증번호입니다. 다시 인증해주세요.";
              makeNull();
            } else {
              document.getElementById('checkCode').innerHTML = "인증되었습니다.";
              makeReal();
            }
          }

          function makeReal() {
            var hi = document.getElementById("hi");
            hi.type = "submit";
          }

          function makeNull() {
            document.getElementById('code').value = '';
            var hi = document.getElementById("hi");
            hi.type = "hidden";
          }



        </script>


      </body>

      </html>