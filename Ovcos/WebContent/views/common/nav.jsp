<%@ page import="com.ovcos.loginRegister.model.vo.Member"%>
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
<!-- <title>OVCOS</title> -->

<!-- Favicon-->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico"/>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/favicon.png" sizes="16x16"/>

<link rel="stylesheet" href="<%= contextPath %>/resources/css/navStyle.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Black+Han+Sans&family=Fira+Sans:wght@400;700&family=Hahmlet:wght@400;500;600;700&family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@700;900&family=Oleo+Script&family=Oswald:wght@700&family=Quicksand:wght@300;400;500;600;700&family=Roboto:ital,wght@0,100;0,300;0,400;1,300&family=Rubik+Mono+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script> -->
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
                	<li id="checkAdmin">
                		<% if(loginUser.getMemId().equals("admin")){ %>
                        	관리자계정 접속중
                        <% } %>
                	</li>
                    <li id="li1">
                        <!-- <div id="feedEnrollBtn" class="btn" data-toggle="modal" data-target="#myModal">
                            <img src="<%= contextPath %>/resources/image/plus1.png" alt="">
                        </div> -->
                        
	                    <button type="button" id="feedEnrollBtn" onclick="location.href='<%=contextPath%>/to.feed'" >피드등록</button>
                        
                    </li>
                    
                    <li id="li2" class="menu">
                        <div id="myPage"><img src="<%= contextPath %>/resources/image/mypage.png" alt="프로필이미지"></div>
                        <ul id="subMenu" class="hide" style="margin-left:-55px;">
                        	<!-- <li>
                        		<div id="alert">message<hr>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a><br>
                        			<a href="#">이형근님이 회원님의 게시글에 좋아요를 눌렀습니다.</a>
                        		</div>
                        	</li> -->
                            <li class="subMenuList"><a href="<%= contextPath %>/myPage.me?userId=<%=loginUser.getMemId()%>">마이페이지</a></li>
                            <li class="subMenuList"><a data-toggle="modal" data-target="#checkPwd">개인정보수정</a></li>
                            <li class="subMenuList"><a href="<%= contextPath %>/list.fw?cpage=1&userId=<%=loginUser.getMemId()%>">친구목록</a></li>
                            <li class="subMenuList"><a href="<%= contextPath %>/logout.me">로그아웃</a></li>
                        </ul>
                    </li>
                    <%if(loginUser.getMemId().equals("admin")){ %>
                    <li id="li3" class="menu">
                        <a href="<%=contextPath %>/main.admin" class="btn btn-sm  btn-danger">관리자페이지</a>
                    </li>
                    <% }%>
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
	
	
	<!-- Modal -->
	<div class="modal fade" id="checkPwd" tabindex="-1" role="dialog" aria-labelledby="checkPwdLabel">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h4 class="modal-title" id="checkPwdLabel">본인확인</h4>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		
		      	<form action="<%= contextPath %>/editInfo.me?userId=<%=loginUser.getMemId()%>" method="post">
		      	<div class="modal-body">
	      			<input type="hidden" id="check-userId" name="check-userId" value="<%= loginUser.getMemId()%>">
	      			<input type="hidden" id="check-userPwd" name="check-userPwd" value="<%= loginUser.getMemPwd()%>">
		      		비밀번호를 입력하세요  <input type="password" name="inputPwd" id="inputPwd">
		      	</div>
		      	
		      	<div class="modal-footer">
		        	<button type="submit" class="btn btn-primary">인증하기</button>
		      	</div>
		      	</form>
	    	</div>
	  	</div>
	 </div>
    
</body>
</html>