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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navStyle.css">
</head> 
<body>
    <header>
        <nav>
            <div id="wrapnav">
                <div id="fistgroup">
                    <div id="logo">
                        <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="ovcos 로고" id="logoimg" >
                    </div>
                    <div id="menu">
                        <ul>
                            <li><a href="#">피드</a></li>
                            <li id="explore"><a href="#">탐색</a></li>
                            <li id="chall"><a href="#">챌린지</a></li>
                        </ul>
                    </div>
                </div>
                <div id="lastgroup">
                    <ul>
                        <li>
                            <div id="alarm">
                                <img src="${pageContext.request.contextPath}/resources/image/bell.png" alt="알림종">
                            </div>
                        </li>
                        <li id="mp">
                            <div id="myPage">
                            </div>
                        </li>
                        <li>
                        <!-- 버튼이미지 -->
                        </li>
                        <li>
                            <div id="feed">
                                <a href="">+</a>
                            </div>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
    </header>
</body>
</html>