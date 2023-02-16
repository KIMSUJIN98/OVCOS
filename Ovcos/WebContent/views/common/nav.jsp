<%@page import="com.ovcos.loginRegister.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser");



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navStyle.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Black+Han+Sans&family=Fira+Sans:wght@400;700&family=Hahmlet:wght@400;500;600;700&family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@700;900&family=Oleo+Script&family=Oswald:wght@700&family=Quicksand:wght@300;400;500;600;700&family=Roboto:ital,wght@0,100;0,300;0,400;1,300&family=Rubik+Mono+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script>

    $(document).ready(function(){ //마이페이지 서브메뉴 나오게하기 

        $("#li2,#li3").click(function(){
            var submenu = $("#submenu");

            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
</script>

</head>
<body>

    <div id="wrap">
        <div id="wrapnav">
            <div id="fistgroup">
                <div id="logo">
                    <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="ovcos 로고" id="logoimg" >
                </div>
                <div id="menu">
                    <ul>
                        <li id="aFeed"><a href="${pageContext.request.contextPath}/views/feed/feedMain.jsp"  >피드</a></li>
                        <li id="explore"><a href="<%= contextPath %>/course">탐색</a></li>
                        <li id="chall"><a href="<%= contextPath %>/views/challenge/contestMain.jsp">챌린지</a>
                            <ul>
                                <li><a href="<%= contextPath %>/views/challenge/contestMain.jsp">대회</a></li>
                                <li><a href="<%= contextPath %>/views/challenge/normalList.jsp">일반</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="lastgroup">
                <ul>
                    <li id="li1">
                        <div id="alarm">
                            <img src="${pageContext.request.contextPath}/resources/image/bell.png" alt="알림종">
                        </div>
                    </li>
                    <li id="li2">
                        <div id="myPage">
                            <img src="${pageContext.request.contextPath}/resources/image/mypage.png" alt="프로필이미지">
                        </div>
                        <ul id="submenu">
                            <li><a href="#">마이페이지</a></li>
                            <li><a href="#">개인정보수정</a></li>
                            <li><a href="#">친구목록</a></li>
                            <li><a href="#">로그아웃</a></li>
                        </ul>
                    </li>
                    <!-- <li id="li3">
                        <div id="downbtn">
                            <img src="${pageContext.request.contextPath}/resources/image/down.png" alt="아래버튼" onclick="">
                        </div>
                    </li> -->
                    <li id="li4">
                        <div id="feed" lass="btn" data-toggle="modal" data-target="#myModal">
                            <img src="${pageContext.request.contextPath}/resources/image/plus1.png" alt="">
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>