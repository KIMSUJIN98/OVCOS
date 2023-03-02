<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String contextPath = request.getContextPath();
%>

<%-- <%! public int getRandom(){
	 int random=0;
	 random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	 return random;
}%> 
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="java.util.*"%>
 --%>
<%-- <%
// 이메일 발송 정보 설정
String host = "smtp.gmail.com"; // SMTP 서버 주소
String user = "khofcos@gmail.com"; // 발송자 이메일 계정
String password = "ofcospass01"; // 발송자 이메일 계정 비밀번호

// 이메일 수신자 정보 설정
String recipient = request.getParameter("email"); // 수신자 이메일 주소
String subject = "이메일 인증 코드"; // 이메일 제목

// 이메일 인증 코드 생성
Random rand = new Random();
String code = String.format("%06d", rand.nextInt(1000000)); // 6자리 무작위 인증 코드 생성

// 이메일 내용 작성
String content = "<h2>이메일 인증 코드는 다음과 같습니다.</h2><br><h3>" + code + "</h3>";

// 이메일 발송
Properties props = new Properties();
props.put("mail.smtp.host", host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.port", "587");

Session sess = Session.getDefaultInstance(props, new Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(user, password);
    }
});

try {
    MimeMessage message = new MimeMessage(sess);
    message.setFrom(new InternetAddress(user));
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
    message.setSubject(subject);
    message.setContent(content, "text/html;charset=utf-8");

    Transport.send(message); // 이메일 전송
} catch (MessagingException e) {
    out.println("이메일 전송 실패: " + e.getMessage());
}

