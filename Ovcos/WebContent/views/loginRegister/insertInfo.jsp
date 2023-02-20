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
    <link rel="stylesheet" href="../../resources/css/insertInfoStyle.css?abc">
    <title>OVCOS</title>
</head>    
<body>



    <script>
      $(function(){
        $("#lastgroup").remove();
      })
    </script>

      <div id="wrap">

            <div class="popup_area">
              <div class="signin_box">
              <div class ="popup_top">
           
              <br><span id="title">OVCOS 회원가입</span> <br>
        
                </div>
                
                <div class="popup_body">
                <div id = "info">
                <span>OVCOS에서는 성별,연령,거주지별 랭킹 정보 및 운동분석,</span>
                <span>통계 데이터 분석을 위해 아래 정보들을 수집합니다.</span>
                </div>

                <div id="agree">
                <form action="test1.do" method="post">
                  <table id="insertInfo">
                    <tr>
                      <td>아이디</td>
                      <td><input type="text" required placeholder="영문소문자,숫자로 4~20자리"></td>
                      <td><button>중복확인</button></td>
                    </tr>
                    <tr>
                      <td>비밀번호</td>
                      <td><input type="password" required placeholder="8자 이상 영문 대소문자, 숫자, 특수문자를 조합해주세요"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>비밀번호 확인</td>
                      <td><input type="password" required placeholder="다시 한 번 입력하세요."></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>이름</td>
                      <td><input type="text" required placeholder="이름(실명)을 입력하세요."></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>생년월일</td>
                      <td><input type="text" placeholder="YYYY-MM-DD 숫자만 입력해주세요."></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>닉네임</td>
                      <td><input type="text" placeholder="닉네임 입력"></td>
                      <td><button>중복확인</button></td>
                    </tr>
                    <tr>
                      <td>이메일</td>
                      <td><input type="email" placeholder="이메일을 입력해주세요."></td>
                      <td><button>인증요청</button></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td><input type="text" placeholder="인증번호"></td>
                      <td><button>인증번호 확인</button></td>
                    </tr>
                  </table>
                  
                  
                </div>
               </div>
                <button class="next_btn">회원가입</button>
                
              
              
            
            
            </div>
          </div>
        </form>
        
      </div>        
  </div>
</body>
</html>