<%@page import="com.ovcos.feed.model.vo.Feeddetails"%>
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% Feeddetails m = (Feeddetails)request.getAttribute("m"); 
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feeddetail2.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
<%-- <%= contextPath %>'/views/feeddetail2.jsp' --%>


</head>
<body>
<%@ include file="../common/nav.jsp" %>

    <div id="course">
        <div id="left" class="floatWrap"> 
            <div id="feed1">
                <div style="border-bottom: 1px solid black;">
                    <div  id="feeds" >피드 상세</div>
                </div>
            </div>
            
            <div id="mypage1" >
                
                <span style="margin-left:15px;">
                    <img width="40px;"style="border-radius: 50%;" src="../../resources/image/mypage.png">
                    <br>
                      
                </span>
                <span>
                    <div>
                        <b id="name"><%=m.getMemId()%></b>
                    </div>
    
                    <div>
                        <div id="detail"><%=m.getFeedDate()%></div>
                    </div>
                </span>
            </div>
            
            <div style="border-bottom: 1px solid black; padding-bottom: 15px; padding-left: 15px;display: flex; ">
                <img src="../../resources/image/eye.png" style="width: 17px; margin-left: 15px;" alt=""><span></span>
                <img style="box-sizing: none;" id="love" src="../../resources/image/love.png" alt=""><span></span>
                <img  id="download1" src="../../resources/image/download.png" alt=""><span></span>
                
            </div>
            
                
            <!-- 피드 내용 -->
            <div id="run" align="center" style="border-bottom: 1px solid black;">
                <b>피드 내용</b>
                
            </div>
            <div id="distance" style="border-bottom: 1px solid black;">
                
                <div style="padding-left: 15px;">
                    <div id="feeds1" >
                       <%=m.getFeedCnt() %>
                    </div>
                </div>
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
    
            <div id="com" style="height: 280px; overflow:auto; height:290px;">
                 <div>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nisi illum dolorem qui blanditiis veniam assumenda quas molestiae ducimus, quia et odit eveniet aspernatur quis modi culpa at eos natus facere?
                </div>  
                
            </div>
            <div id="reply-area">
                <table style="margin: auto;">
                    <thead> 
                        <tr>
                            <th id="fontth">댓글</th>
                            <td style="padding-right: 0;">
                                <textarea rows="1" cols="40" style="resize: none; margin-top: 10px;"></textarea>
                            </td>
                            <td style="padding-right: 0;"><button  id="btn00" type="submit" class="btn btn-sm btn-info">전송</button></td>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
               
            
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