// 세션에 인증 코드 저장
session.setAttribute("code", code);
session.setAttribute("email", recipient);
%>
  
   --%>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
      crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/insertInfoStyle.css?abc">
    <script src="https://kit.fontawesome.com/66bc1e54e8.js" crossorigin="anonymous"></script>

    <title>OVCOS</title>
  </head>

  <body>

    <%-- <%@ include file="../common/nav.jsp" %> --%>

      <script>
        $(function () {
          $("#lastgroup").remove();
        })
      </script>

      <div id="wrap">

        <div class="popup_area">
          <div class="signin_box">
            <div class="popup_top">

              <div id="x-box"><i class="fa-solid fa-x"
                  onclick="location.href='/Ovcos/views/loginRegister/login.jsp'"></i></div>


              <br><span id="title">OVCOS 회원가입</span> <br>

            </div>

            <div class="popup_body">
              <div id="info">
                <span>OVCOS에서는 성별,연령,거주지별 랭킹 정보 및 운동분석,</span>
                <span>통계 데이터 분석을 위해 아래 정보들을 수집합니다.</span>
              </div>

              <div id="agree">
                <form id="enroll-form" action="<%=contextPath %>/insert.me" method="post" onsubmit="return validate();">
                  <table id="insertInfo">
                    <tr>

                      <td>아이디</td>
                      <td><input type="text" id="memId" name="memId" maxlength="20" required
                          placeholder="영문소문자,숫자로 4~20자리"><button type="button" id="checkIdBtn">중복확인</button></td>
                      <!-- onclick="idCheck(); -->
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkId"></td>
                    </tr>
                    <tr>
                      <td>비밀번호</td>
                      <td><input type="password" id="memPwd" name="memPwd" required
                          placeholder="8자 이상 영문 대소문자,숫자,특수문자 조합"></td>

                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkPwd"></td>
                    </tr>
                    <tr>
                      <td style="width: 90px;">비밀번호 확인</td>
                      <td><input type="password" id="memPwd2" required placeholder="다시 한 번 입력하세요."></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkPwd2"></td>
                    </tr>
                    <tr>
                      <td>이름</td>
                      <td><input type="text" id="memName" name="memName" required placeholder="이름(실명)을 입력하세요."
                          id="memName"></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkName"></td>
                    </tr>
                    <tr>
                      <td>생년월일</td>
                      <td><input type="text" id="memBirth" name="memBirth" placeholder="YYYY-MM-DD 숫자만 입력해주세요."></td>

                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkBirth"></td>
                    </tr>
                    <tr>
                      <td>닉네임</td>
                      <td><input type="text" id="memNick" name="memNick" placeholder="닉네임 입력"><button type="button"
                          id="checkNickBtn">중복확인</button></td>

                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkNick"></td>
                    </tr>
                    <tr>
                      <td>이메일</td>
                      <td><input type="email" id="memEml" name="memEml" placeholder="이메일을 입력해주세요."><button type="button" id="authBtn" onclick="sendEmailAuthRequest()">인증요청</button>
                      </td>
						<td>
						<input type="hidden" readonly="readonly" name="code_check"
						id="code_check" <%-- value="<%=recipient %>" --%>>
						</td>
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkEml"></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="text" id="memCodeNy" name="memCodeNy" placeholder="인증번호"><button>인증확인</button>
                      </td>

                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="2" id="checkCode"></td>
                    </tr>
                  </table>
                  
                              <button type="submit" class="next_btn">회원가입</button>
                </form>

              </div>
            </div>



          </div>
        </div>



      </div>


      <script>
        $(function validate() {
          $("#checkIdBtn").on("click", function () {
            const $idInput = $("#memId");

            if ($idInput.val().trim().length === 0) {
              $("#checkId").text("아이디를 입력해주세요.");
              $idInput.val("");
              $idInput.focus();
              return;
            }

            const regExp = /^[a-z\d]{4,20}$/;

            if (!regExp.test($idInput.val())) {
              $("#checkId").text("올바른 형식의 아이디가 아닙니다.");
              $idInput.val("");
              $idInput.focus();
              return;

            }

            $.ajax({
              url: "idCheck.me",
              data: { checkId: $idInput.val() },
              success: function (result) {
                console.log(result);

                if (result === "NNNNY") {
                  $("#checkId").text("사용 가능한 아이디입니다.");
                } else {
                  $("#checkId").text("이미 존재하거나 탈퇴한 회원의 아이디입니다.").css("color", "red");
                  $idInput.val("");
                  $idInput.focus();
                }
              },
              error: function () {
                console.log("아이디 중복체크용 AJAX 통신 실패");
              }
            });
          })

          $("#memPwd").on("blur", function () {
            if ($(this).val().trim().length == 0) {
              $(this).val("");
              $("#checkPwd").text("비밀번호를 입력해주세요.");
              $("#memPwd").val("");
              $("#memPwd").focus();
            }

            const regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;

            if (regExp.test($(this).val())) {
              $("#checkPwd").text("사용 가능한 비밀번호입니다.");
            } else {
              $("#checkPwd").text("사용 불가능한 비밀번호입니다.");
              $("#memPwd").val("");
              $("#memPwd").focus();
            }

          })

          $("#memPwd2").on("blur", function () {
            if ($("#memPwd").val().trim().lenth == 0) {
              $(this).val("");
              $("#checkPwd2").text("비밀번호를 입력해주세요.");
              $("#memPwd2").focus();
            }

            if ($(this).val().trim().length == 0) {
              $("#checkPwd2").text("");
              return;
            }
            if ($("#memPwd").val() == $(this).val()) {
              $("#checkPwd2").text("비밀번호가 일치합니다.")
            } else {
              $("#checkPwd2").text("비밀번호가 일치하지 않습니다.")
              $("#memPwd2").val("");
              $("#memPwd2").focus();
            }
          })

          $("#memBirth").on("blur", function () {
            if ($(this).val().trim().length == 0) {
              $("checkBirth").text("");
              return;
            }
            const regExp = /^[0-9]{8}$/;

            if (!regExp.test($("#memBirth").val())) {
              $("#checkBirth").text("숫자로 8자리를 입력해주세요.")
              $("#memBirth").val("");
            } else {
              $("#checkBirth").text("올바른 형식입니다.")
            }
          });

          $("#checkNickBtn").on("click", function () {
            const $nickInput = $("#memNick");

            if ($nickInput.val().trim().length === 0) {
              $("#checkNick").text("닉네임을 입력해주세요.");
              $nickInput.val("");
              $nickInput.focus();
              return;
            }

            $.ajax({
              url: "nickCheck.me",
              data: { checkNick: $nickInput.val() },
              success: function (result) {
                console.log(result);

                if (result == "NNNNY") {
                  $("#checkNick").text("사용 가능한 닉네임입니다.");
                } else {
                  $("#checkNick").text("이미 존재하거나 탈퇴한 회원의 닉네임입니다.").css("color", "red");
                  $nickInput.val("");
                  $nickInput.focus();
                }
              },
              error: function () {
                console.log("닉네임 중복체크용 ajax통신 실패");
              }
            });
          });
        })
        
        function sendEmailAuthRequest(){
        	var email = document.getElementById("memEml").value;
        	  var xhr = new XMLHttpRequest();
        	  xhr.onreadystatechange = function() {
        	    if (this.readyState == 4 && this.status == 200) {
        	      alert(this.responseText);
        	    }
        	  };
        	  xhr.open("GET", "EmailAuthServlet?email=" + email, true);
        	  xhr.send();
        }
      </script>

  </body>

  </html>