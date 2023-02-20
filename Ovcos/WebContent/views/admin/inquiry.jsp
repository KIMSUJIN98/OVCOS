<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div, form, input{
        border: 1px solid black;
        box-sizing: border-box;
    }

    #head, #body>div{border: 1px solid red;}
    #a{text-decoration: none; color:black; font-size: 18px;}

    .wrap{
        width:1000px;
        height:800px;
        margin: auto;
    }

    .wrap>div{width: 100%;}
    #head{height: 15%;}
    #body{height:85%}

    #head>div{height: 100%; float: left;}
    #h1{width: 20%; position: relative;}
    #h2{width: 70%; position:relative;}
    #h3{width: 10%;}

    #h1_1{height: 40%;}
    #h1_2{height: 60%;}

    #body>div{height: 100%; float: left;}
    #b1{width: 20%; position: relative;}
    #b2{width: 80%; position: relative;}

    #b1_1{height: 20%;}
    #b1_2{height: 20%;}
    #b1_3{height: 15%;}
    #b1_4{height: 20%;}

    #b2_1{height: 10%;}
    #b2_2{height: 15%;}
    #b2_3{height: 70%;}
    #b2_4{height: 5%;}
</style>
</head>
<body>
    <div class="wrap">
        <div id="head">
            <div id="h1">
                <div id="h1_1">관리자 계정 로그인 중</div>
                <div id="h1_2"><img src="../../resources/image/logo.png" alt=""> </div>
            </div>
            <div id="h2"><h1>문의 내역</h1></div>
            <div id="h3"> <button>현재 게시판 동기화</button></div>
        
        </div>
        <div id="body">
            <div id="b1">
                <div id="b1_1"></div>
                <div id="b1_2">
                    <ul> 
                        <h2>콘텐츠</h2>
                        <li>피드 관리</li>
                        <li>챌린지 관리</li>
                        <li>댓글 관리</li>
                    </ul>
                </div>
                <div id="b1_3">
                    <ul> 
                        <h2>이용자</h2>
                        <li>전체 회원 관리</li>
                    </ul>
                </div>
                <div id="b1_4">
                    <ul> 
                        <h2>기타</h2>
                        <li>탈퇴사유</li>
                        <li>문의내역</li>
                    </ul>
                </div>
            </div>
            <div id="b2">
                <div id="b2_1">
                    - 신규 게시판이 생성될 수 있으니 작업 전에 우측 동기화 버튼을 클릭해서 진행해야 합니다. <br>
                    - 게시물의 제목을 클릭하면 해당 게시물로 이동해 수정이 가능합니다.
                </div>
                <div id="b2_2">
                    기간별 검색
                    <input type="date">- <input type="date"> <br>
                    <select name="order">
                        <option value="latest">최신순</option>
                        <option value="nickName">닉네임</option>
                        <option value="title">제목</option>
                    </select>
                    <input type="text">
                </div>
                <div id="b2_3">
                    <table border="1">
                        <tr>
                            <th><input type="checkbox" name="" id=""></th>
                            <th>문의번호</th>
                            <th>문의내역</th>
                            <th>닉네임</th>
                            <th>작성일자</th>
                            <th>관리</th>
                        </tr>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </table>
                </div>
                <div id="b2_4"></div>
            </div>
        </div>

    </div>

</body>
</html>