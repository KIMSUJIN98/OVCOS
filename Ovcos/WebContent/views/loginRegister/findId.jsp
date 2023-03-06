<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% String contextPath=request.getContextPath(); %>
    <%! public int getRandom(){
    	int random = 0;
    	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
    	return random;
    	}%>
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
    <link rel="stylesheet" href="resources/css/findId.css?abc">
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
      
      <form id="findId" action="<%=contextPath %>/findId.me" method="post">
      <table>
        <tr>
          <td>이름</td>
          <td><input type="text" placeholder="이름을 입력해주세요" required id="memName" name="memName"></td>
          <td></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" placeholder="이메일 주소" required id="memEml" name="memEml"></td>
          <td id="mark"></td>
        </tr>
        <tr>
  <td></td>
  <td>
    <select name="email-provider" id="email-select">
      <option value="" selected>선택하세요</option>
      <option value="@gmail.com">@gmail.com</option>
      <option value="@naver.com">@naver.com</option>
      <option value="@daum.net">@daum.net</option>
      <option value="@nate.com">@nate.com</option>
    </select>
  </td>
  <td>
    <button type="button" id="authBtn" onclick="callServlet()">인증요청</button>
    <input type="hidden" readonly="readonly" name="codeCheck" id="codeCheck" value="<%=getRandom()%>">
  </td>
</tr>
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
      
      <script>
      
      function callServlet() {
    	  console.log("되니?");
    	  
    	  const emailSelect = document.querySelector('#email-select');
    	  const emailInput = document.getElementById('memEml');
    	  const email = emailInput.value + emailSelect.value;
    	  const code = document.getElementById('codeCheck').value;
    	  const name = document.getElementById('memName').value;

    	  const data = {
    	    'code': code,
    	    'email': email,
    	    'name': name
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
      
      <div id="info">
      <b>이메일 본인인증을 해주세요.</b> <br>
      인증번호는 이메일로 전송됩니다. <br>
      전송된 인증번호를 입력하셔야 본인인증이 완료됩니다.
      </div>
  
  <button type="submit" class="next_btn" align="center" data-bs-toggle="modal" data-bs-target="#exampleModal4">아이디 찾기</button>
<!-- <script>
	function findId(){
		const emailSelect = document.querySelector('#email-select');
		const emailInput = document.getElementById('memEml');
		const email = emailInput.value + emailSelect.value;

		const data = {
		  'email': email
		};

		var xhr = new XMLHttpRequest();
		xhr.open('POST', 'your_servlet_url', true);
		xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');

		xhr.onreadystatechange = function() {
		  if (xhr.readyState === XMLHttpRequest.DONE) {
		    if (xhr.status === 200) {
		      console.log(xhr.responseText);
		    } else {
		      console.error('There was a problem with the request.');
		    }
		  }
		};

		xhr.send(JSON.stringify(data));
	}
</script> -->
<%-- <script>
 function findId() {
    	  console.log("되니?");
    	  
    	  const emailSelect = document.querySelector('#email-select');
    	  const emailInput = document.getElementById('memEml');
    	  const email = encodeURLComponent(emailInput.value + emailSelect.value);
    	  const name = document.getElementById('memName').value;

    	  const data = {
    	    'code': code,
    	    'email': email,
    	    'name': name
    	  };

    	  console.log(data);

    	  var xhr = new XMLHttpRequest();
    	  xhr.open('POST', '<%=contextPath %>/findId.me', true);
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
 
 </script> --%>
 
 
  </form>
  <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="resultModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resultModalLabel">결과</h5>
                 <% String id = (String) request.getAttribute("id");
    if(id != null) { %>
        <div>
            <p>회원님의 아이디는 <%= id %> 입니다.</p>
        </div>
    <% } %>
    
    <% String errorMessage = (String) request.getAttribute("errorMessage");
    if(errorMessage != null) { %>
        <div>
            <p><%= errorMessage %></p>
        </div>
    <% } %>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="resultMessage"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
    </body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
  crossorigin="anonymous"></script>
  
  <script>
  </script>

  </html>