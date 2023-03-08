<%@page import="com.ovcos.loginRegister.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <!-- <script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js'></script> -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedEnrollForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navStyle.css">
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/canvg/1.5/canvg.min.js"></script> -->
    <!-- <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script> -->
    <!-- <script src="dom-to-image.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html-to-image/1.11.11/html-to-image.min.js" integrity="sha512-7tWCgq9tTYS/QkGVyKrtLpqAoMV9XIUxoou+sPUypsaZx56cYR/qio84fPK9EvJJtKvJEwt7vkn6je5UVzGevw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
    
    %>
    
    </head>
    <body>
        <div id="wrap">
            <div id="wrapnav">
                
                <div id="firstGroup">
                    <div id="logo">
                        <a href="/Ovcos/list.feed"><img src="/Ovcos/resources/image/logo.png" alt="ovcos 로고" id="logoimg"></a>
                        
                    </div>
                    <div id="menu">
                        <ul>
    
                            <li id="feed"><a href="/Ovcos/list.feed">피드</a></li>
                            <li id="explore"><a href="/Ovcos/course?epage=1">탐색</a></li>
                            <li id="challenge"><a href="/Ovcos/main.ch">챌린지</a>
                                <ul>
                                    <li><a href="/Ovcos/cntsMain.ch">대회</a></li>
                                    <li><a href="/Ovcos/ncList.ch?local=0">일반</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div id="lastGroup">
                    <ul>
                        <li id="li1">
                            <!-- <div id="feedEnrollBtn" class="btn" data-toggle="modal" data-target="#myModal">
                                <img src="/Ovcos/resources/image/plus1.png" alt="">
                            </div> -->
                            
                            <button type="button" id="feedEnrollBtn" onclick="location.href='/Ovcos/to.feed'">피드등록</button>
                            
                        </li>
                        
                        <li id="li2" class="menu">
                            <div id="myPage"><img src="/Ovcos/resources/image/mypage.png" alt="프로필이미지"></div>
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
                                <li class="subMenuList"><a href="/Ovcos/myPage.me?userId=user01">마이페이지</a></li>
                                <li class="subMenuList"><a href="/Ovcos/editInfo.me?userId=user01">개인정보수정</a></li>
                                <li class="subMenuList"><a href="/Ovcos/list.fw?cpage=1&amp;userId=user01">친구목록</a></li>
                                <li class="subMenuList"><a href="/Ovcos/logout.me">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                
            </div>
        </div>
        
    <!--         
        <div id="map" style="width: 600px; height: 600px;"></div> -->
        <div id="feedex">
            <div id="top">
                <div id="title">피드 등록</div>
            </div>
            <div id="mapContent">
                <div id="map"></div>
            </div>
            <form action="<%=contextPath%>/enroll.feed" id="enrollfrm" method="post" enctype="multipart/form-data">
                <div id="content">
                    <input type="hidden" name="userId" value="<%= loginUser.getMemId()%>">
                    <input type="hidden" name="startLon" id="startLon" value="">
                    <input type="hidden" name="startLat" id="startLat" value="">
                    <input type="hidden" name="distance" id="distance" value="">
                    <input type="hidden" name="imgPath" id="imgPath" value="">
    
                        <div style="display: flex; line-height: 30px;">
                            <label for="avatar" style="float: left;"><b>파일첨부 : &nbsp;</b></label>
                            <input type="file" name="avatar" id="avatar" accept=".gpx" style="margin-top: 8px;">
                            <div style="display: flex; float: right;" >
                                <b style="padding-top: 5px; padding-right: 5px; margin-left: 160px; float: left;">별점</b>
                                <div class="star-rating" style="display: flex;">
                                    <input type="radio" id="5-stars"
                                        name="rating" value="5" />
                                    <label for="5-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="4-stars"
                                        name="rating" value="4" />
                                    <label for="4-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="3-stars"
                                        name="rating" value="3" />
                                    <label for="3-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="2-stars"
                                        name="rating" value="2" />
                                    <label for="2-stars"
                                        class="star">&#9733;</label>
                                    <input type="radio" id="1-star"
                                        name="rating" value="1" />
                                    <label for="1-star"
                                        class="star">&#9733;</label>
                                </div>
                            </div>
                        </div>               
                    </div>
                
                    <table id="title2">
                        <tr>
                            <th style="box-sizing: content-box;">제목</th>
                            <td>
                                <input type="text" name="title" size="78" placeholder="제목입력해주세요" value=""
                                style="height: 40px;">
                            </td>
    
                        </tr>
                    </table>
                    <table id="text">
                        <tr>
                            <th style="padding-bottom: 190px;">내용</th>
                            <td>
                                <textarea name="content"  cols="80" rows="13" style="resize: none;"></textarea>
                            </td>
                        </tr>
                    </table>
                    <div style="display: flex;">
                        <div>
                            <b style="margin-left: 30px;">공개여부</b>
                            <select name="displayNy" id="displayNy">
                                <option value="전체">전채공개</option>
                                <option value="비공개">비공개</option>
                                <option value="친구">친구에게만</option>
                            </select>
                        </div>
                        <div>
                            <div style="margin-left: 300px;">
                                <b style="margin-right: 5px;">경로등록하기</b>
                                <select name="trackNy" id="trackNy">
                                    <option value="Y">등록</option>
                                    <option value="N">미등록</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="ff" style="display: flex; justify-content: space-between;">
                        <div id="dist1">총길이 :<span id="dist"></span></div>
                        <div>
                        <button type="reset" class="btn btn-primary"
                            id="reset">초기화</button>
                        <button type="submit" class="btn btn-primary"
                            id="insert" onclick="return fileSubmit()">제출</button>
                    </div>
                    </div>
                </div>
    
            </form>
        </div>

        <script src="${pageContext.request.contextPath}/resources/js/feedEnrollForm.js"></script>
    
        
    </body>
    </html>