<%@page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Feed> list = (ArrayList<Feed>)request.getAttribute("list");
	Pageinfo pi = (Pageinfo)request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMain.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>

</head>
<body>
<%@ include file="../common/nav.jsp" %>

    <div id="course">
        <!-- course_nav 시작-->
        <div id="course_nav">
            <ul>
                <li class="li1">
                    <a onclick="location.href='<%=contextPath%>/course?epage=1'">
                        <span class="nav1"><img src="${pageContext.request.contextPath}/resources/image/flagWhite.png" alt="깃발"></span>
                        <span class="li1text" align="center">코스검색</span>
                    </a>
                </li>
                <li>
                    <a href="course/my">
                        <span class="nav1"> <img src="${pageContext.request.contextPath}/resources/image/exploreuser.png" alt="유저"></span>
                        <span class="li2text" align="center">나의코스</span>
                    </a>
                </li>
            </ul>
        </div>
        <!--course_nav 끝-->
        <!--course_left 시작-->
        <div id="course_left">
            <div id="sectiontop">
                <div id="title">코스검색</div>
                <div id="search">
                    <input type="text" name="searchcourse" placeholder="제목,코스명 검색">
                    <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색">
                    <!--여기에 form태그를 넣어야 할지 고민이다.-->
                </div>
            </div>
            <div id="tab_manu">
                <ul>
                    <li class="tabon tabon1">최신기록</li>
                    <li class="tabon1">인기기록</li>
                </ul>
            </div>
            <div id="left_content">
                <div id="content_list">
                    <!-- case 1  조회 결과가 없다.-->
                	<%if(list == null){ %>
				 		<p>조회된 결과가 없습니다.</p>
				 	<%}else{ %>
                    <!-- case 2 반복문으로  -->
                    	<%for(Feed f: list){ %>
                    <div>
                        <span class="list_num"><%=f.getFeedIndex() %></span>
                        <div class="innertext">
                            <h5><%=f.getFeedTitle() %></h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td><%=f.getDistance()%> km</td>
                                </tr>
                                <tr>
                                    <td>등록유저</td>
                                    <td><%=f.getMemId() %></td>
                                </tr>
                                <tr>
                                    <td>별점</td>
                                    <td><%=f.getFeedEval() %></td>
                                </tr>
                            </table>
                            <span><%=f.getFeedDate() %></span>
                        </div>
                    </div>
                    	<%} %>
                    <%} %>
                    
                </div>
                <div id="list_page">
                    <ul>
                    	<%if(currentPage != 1){ %>
                        	<li class="befpage" onclick="location.href='<%=contextPath%>/course?epage=<%=currentPage-1%>'">&lt;</li>
                        <%} else{%>
                        	<li class="befpage">&lt;</li>
                        <%} %>
                        <%for(int i = startPage; i<=endPage; i++){ %>
                        	<%if(i== currentPage){ %>
                        		<li class="pagenum on"><%=i%></li>
                        	<%}else{ %>
                        		<li class="pagenum" onclick="location.href='<%=contextPath%>/course?epage=<%=i%>'"><%=i%></li>
                        	<%} %>
                        <%} %>
                        <%if(currentPage != maxPage){ %>
                        	<li class="aftpage" onclick="location.href='<%=contextPath%>/course?epage=<%=currentPage+1%>'">&gt;</li>
                        <%} else{%>
                        	<li class="aftpage">&gt;</li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
        <!-- course_left 끝-->
        <div id="content">
            <div id="map"> 
                <script>
                    navigator.geolocation.getCurrentPosition(geoSuccess);
                    function geoSuccess(position) {
                    // 위도
                    const lat = position.coords.latitude;
                    // 경도
                    const lng = position.coords.longitude;
                    
                    setMap(lat, lng);
                    }

                    function setMap(lat, lng) {
                    // 위도, 경도 설정
                    var mapOptions = {
                        center: new naver.maps.LatLng(lat, lng),
                        zoom: 10
                    };
                    
                    var map = new naver.maps.Map('map', mapOptions);

                    
                    
                    var markers = [];

                    <%for(Feed f: list){%>
                        markers.push({position: new naver.maps.LatLng(<%=f.getStartLat()%>,<%=f.getStartLon()%>), path:'resources/gpx_upfiles/20230219114855-f_10634.gpx'})
                    <%}%>
                    

                    for (var i = 0; i < markers.length; i++) {
                        var marker = new naver.maps.Marker({
                            position: markers[i].position,
                            map: map
                        });

                        naver.maps.Event.addListener(marker, 'click', (function(marker, path) {
                            naver.maps.Event.once(map, 'init', function () {
                            $.ajax({
                                url: HOME_PATH +'/data/seorak.gpx',
                                dataType: 'xml',
                                success: startDataLayer
                            });
                        });
                        }));
                        function startDataLayer(xmlDoc) {
                            map.data.addGpx(xmlDoc);
                        }

                    }
                    }
                </script>
            </div>
        </div>
    </div>
    </div>
    </div>

    
    <script>
        $(function(){
            // 배열의 마커를 찍어보자
			
            var marker = null;
            
            




            $(".tabon1").click(function(){
                console.log("성공");
                $(this).addClass("tabon")
                //ajax로 left_content와 content를 리로딩 시켜야함
                $(this).siblings().removeClass("tabon");
            });

        })
    </script>

</body>
</html>