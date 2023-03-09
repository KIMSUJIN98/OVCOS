<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Feed f = (Feed)request.getAttribute("f");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    th{
  padding-right: 90px;
  padding-left: 40px;
}

/* component */

.star-rating {
  /* border:solid 1px #ccc; */
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

/* explanation */

article {
  background-color:#ffe;
  box-shadow:0 0 1em 1px rgba(0,0,0,.25);
  color:#006;
  font-family:cursive;
  font-style:italic;    
  margin:4em;
  max-width:30em;
  padding:2em;
}

.modal-footer{
  position: relative;

}

#dist1{
  position: absolute;
  left: 50px;
  width: 300px;
}

#dist{
  position: absolute;
  left: 50px;
  width: 300px;
}

.modal-title{
  width: 100%;
  text-align: center;
}
#map{
  border: 1px solid rgb(163, 163, 163);
  width:700px;
  height:350px; 
  margin: auto; 
  
 }

</style>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
</head>

<body>

<%@ include file="../common/nav.jsp" %>


<div id=" wrap">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
    
            <!-- 모달헤더-->
            <div class="modal-header">
                <h4 class="modal-title"><b>피드 수정</b></h4>
                <button type="button" class="close"
                    data-dismiss="modal">&times;</button>
            </div>
    
            <!-- 모달바디 -->
            <div class="modal-body"
                style="padding-left: 0px; padding-right: 0px;">
                <form action="<%=contextPath %>/update.feed" method="post" id="updateform" enctype="multipart/form-data">
                    <input type="hidden" name="userId"
                        value="<%= loginUser.getMemId()%>">
                    <input type="hidden" name="startLon" id="startLon"
                        value="">
                    <input type="hidden" name="startLat" id="startLat"
                        value="">
                    <input type="hidden" name="distance" id="distance"
                        value="">
                    <table id="text1">
                        <div id="exmap"
                            style="width:799px;height:500px; margin: auto;">
                            <div id="map"
                                style="width:100%;height:100%;"></div>
                        </div>
    
                        <hr>
                        <div style=" display: flex;">
                            <div>
                                <label for="avatar"
                                    style="margin-left: 30px;"><b>파일 첨부
                                        :</b></label>
                                <input type="file" id="avatar"
                                    name="avatar" accept=".gpx">
                            </div>
                            <!--여기서부터-->
                            <div style="display: flex; float: right;">
                                <b style="padding-top: 5px; padding-right: 5px; margin-left: 160px;">별점</b>
                                <% String rating =  String.valueOf(f.getFeedEval()); %>
                                <div class="star-rating">
                                <input type="radio" id="5-stars" name="rating" value="5" <% if ("5".equals(rating)) out.print("checked"); %> />
                                <label for="5-stars" class="star">★</label>
                                <input type="radio" id="4-stars" name="rating" value="4" <% if ("4".equals(rating)) out.print("checked"); %> />
                                <label for="4-stars" class="star">★</label>
                                <input type="radio" id="3-stars" name="rating" value="3" <% if ("3".equals(rating)) out.print("checked"); %> />
                                <label for="3-stars" class="star">★</label>
                                <input type="radio" id="2-stars" name="rating" value="2" <% if ("2".equals(rating)) out.print("checked"); %> />
                                <label for="2-stars" class="star">★</label>
                                <input type="radio" id="1-star" name="rating" value="1" <% if ("1".equals(rating)) out.print("checked"); %> />
                                <label for="1-star" class="star">★</label>
                                </div>
                                </div>


                        </div>
                        <hr>
    
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title"
                                    size="62" placeholder="제목입력해주세요" value="<%=f.getFeedTitle() %>">
                            </td>
                        </tr>
                    </table>
                    <br>
                    <table id="text">
                        <tr>
                            <th style="padding-bottom: 100px;">내용</th>
                            <td>
                                <textarea name="content"  cols="62" rows="5" style="resize: none;"><%=f.getFeedCnt() %></textarea>
                            </td>
                        </tr>
    
                    </table>
    
    
    
            </div>
            <!-- 모달푸터-->
            <div style="display: flex;">
    
                <div>
                    <b style="margin-left: 50px;">공개여부</b>
                    <select name="displayNy" id="displayNy">
                        <option value="전체">전채공개</option>
                        <option value="비공개">비공개</option>
                        <option value="친구">친구에게만</option>
                    </select>
                    <script>
                    $(function(){ //피드공개여부 가져오기
                        $(function(){
                            $("#displayNy>option").each(function(){
                                if($(this).val() == "<%=f.getFeedPublicType()%>"){
                                $(this).attr("selected",true);
                                }
                            })
                        })
                    })
                    </script>

                </div>
                <div style="margin-left: 400px;">
                    <b style="margin-right: 5px;">경로등록하기</b>
                    <select name="trackNy" id="trackNy">
                        <option value="Y">등록</option>
                        <option value="N">미등록</option>
                    </select>
                </div>
                <script>
                    $(function(){ //경로공개여부 가져오기
                        $(function(){
                            $("#trackNy>option").each(function(){
                            	if($(this).text() == "<%=f.getFeedPathNy()%>"){
                                $(this).attr("selected",true);
                                }
                            })
                        })
                    })
                    </script>
            </div>
            <div class="modal-footer">
                <div id="dist1">총길이 :<span id="dist"></span></div>
                <button type="reset" class="btn btn-primary"
                    id="reset">초기화</button>
                <input type="submit" class="btn btn-primary"
                    id="insert" onclick="return fileSubmit()"></input>
            </div>
            </form>
        </div>
    </div>
    </div>







    <script>
            

            function startDataLayer(xmlDoc) {
                console.log(map.data)
                map.data.addGpx(xmlDoc);
                }
                    
                    var lat = 37.4923615;
                    var lng = 127.0292881;

                    var map = new naver.maps.Map('map',{
                        center:new naver.maps.LatLng(lat, lng),
                        zoom: 8
                    })

                    $.ajax({
                            url: '<%=contextPath%>/resources/gpx_upfiles/<%=f.getPath()%>',
                            dataType: 'xml',
                            strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                            strokeOpacity: 0.8, //선 투명도 0 ~ 1
                            strokeWeight: 5,   //선 두께
                            success: startDataLayer
                            
                            });
            
            
        function fileSubmit(){
           var title = $("input[name='title']");
           var file = document.getElementById('avatar');
           var content = $("textarea");

           if(file.files.length <1){
            alert("Gpx 파일을 선택해주세요");
            return false;
           }else{
                if(String(title.val()).length <1){
                    var len = file.files[0].name;
                    var s = String(len).lastIndexOf("g");
                    title.val(String(len).substring(0,s-1));
                    content.val(String(len).substring(0,s-1));
            }
            return true;
           }
        }

        $("#insert").click(function () {
            var last = $("#dist").text().lastIndexOf("k");
            $("#distance").val($("#dist").text().substring(0, last));
            $("#startLat").val(startLat);
            $("#startLon").val(startLon);
            $(":radio").each(function (index, value) {
                if ($(this).attr("checked")) {
                    $("#rate").val($(this).val());
                }
            })
        })
        $(function () {
            $("#reset").click(function () {
                $("#title").val("");
                $("textarea").val("");
                $("#avatar").val("");
                $(".star-rating label")
            })
        });
        $("#reset").click(function () {
            $("#map").css("visibility", "hidden");
            $("#dist").text("");
        })
        var polyline = null;
        var marker = null;
        var map = null;
        var array = [];
        var lats = [];
        var lons = [];
        var startLat = null;
        var startLon = null;
        // 거리구하는데 필요한 변수
        var sum = 0;
        function deg2rad(deg) {
            return (deg * Math.PI / 180)
        }
        function rad2deg(deg) {
            return (deg * 180 / Math.PI);
        }
        var R = 6371; // Radius of the earth in km
        var gpxFileInput = document.getElementById('avatar');
        gpxFileInput.addEventListener('change', handleFileSelect, false);

        function handleFileSelect(event) {
            array = [];
            lats = [];
            lons = [];
            sum = 0;
            var total ="";
            $("#map").remove();
            var map = "<div id='map' style='width:100%;height:100%;''></div>"
            $("#exmap").append(map);
            
            var file = event.target.files[0];
            var reader = new FileReader();
            
            reader.onload = function (event) {
                var gpx = $.parseXML(event.target.result);
                var trackPoints = $(gpx).find('trkpt');
                trackPoints.each(function (index, value) {
                    var lat = $(this).attr('lat');
                    var lon = $(this).attr('lon');
                    total += lat+","+lon+"|";
                    
                    
                    array.push(new naver.maps.LatLng(lat, lon));
                    lats.push(lat);
                    lons.push(lon);
                    if (index == 0) {
                        startLat = lat;
                        startLon = lon;
                    }
                });
                
                
                for (let i = 1; i < lats.length; i++) {
                    if (lats[i - 1] == lats[i]) {
                        dist = 0
                    } else {
                        var theta = lons[i - 1] - lons[i];
                        // console.log(theta)
                        var dist = Math.sin(deg2rad(lats[i - 1])) * Math.sin(deg2rad(lats[i])) + Math.cos(deg2rad(lats[i - 1])) * Math.cos(deg2rad(lats[i])) * Math.cos(deg2rad(theta));
                        dist = Math.acos(dist);
                        dist = rad2deg(dist);
                        dist = dist * 60 * 1.1515;
                        dist = dist * 1.609344;
                        if (dist === NaN) {
                            dist = 0;
                        }
                        sum += dist;
                    }
                }
                // hidden에 초기 위도와 경도 대입하기
                $("#startLat").val(startLat);
                $("#startLon").val(startLon);
                $("#distance").val(sum.toFixed(1));
                // 화면에 경로 표시하기
                $("#dist").text(sum.toFixed(2) + 'km');
                // 지도 표시
                var zom;
                var dist = sum;
                if(sum<2){
                    zom = 15;
                }else if(sum<10){
                    zom = 13;
                }else if(sum<50){
                    zom = 12;
                }else if(sum<90){
                    zom = 11;
                }else{
                    zom = 10;
                }
                map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(startLat, startLon),
                    zoom: zom
                });
                // 지도에 선 그리기
                polyline = new naver.maps.Polyline({
                    path: array,      //선 위치 변수배열
                    strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                    strokeOpacity: 0.8, //선 투명도 0 ~ 1
                    strokeWeight: 3,   //선 두께
                    map: map           //오버레이할 지도
                });
                //지도에 마커 표시하기
                marker = new naver.maps.Marker({
                    position: new naver.mapsavatar.LatLng(lats[lats.length - 1], lons[lons.length - 1]),
                    map: map,
                    icon: {
                        content: '<img src=/Ovcos/resources/image/endlocation4.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                        size: new naver.maps.Size(45, 45),
                        anchor: new naver.maps.Point(26, 40)
                    }
                });
                marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(startLat, startLon),
                    map: map,
                    icon: {
                         content: '<img src=/Ovcos/resources/image/location2.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                        size: new naver.maps.Size(45, 45),
                        anchor: new naver.maps.Point(26, 40)
                    }
                });
            };
            reader.readAsText(file);
        };
    </script>



</div>



</body>
</html>