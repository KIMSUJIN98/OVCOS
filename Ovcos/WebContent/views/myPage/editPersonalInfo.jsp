<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String contextPath=request.getContextPath(); %>
<%! public int getRandom(){
    int random = 0;
    random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
    return random;
	}
%>
<% String selectResult =(String)request.getAttribute("select"); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
  	  integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
  	  crossorigin="anonymous">
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
	          <br><span id="title">OVCOS 회원가입</span> <br>
	        </div>
	
	     	<div class="popup_body">
	          
	
	
	          <div id="agree">
	            <form id="enroll-form" action="<%=contextPath %>/insert.me" method="post" onsubmit="return validate();">
	              <table id="insertInfo">
	              <input type="hidden" name="selectResult" value="<%=selectResult%>">
	                <tr>
	                  <td>아이디</td>
	                  <td><input type="text" id="memId" name="memId" maxlength="20" required
	                      placeholder="영문소문자,숫자로 4~20자리"><button type="button" id="checkIdBtn">중복확인</button>
	                  </td>
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
	                  <td><input type="text" id="memName" name="memName" required
	                      placeholder="이름(실명)을 입력하세요." id="memName"></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td colspan="2" id="checkName"></td>
	                </tr>
	                <tr>
	                  <td>생년월일</td>
	                  <td><input type="text" id="memBirth" name="memBirth"
	                      placeholder="YYYY-MM-DD 숫자만 입력해주세요."></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td colspan="2" id="checkBirth"></td>
	                </tr>
    				<tr>
				      <td>닉네임</td>
				      <td><input type="text" id="memNick" name="memNick" placeholder="닉네임 입력"><button type="button" id="checkNickBtn">중복확인</button></td>
				    </tr>
    
				    <tr>
				      <td></td>
				      <td colspan="2" id="checkNick"></td>
				    </tr>
					<tr>
					  <td>이메일</td>
					  <td>
					    <input type="email" id="memEml" name="memEml" placeholder="이메일을 입력해주세요.">
					   <button type="button" id="authBtn" onclick="callServlet()">인증요청</button>
					    <input type="hidden" readonly="readonly" name="codeCheck" id="codeCheck" value="<%=getRandom()%>">
					  </td>
					</tr>
					<tr>
					  <td></td>
					  <td colspan="2" id="checkEml"></td>
					</tr>
					<tr>
					  <td></td>
					  <td>
					    <input type="text" id="code" name="code" placeholder="인증번호">
					    <button type="button" onclick="checkCode()" id="checkBtn">인증확인</button>
					  </td>
					</tr>
					<tr>
					  <td></td>
					  <td id="checkCode">
					    <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code") %>">
					  </td>
					</tr>
				</table>
				<!-- <input id="hi" type="hidden" value="인증하기">  -->
				<button type="submit" class="next_btn">회원가입</button>
			</form>
		</div>

<script>

function checkCode(){
  var v1 = document.getElementById('codeCheck').value;
  var v2 = document.getElementById('code').value;
  const selectInput = document.querySelector("#code_check");
  
  if(v1!=v2){
    document.getElementById('checkCode').style.color="red";
    document.getElementById('checkCode').innerHTML = "잘못된 인증번호입니다. 다시 인증해주세요.";
    makeNull();
  } else {
    document.getElementById('checkCode').innerHTML = "인증되었습니다.";
    selectInput.value="Y";
    makeReal();
  }
}

function makeReal(){
  var hi=document.getElementById("hi");
  hi.type="submit";
}

function makeNull(){
  var hi=document.getElementById("hi");
  hi.type="hidden";
}
</script>
<script>
const agreeCheckbox = document.querySelector('#agree_checkbox');
const selectInput = document.querySelector('#select');

agreeCheckbox.addEventListener('change', function() {
  if (agreeCheckbox.checked) {
  	
    selectInput.value = 'Y';
  } else {
    selectInput.value = 'N';
  }
  
  console.log(selectInput.value);
});
         
                  
                  
                  function callServlet() {
                	  var code = document.getElementById('codeCheck').value;
                	  var email = document.getElementById('memEml').value;

                	  var data = {
                	    'code': code,
                	    'email': email
                	  };

                	  console.log(data);

                	  var xhr = new XMLHttpRequest();
                	  xhr.open('POST', '<%=contextPath %>/send.ma1', true);
                	  xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');

                	  xhr.onreadystatechange = function() {
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
                  
                      $(function validate() {
                    	  let isIdChecked = false;
                    	  let isPwdChecked=false;
                    	  let isPwdChecked2=false;
                    	  let isNameChecked=false;
                    	  let isBirthChecked=false;
                    	  let isNickChecked = false;
                    	  let isEmailChecked=false;
                    	  
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
                              isIdChecked=true;
                            } else {
                              $("#checkId").text("이미 존재하거나 탈퇴한 회원의 아이디입니다.").css("color", "red");
                              $idInput.val("");
                              $idInput.focus();
                              isIdChecked=false;
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
                          isPwdChecked=true;
                        } else {
                          $("#checkPwd").text("사용 불가능한 비밀번호입니다.");
                          $("#memPwd").val("");
                          $("#memPwd").focus();
                          isPwdChecked=false;
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
                          isPwdChecked2=true;
                        } else {
                          $("#checkPwd2").text("비밀번호가 일치하지 않습니다.")
                          $("#memPwd2").val("");
                          $("#memPwd2").focus();
                          isPwdChecked2=false;
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
                          isBirthChecked=false;
                        } else {
                          $("#checkBirth").text("올바른 형식입니다.")
                          isBirthChecked=true;
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
                              isNickChecked=true;
                            } else {
                              $("#checkNick").text("이미 존재하거나 탈퇴한 회원의 닉네임입니다.").css("color", "red");
                              $nickInput.val("");
                              $nickInput.focus();
                              isNickChecked=false;
                            }
                          }),
                          error: function () {
                            console.log("닉네임 중복체크용 ajax통신 실패");
                          }
                        }
                      });
           
                   $("#next_btn").on("click", function () {
  if (isIdChecked && isPwdChecked && isPwdChecked2 &&isNameChecked&& isBirthChecked&&isNickChecked &&isEmailChecked&&) {
	  
  } else {
    alert("아이디 중복검사, 닉네임 중복검사, 이메일 인증이 모두 완료되어야 합니다.");
  }
});
                  </script>

              </body>

              </html>