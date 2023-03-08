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
<!-- <title>OVCOS - 새로운 모험의 시작</title> -->

<!-- Favicon-->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/favicon.png" sizes="16x16" />

<link rel="stylesheet" href="<%= contextPath %>/resources/css/navStyle.css">
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

<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

</head>
<body>
    <div id="wrap">
        <div id="wrapnav">
            
            <div id="firstGroup">
                <div id="logo">
                    <img src="<%= contextPath %>/resources/image/logo.png" alt="ovcos 로고" id="logoimg" >
                </div>
                <div id="menu">
                    <ul>
                        <li id="feed"><a href="#">피드</a></li>
                        <li id="explore"><a href="#">탐색</a></li>
                        <li id="challenge"><a href="#">챌린지</a></li>
                    </ul>
                </div>
            </div>
            
            <div id="lastGroup">
                <ul>
                    <li id="li1"></li>
                    <li id="li2" class="menu"></li>
                </ul>
            </div>
            
        </div>
    </div>
    
</body>
</html>