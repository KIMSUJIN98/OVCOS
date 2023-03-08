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
      <link rel="stylesheet" href="resources/css/findPwd2.css?abc">
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
            <% String pwd=(String) request.getAttribute("pwd"); %>
              <% String id=(String) request.getAttribute("id"); %>
                <%-- <% String id=(String) request.getAttribute("id"); %> --%>
                  <% if (pwd !=null) { %>
                    <img src="<%= contextPath %>/resources/image/lock.png" width="130px" height="130px" align="center" ;
                      id="img">

                    <div id="safe">안전한 비밀번호로 변경해주세요.</div>
                    <form id="updatePwd" action="<%=contextPath %>/updatePwd.me" method="post"
                      onsubmit="return validate();">
                      <input type="hidden" name="id" value="<%=id %>">
                      <table id="updatePwdTable">
                        <tr>
                          <td>새 비밀번호</td>
                          <td><input type="password" id="memPwd" name="memPwd" required
                              placeholder="6자 이상 영문 대소문자,숫자,특수문자 조합"></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td colspan="2" id="checkPwd"></td>
                        </tr>
                        <tr>
                          <td>새 비밀번호 확인</td>
                          <td><input type="password" id="memPwd2" required placeholder="다시 한 번 입력하세요."></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td colspan="2" id="checkPwd2"></td>
                        </tr>
                      </table>
                      <button type="submit" class="next_btn" id="changeBtn"
                        onclick="location.href='<%=contextPath%>/views/loginRegister/findPwd3.jsp'">비밀번호 변경</button>
                    </form>
                    <% } else { %>
                      <div>
                        <p>
                          <%= request.getAttribute("errorMessage") %>
                        </p>
                      </div>
                      <div>
                        <button type="submit" class="next_btn"
                          onclick="location.href='<%=contextPath%>/views/loginRegister/signin_agree.jsp'">회원가입</button>
                        <button type="submit" class="next_btn"
                          onclick="location.href='<%=contextPath%>/views/loginRegister/login.jsp'">처음으로</button>
                        <% } %>
                      </div>
                      <script>
                        $("#memPwd").on("blur", function () {
                          if ($(this).val().trim().length == 0) {
                            $(this).val("");
                            $("#checkPwd").text("비밀번호를 입력해주세요.");
                            /* $("#memPwd").val("");
                            $("#memPwd").focus(); */

                            return;
                          }


                          const regExp = /^[a-z\d!@#$%^&*]{6,15}$/i;

                          if (regExp.test($(this).val())) {
                            $("#checkPwd").text("사용 가능한 비밀번호입니다.");
                          } else {
                            $("#checkPwd").text("사용 불가능한 비밀번호입니다.");
                            $("#memPwd").val("");
                            $("#memPwd").focus();
                          }

                        })

                        $("#memPwd2").on("keyup", function () {
                          if ($("#memPwd2").val().trim().length == 0) {
                            $(this).val("");
                            $("#checkPwd2").text("비밀번호를 입력해주세요.");
                            /*  $("#memPwd2").focus(); */
                            return;
                          }

                          if ($(this).val().trim().length == 0) {
                            $("#checkPwd2").text("");
                            return;
                          }
                          if ($("#memPwd").val() == $(this).val()) {
                            $("#checkPwd2").text("비밀번호가 일치합니다.")
                          } else {
                            $("#checkPwd2").text("비밀번호가 일치하지 않습니다.")
                            $("#memPwd2").focus();
                          }
                        })

                      </script>







          </div>
        </div>
    </body>


    <script>
    </script>

    </html>