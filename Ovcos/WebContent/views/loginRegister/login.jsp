<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginStyle.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>

    <div id="wrap">
        <div class="popup_area">
            <div id="login_box">
                <span id="title">함께하는 운동웹 오브코스</span>
                <span><img src="${pageContext.request.contextPath}/resources/image/whiteLogo.png" alt=""></span>
                <span>오브코스 회원이 되어 재미있게 운동하고 <br>
                     <span>다양한 사람들과 공유해보세요.</span>
                </span>
                <span id="text_org">만 14세 이상 가입 가능합니다.</span>
            </div>
            <div id="login_input">
                <form action="<%=contextPath%>/login.me" method="post">
                    <input type="text" name="userId" placeholder="아이디 입력"> 
                    <input type="password" name="userPwd" placeholder="비밀번호"> <br>
                    <button type="submit" class="login_btn">로그인</button>
                </form>
            </div>
            <div id="login_menu">
                <div>
                    <a href="/Ovcos/views/loginRegister/findId.jsp" class="a1">아이디 찾기</a>
                    <a href="/Ovcos/views/loginRegister/findPwd.jsp">비밀번호 재설정</a>
                </div>
            </div>

            <button id="register_btn" onclick="location.href='<%=contextPath%>/agree.me'">회원가입</button>
            <span id="test1">간편 로그인</span>
            <div id="login_img">
            <div id="naver_id_login">
                <img src="${pageContext.request.contextPath}/resources/image/naver.png" alt="" onclick="loginNaver();">
            </div>
                <img src="${pageContext.request.contextPath}/resources/image/kakao.png" alt="">
                <img src="${pageContext.request.contextPath}/resources/image/google.png" alt="">
            </div>
        </div>
    </div>
    
    <script>
    	function naverLogin(){
    		const naver_id_login = new naver_id_login("KcHVwRHK_KE6cV1dfnlJ", "http://localhost:8581/Ovcos/index.jsp/naverLogin");
    	  	const state = naver_id_login.getUniqState();
    	  	naver_id_login.setButton("white", 2,40);
    	  	naver_id_login.setDomain("http://localhost:8581/Ovcos/index.jsp");
    	  	naver_id_login.setState(state);
    	  	naver_id_login.setPopup();
    	  	naver_id_login.init_naver_id_login();
    	}
    
    </script>


</body>
</html>