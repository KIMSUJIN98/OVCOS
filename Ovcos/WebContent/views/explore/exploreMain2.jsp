<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMain.css">

</head>
<body>
<%@ include file="../common/nav.jsp" %>

    <div id="course">
        <div id="course_nav">
            <ul>
                <li class="li1">
                    <a href="">
                        <span class="nav1"><img src="../../resources/image/flagWhite.png" alt="깃발"></span>
                        <span class="li1text" align="center">코스검색</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="nav1"> <img src="../../resources/image/exploreuser.png" alt="유저"></span>
                        <span class="li2text" align="center">나의코스</span>
                    </a>
                </li>
            </ul>
        </div>
        <div id="course_left">
            <div id="sectiontop">
                <div id="title">코스검색</div>
                <div id="search">
                    <input type="text" name="searchcourse" placeholder="제목,코스명 검색">
                    <img src="../../resources/image/search.png" alt="">
                </div>
            </div>
            <div id="tab_manu">
                <ul>
                    <li>최신기록</li>
                    <li>인기기록</li>
                </ul>
            </div>
            <div id="left_content">
                <div id="content_list">
                    <div>
                        
                    </div>
                </div>
                <div id="list_page">
                    
                </div>
            </div>
        <div id="content">

            </div>
        </div>
    </div>

</body>
</html>