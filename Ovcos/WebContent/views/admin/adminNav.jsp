
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<style>

</style>
</head>
<body>
    <div class="wrap">

        <div id="head">
            <div id="h1">
                <div id="h1_1">관리자 계정 로그인 중</div>
                <div id="h1_2"><a href="${pageContext.request.contextPath}/main.admin"><img src="${pageContext.request.contextPath}/resources/image/logo.png" alt=""></a></div>
            </div>
        </div>
        <div id="body">
            <div id="b1">
                <div id="b1_1"></div>
                <div id="b1_2">
                    <ul> 
                        <h2>콘텐츠</h2>
                        <li><a href="${pageContext.request.contextPath}/feedList.admin?cpage=1">피드 관리</a></li>
                        <li><a href="">챌린지 관리</a></li>
                        <li><a href="">댓글관리</a></li>
                    </ul>
                </div>
                <div id="b1_3">
                    <ul> 
                        <h2>이용자</h2>
                        <li><a href="">전체 회원관리</a></li>
                    </ul>
                </div>
                <div id="b1_4">
                    <ul> 
                        <h2>기타</h2>
                        <li><a href="#">탈퇴사유</a></li>
                        <li><a href="#">문의내역</a></li>
                    </ul>
                </div>
            </div>
            <div id="b2">




            </div>
        </div>

    </div>

</body>
</html>