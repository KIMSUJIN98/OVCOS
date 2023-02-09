<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
<link rel="stylesheet" href="../../resources/css/exMain.css?문자열">
</head>
<body>
	<%@ include file="../common/nav.jsp" %>

    <div id="exMainWrap">
        <div id="course">
            <div id="course-nav">
                <div class="inner" id="inner1">
                    <img src="../../resources/image/flag.png" alt="깃발">
                    <div>코스검색</div>
                </div>
                <div class="inner" id="inner2">
                    <img src="../../resources/image/user.png" alt="유저이미지">
                    <div>나의코스</div>
                </div>
            </div>
            <div id="course-left">
                <div>
                    <h5>삼막사</h5>
                    3.4km
                </div>
                <div>
                    <h5>1등은 내꺼</h5>
                    1.2km
                </div>
                <div>
                    <h5>본격 망해암 업힐구간</h5>
                    1.72km
                </div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>

            <script>
                $(function(){
                    $("#inner1").click(function(){
                        $(this).css("backgroundColor","black");
                        $("#inner2").css("backgroundColor","white");
                    })
                    $("#inner2").click(function(){
                        $(this).css("backgroundColor","black");
                        $("#inner1").css("backgroundColor","white");
                    })
                   
                })
            </script>

            <!-- <div id="map"> 
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
    </div>-->

	
	

</body>
</html>