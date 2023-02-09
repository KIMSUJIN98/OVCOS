<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="../../resources/css/navStyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Black+Han+Sans&family=Fira+Sans:wght@400;700&family=Hahmlet:wght@400;500;600;700&family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@700;900&family=Oleo+Script&family=Oswald:wght@700&family=Quicksand:wght@300;400;500;600;700&family=Roboto:ital,wght@0,100;0,300;0,400;1,300&family=Rubik+Mono+One&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
    <header>
        <nav>
            <div id="wrapnav">
                <div id="fistgroup">
                    <div id="logo">
                        <img src="../../resources/image/logo.png" alt="ovcos 로고" id="logoimg" >
                    </div>
                    <div id="menu">
                        <ul>
                            <li><a href="aFeed" >피드</a></li>
                            <li id="explore" ><a href="">탐색</a></li>
                            <li id="chall"><a href="">챌린지</a>
                                    <ul>
                                        <li><a href="#">대회</a></li>
                                        <li><a href="#">일반</a></li>
                                    </ul>
                            </li>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="lastgroup">
                    <ul>
                        <li id="li1">
                            <div id="alarm">
                                <img src="../../resources/image/bell.png" alt="알림종">
                            </div>
                        </li>
                        <li id="li2">
                            <div id="myPage">
                                <img src="../../resources/image/mypage.png" alt="프로필이미지">
                            </div>
                            <ul id="submenu">
                                <li><a href="#">마이페이지</a></li>
                                <li><a href="#">개인정보수정</a></li>
                                <li><a href="#">친구목록</a></li>
                                <li><a href="#">로그아웃</a></li>
                            </ul>
                        </li>
                        <li id="li3">
                            <div id="downbtn">
                            <img src="../../resources/image/down.png" alt="아래버튼" onclick="">
                            </div>
                        </li>
                        <li id="li4">
                            <div id="feed">
                                <a href="">+</a>
                            </div>
                        </li>
                    </ul>
                    
                </div>
            </div>
        </nav>
    </header>


    </div>
</body>
</html>
</body>
</html>