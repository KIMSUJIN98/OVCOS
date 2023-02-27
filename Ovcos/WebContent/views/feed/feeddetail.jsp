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
<link rel="stylesheet" href="<%= contextPath %>/resources/css/navStyle.css">
<link rel="stylesheet" href="<%= contextPath %>/resources/css/feeddetail.css">

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
<style>
    .floatWrap{

        
        float: left;
        display: block;
    }


</style>
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
                        <li id="feed"><a href="#"  >피드</a></li>
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
    <!-- 피드 -->
    <div id="left" class="floatWrap"> 
        <div id="feed1">
            <div style="border-bottom: 1px solid black;">
                <h5 align="center" style="padding-top: 8px;">피드 상세</h5>
            </div>
        </div>
        
        <div id="mypage1" style="border-bottom: 1px solid black;">
            <span style="margin-left:15px;">
                <img width="60px;" src="../../resources/image/mypage.png">
            </span>
            <span>
                <div>
                    <b id="name">닉네임 구간</b>
                </div>

                <div>
                    <div id="detail">피드내용</div>
                </div>
            </span>
        </div>
        <div id="run" align="center" style="border-bottom: 1px solid black;">
            <b>운동기록</b>
        </div>
        <div id="distance" style="border-bottom: 1px solid black;">
            <div>
                <b style="padding-left: 15px;">운동거리 : </b>

            </div>
            <br>
            <div>
                <b style="padding-left: 15px;">시작위치 : </b>
            </div>
        </div>

        <div style="height: 470px;">댓글 저장 공간</div>
        <div id="reply-area">
            <table>
                <thead> 
                    <tr>
                        <th id="fontth">댓글</th>
                        <td>
                            <textarea rows="1" cols="20" style="resize: none; margin-top: 10px;"></textarea>
                        </td>
                        <td><button  id="btn1" type="submit" class="btn btn-sm btn-info">전송</button></td>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
           
        
        </div>
    </div>
    <div class="floatWrap" style="width: 300px; height: 300px;">경로 불러올 공간</div>
</body>
</html>