<%@page import="com.ovcos.loginRegister.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%if(loginUser == null){ %>
		<script>
			location.href="<%=contextPath%>/login";
			alert("로그인 정보가 만료되었습니다.")
		</script>
	<%} %>

<%if(alertMsg != null){ %>
	<script>
		alert("<%= alertMsg%>");
	</script>
	
	<% session.removeAttribute("alertMsg"); %>
<%} %>
	
    <div id="wrap">
        <div id="wrapnav">
            
            <div id="firstGroup">
                <div id="logo">
                    <a href="<%= contextPath %>/list.feed"><img src="<%= contextPath %>/resources/image/logo.png" alt="ovcos 로고" id="logoimg"></a>
                    
                </div>
                <div id="menu">
                    <ul>

                        <li id="feed"><a href="<%= contextPath %>/list.feed">피드</a></li>
                        <li id="explore"><a href="<%= contextPath %>/course?epage=1">탐색</a></li>
                        <li id="challenge"><a href="<%= contextPath %>/main.ch">챌린지</a>
	                        <ul>
	                        	<li><a href="<%= contextPath %>/cntsMain.ch">대회</a></li>
	                        	<li><a href="<%= contextPath %>/ncList.ch?local=0">일반</a></li>
	                        </ul>
                        </li>
                    </ul>
                </div>
            </div>
            
            <div id="lastGroup">
                <ul>
                    <li id="li1">
                        <!-- <div id="feedEnrollBtn" class="btn" data-toggle="modal" data-target="#myModal">
                            <img src="<%= contextPath %>/resources/image/plus1.png" alt="">
                        </div> -->
                        <button type="button" id="feedEnrollBtn" data-toggle="modal" data-target="#myModal">피드등록</button>
                    </li>
                    
                    <li id="li2" class="menu">
                        <div id="myPage"><img src="<%= contextPath %>/resources/image/mypage.png" alt="프로필이미지"></div>
                        <ul id="subMenu" class="hide">
                        	<li>
                        		<div id="alert">message<hr>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a>
                        		</div>
                        	</li>
                            <li class="subMenuList"><a href="#">마이페이지</a></li>
                            <li class="subMenuList"><a href="#">개인정보수정</a></li>
                            <li class="subMenuList"><a href="<%= contextPath %>/list.fw?cpage=1&userId=<%=loginUser.getMemId()%>">친구목록</a></li>
                            <li class="subMenuList"><a href="#">로그아웃</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            
        </div>
    </div>
    
    <script>
    $(document).ready(function(){
        $(".menu>div").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });
	</script>
    
</body>
</html>