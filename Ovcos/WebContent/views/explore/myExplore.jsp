<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMy.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>

</head>
<body>
<%@ include file="../common/nav.jsp" %>

    <div id="course">
        <!-- course_nav 시작-->
        <div id="course_nav">
            <ul>
                <li>
                    <a href="<%=contextPath%>/course?epage=1">
                        <span class="nav1"><img src="${pageContext.request.contextPath}/resources/image/flagGray.png" alt="깃발"></span>
                        <span class="li1text" align="center">코스검색</span>
                    </a>
                </li>
                <li class="li1">
                    <a href="course/my">
                        <span class="nav1"> <img src="${pageContext.request.contextPath}/resources/image/userWhite.png" alt="유저"></span>
                        <span class="li2text" align="center">나의코스</span>
                    </a>
                </li>
            </ul>
        </div>
        <!--course_nav 끝-->
        <!--course_left 시작-->
        <div id="course_left">
            <div id="sectiontop">
                <div id="title">나의코스</div>
                <div id="search">
                    <input type="text" name="searchcourse" placeholder="제목,코스명 검색">
                    <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색">
                    <!--여기에 form태그를 넣어야 할지 고민이다.-->
                </div>
            </div>
            <div id="tab_manu">
                <ul>
                    <li class="tabon tabon1">최신순</li>
                    <li class="tabon1">거리순</li>
                </ul>
            </div>
            <div id="left_content">
                <div id="content_list">
                    <div>
                        <span class="list_num">1</span>
                        <div class="innertext">
                            <h5>백두대간_20230212</h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td>xx.x km</td>
                                </tr>
                                <tr>
                                    <td>전체 시간</td>
                                    <td>xx:xx:xx</td>
                                </tr>
                                <tr>
                                    <td>평균 속도</td>
                                    <td>x.x km/h</td>
                                </tr>
                            </table>
                            <span>xxxx-xx-xx</span>
                        </div>
                    </div>
                    <div>
                        <span class="list_num">2</span>
                        <div class="innertext">
                            <h5>반포대교_20230212</h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td>xx.x km</td>
                                </tr>
                                <tr>
                                    <td>전체 시간</td>
                                    <td>xx:xx:xx</td>
                                </tr>
                                <tr>
                                    <td>평균 속도</td>
                                    <td>x.x km/h</td>
                                </tr>
                            </table>
                            <span>xxxx-xx-xx</span>
                        </div>
                    </div>
                    <div>
                        <span class="list_num">3</span>
                        <div class="innertext">
                            <h5>반포대교_20230212</h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td>xx.x km</td>
                                </tr>
                                <tr>
                                    <td>전체 시간</td>
                                    <td>xx:xx:xx</td>
                                </tr>
                                <tr>
                                    <td>평균 속도</td>
                                    <td>x.x km/h</td>
                                </tr>
                            </table>
                            <span>xxxx-xx-xx</span>
                        </div>
                    </div>
                    <div>
                        <span class="list_num">4</span>
                        <div class="innertext">
                            <h5>반포대교_20230212</h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td>xx.x km</td>
                                </tr>
                                <tr>
                                    <td>전체 시간</td>
                                    <td>xx:xx:xx</td>
                                </tr>
                                <tr>
                                    <td>평균 속도</td>
                                    <td>x.x km/h</td>
                                </tr>
                            </table>
                            <span>xxxx-xx-xx</span>
                        </div>
                    </div>
                    <div>
                        <span class="list_num">5</span>
                        <div class="innertext">
                            <h5>반포대교_20230212</h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td>xx.x km</td>
                                </tr>
                                <tr>
                                    <td>전체 시간</td>
                                    <td>xx:xx:xx</td>
                                </tr>
                                <tr>
                                    <td>평균 속도</td>
                                    <td>x.x km/h</td>
                                </tr>
                            </table>
                            <span>xxxx-xx-xx</span>
                        </div>
                    </div>
                    <div>
                        <span class="list_num">6</span>
                        <div class="innertext">
                            <h5>반포대교_20230212</h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td>xx.x km</td>
                                </tr>
                                <tr>
                                    <td>전체 시간</td>
                                    <td>xx:xx:xx</td>
                                </tr>
                                <tr>
                                    <td>평균 속도</td>
                                    <td>x.x km/h</td>
                                </tr>
                            </table>
                            <span>xxxx-xx-xx</span>
                        </div>
                    </div>
                </div>
                <div id="list_page">
                    <ul>
                        <li class="befpage">&lt;</li>
                        <li class="on pagenum">1</li>
                        <li class="pagenum">2</li>
                        <li class="pagenum">3</li>
                        <li class="pagenum">4</li>
                        <li class="pagenum">5</li>
                        <li class="aftpage">&gt;</li>
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
                        zoom: 12
                    };
                    
                    var map = new naver.maps.Map('map', mapOptions);
                    var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(lat, lng),
                    map: map,
                    clickable: true
                    });
                    }
                    
                </script>
            </div>
        </div>
    </div>
    </div>
    </div>

    <script>
        $(function(){
            $(".tabon1").click(function(){
                console.log("성공");
                $(this).addClass("tabon")
                //ajax로 left_content와 content를 리로딩 시켜야함
                $(this).siblings().removeClass("tabon");
            });

            $("#list_page>ul>li").click(function(){
                if($(this).text() != "<" && $(this).text() !=">"){
                    $(this).addClass("on");
                    $(this).siblings().removeClass("on");
                }
            })
        })
    </script>

<script>
                    

    var markers = [];

    navigator.geolocation.getCurrentPosition(geoSuccess);
    function geoSuccess(position) {
    // 위도
    var lat = position.coords.latitude;
    // 경도
    var lng = position.coords.longitude;
    console.log(lat);
    console.log(lng)
    }

    map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.4636544, 126.8219904),
        zoom: 13
    });

    

    var marker = new naver.maps.Marker({
        map:map,
        position: new naver.maps.LatLng(37.4636544, 126.8219904)
    })


    var hyeonjinHouse = new naver.maps.LatLng(36.30260, 127.33838);
    var jooyeokHouse = new naver.maps.LatLng(36.32611, 127.41263);


    // var markers = [];
    var infowindows = [];


    markers.push(new naver.maps.Marker({
        map: map,
        position: hyeonjinHouse
    }));

    infowindows.push(new naver.maps.InfoWindow({
        content: [
            '<div class="iw_inner">',
            '   <h3>현진이네 집</h3>',
            '</div>'
        ].join('')
    }));


    markers.push(new naver.maps.Marker({
        map: map,
        position: jooyeokHouse
    }));

    infowindows.push(new naver.maps.InfoWindow({
        content: [
            '<div class="iw_inner">',
            '   <h3>주역이네 집</h3>',
            '</div>'
        ].join('')
    }));

    for(let i=0; i<markers.length; i++){
        naver.maps.Event.addListener(markers[i], "click", function(e) {
            console.log("이벤트")
            if (infowindows[i].getMap()) {
                infowindows[i].close();
            } else {
                infowindows[i].open(map, markers[i]);
            }
        });
    }

    infowindows[0].open(map, markers[0]);
</script>


</body>
</html>