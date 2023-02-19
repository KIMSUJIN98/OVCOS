<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Feed> allList = (ArrayList<Feed>)request.getAttribute("allList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedMainStyle.css?문자열">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Create.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedContent.css">

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/f54b74b3a0.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- feed관련 페이지 작성 -->
<%@ include file="../common/nav.jsp" %>

<script>
    
</script>

<div id="feedWrap">
        
            <div id="ct1">
                <div id="record">
                    <!-- 운동기록구역입니다 -->
                    <div id="recode1">
                        <div id="profile">
                            <div id="profile_img">
                                <img src="${pageContext.request.contextPath}/resources/image/mypage.png" alt="프로필이미지">
                            </div>
                            <a href="#" id="username"><h3><%= loginUser.getMemName() %></h3></a>
                            
                        </div>
                        <div id="ac_recode">
                            <div id="last_ac1">
                                <div class="h51"><h5>LAST ACTIVITY</h5></div>
                                <div id="last_info"><a href="#" id="f_title">피드제목&nbsp;<span>2023-02-11</span></a></div>
                                
                            </div>
                            <div id="last_ac2">
                                <div class="h51"><h5>THIS WEEK</h5></div>
                                <div id="km1" class="km">
                                    <a href="#">0km</a></div>
                            </div>
                            <div id="last_ac3">
                                <div class="h51" id="ac3_h5"><h5>THIS YEAR</h5></div>
                                <div id="km2" class="km"><a href="#">0km</a></div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div id="notice"><a href="<%=contextPath%>/list.no">서버 점검 예정 2023-03-03</a></div>
            </div>


            <div id="ct2">
                <div id="content_header">
                    <div id="btn_list">
                        <div id="all_feed"><a href="">전체피드</a></div>
                        <div id="fw_feed"><a href="">친구피드</a></div>
                        <div id="my_feed"><a href="">내피드</a></div>
                    </div>
                    <div id="feed_select">
                        <select name="" id="fs">
                            <option value="">최신순</option>
                            <option value="">오래된순</option>
                            <option value="">별점순</option>
                            <option value="">찜순</option>
                        </select>
                    </div>
                </div>

                <div id="content_feed">

                    <div id="feed_search">
                        <div id="f_select">
                            <select name="f_search_select" id="f_search_select">
                            <option value="">작성자</option>
                            <option value="">제목</option>
                            <option value="">내용</option>
                            </select>
                        </div>
                        <div id="f_search">
                            <input type="search" id="search" name="search" placeholder="피드검색">
                        </div>
                        <div id="search_btn">
                            <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색">
                        </div>
                    </div>
                    

                    <div class="feedContent">
                    
                    <!-- <iframe src="<%=contextPath%>/views/feed/feedContent.jsp"></iframe> -->
                    <% for(Feed f : allList) {%>
                        <div class="feeddiv">
					        <div class="feed_table">
					            <table border="0px" id="f_table">
					                <tr id="tr1">
					                    <td id="feed_profile" colspan="2">
					                        <div>
					                            <div id="p_img"><img src="${pageContext.request.contextPath}/resources/image/mypage.png" alt="프로필이미지"></div>
					                            <div id="p_name"><%=f.getMemId() %></div>
					                            <div id="p_loca"><%=f.getFeedDate() %></div>
					                        </div>
					                    </td>
					                    <td id="plus">
					                    <div>
					                        <img src="${pageContext.request.contextPath}/resources/image/more.png" alt="더보기 버튼">
					                    </div>
					                    </td>
					                </tr>
					                <tr>
					                    <td colspan="3" id="td2_1">
					                        <div id="f_title">
					                        <a href=""><%=f.getFeedTitle() %></a>
					                        </div>
					                    </td>
					                </tr>
					                <tr>
					                    <td colspan="3" id="f_content">
					                        <p><%=f.getFeedCnt() %></p>
					                    </td>
					                </tr>
					             
					                <tr>
					                    <td colspan="3" id="gpx">
					                        <div>
					                            <img src="${pageContext.request.contextPath}/resources/image/gpx_ex.png" alt="">
					                        </div>
					                    </td>
					                </tr>
					                <tr>
					                    <td >
					                        <div id="star">⭐⭐⭐⭐</div>
					                    </td>
					                    <td id="like">
					                        <i class="fa-regular fa-heart"></i>
					                    </td>
					                    <td id="comment">댓글</td>
					                </tr>
					            </table>  
					        
					        </div>
					    
					    </div><!-- feeddiv끝 -->
					       <% } %>
			
                    </div>

                    
                </div>
            </div>

            
            <div id="ct3">
                <div id="dust">미세먼지api 구역</div>
                <div id="weather">날씨 api 구역</div>
                <div id="footer">
                    <!-- 푸터구역 -->
                    <div id="f1">
                        <a href="#">약관&nbsp;</a> 
                        <a href="#">&nbsp;개인정보취급방침&nbsp;</a> 
                        <a href="#">&nbsp;고객센터&nbsp;</a>
                    </div>
                    <div>
                        <p> 
                        © 2023 KH OVCOS
                        </p>
                    </div>
                </div>
            </div>
    </div>

    <button type="button" class="btn btn-primary" data-toggle="modal"  data-target="#myModal">
        Open modal
    </button>


    <!-- The Modal -->
    <div class="modal" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="<%=contextPath %>/enroll.feed" method="post" id="enrollfrm" enctype="multipart/form-data">
                    	<input type="hidden" name="userId" value="<%= loginUser.getMemId()%>">
                    	<input type="hidden" name="startLon" id="startLon" value="">
                    	<input type="hidden" name="startLat" id="startLat" value="">
                    	<input type="hidden" name="distance" id="distance" value="">
                        <input type="hidden" name="rate" id="rate" value="">
                        <table id="text1">
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="title" size="62" placeholder="제목입력해주세요"></td>
                            </tr>
                        </table>
                        <br>
                        <table id="text">
                            <tr>
                                <th style="padding-bottom: 160px;">내용</th>
                                <td>
                                    <textarea type="text" name="content" cols="62" rows="7"
                                        style="resize: none;"></textarea>
                                </td>
                            </tr>

                        </table>
                        <hr>

                        <div style=" display: flex;">
                            <div>
                                <label for="avatar" style="margin-left: 30px;"><b>파일 첨부 :</b></label>
                                <input type="file" id="avatar" name="avatar" accept="">
                            </div>
                            <div style="display: flex; float: right;">
                                <b style="padding-top: 5px; padding-right: 5px; margin-left: 160px;">별점</b>
                                <div class="star-rating">
                                    <input type="radio" id="5-stars" name="rating" value="5" />
                                    <label for="5-stars" class="star">&#9733;</label>
                                    <input type="radio" id="4-stars" name="rating" value="4" />
                                    <label for="4-stars" class="star">&#9733;</label>
                                    <input type="radio" id="3-stars" name="rating" value="3" />
                                    <label for="3-stars" class="star">&#9733;</label>
                                    <input type="radio" id="2-stars" name="rating" value="2" />
                                    <label for="2-stars" class="star">&#9733;</label>
                                    <input type="radio" id="1-star" name="rating" value="1" />
                                    <label for="1-star" class="star">&#9733;</label>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div id="map" style="width:700px;height:350px; margin: auto;"></div>
                       
                    
                </div>


                <!-- Modal footer -->
                <div style="display: flex;">

                    <div>
                        <b style="margin-left: 50px;">공개여부</b>
                        <select name="displayNy" id="displayNy">
                            <option value="전체">전채공개</option>
                            <option value="비공개">비공개</option>
                            <option value="친구">친구에게만</option>
                        </select>
                    </div>
                    <div style="margin-left: 400px;">
                        <b style="margin-right: 5px;">경로등록하기</b>
                        <select name="trackNy" id="trackNy">
                            <option value="Y">등록</option>
                            <option value="N">미등록</option>
                        </select>
                        <!-- <input type="checkbox" name="trackNy" id="trackNy" value="" > -->
                    </div>
                </div>
                <div class="modal-footer">
                <div id="dist1">총길이 :<span id="dist"></span></div>
                    <button type="reset" class="btn btn-primary" id="reset">초기화</button>
                    <button type="submit" class="btn btn-primary" id="insert">작성</button>
                </div>
            </form>
            </div>
        </div>
    </div>


    <script>

        $("#insert").click(function(){
            var last = $("#dist").text().lastIndexOf("k");
            $("#distance").val($("#dist").text().substring(0,last));
            $("#startLat").val(startLat);
            $("#startLon").val(startLon);
            $(":radio").each(function(index, value){
                if($(this).attr("checked")){
                    $("#rate").val($(this).val());
                } 
            })
            
        })

            $(function(){
                    
                    $("#reset").click(function(){
                        $("#title").val("");
                        $("textarea").val("");
                        $("#avatar").val("");
                        $(".star-rating label")
                    })

                    
                
                
            });
            $("#reset").click(function(){
                $("#map").css("visibility","hidden");
                $("#dist").text("");
            })



            var polyline=null;
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
                return (deg*Math.PI/180)
            }
    
            function rad2deg(deg){
                return (deg*180/Math.PI);
            }
    
            var R = 6371; // Radius of the earth in km
    
            var gpxFileInput = document.getElementById('avatar');
            gpxFileInput.addEventListener('change', handleFileSelect, false);
    
            function handleFileSelect(event) {
                array = [];
                lats = [];
                lons = [];
                sum=0;
                $("#map").css("visibility","visible");
    
                
                var file = event.target.files[0];
                var reader = new FileReader();
    
                reader.onload = function (event) {
                    var gpx = $.parseXML(event.target.result);
                    var trackPoints = $(gpx).find('trkpt');
    
                    trackPoints.each(function (index, value) {
                        var lat = $(this).attr('lat');
                        var lon = $(this).attr('lon');
                        array.push(new naver.maps.LatLng(lat, lon));
                        lats.push(lat);
                        lons.push(lon);
                        if (index == 0) {
                            startLat = lat;
                            startLon = lon;
                        
                        }
    
                    });
                    //거리구하는 반복문
                    for(let i = 1; i<lats.length;i++){
                        if(lats[i-1] == lats[i]){
                            dist = 0
                        }else{
                            var theta = lons[i-1]-lons[i];
                            // console.log(theta)
                            var dist = Math.sin(deg2rad(lats[i-1])) * Math.sin(deg2rad(lats[i])) + Math.cos(deg2rad(lats[i-1])) * Math.cos(deg2rad(lats[i])) * Math.cos(deg2rad(theta));
                            
                            dist = Math.acos(dist);
                            dist = rad2deg(dist);
                            dist = dist*60*1.1515;
                            dist = dist*1.609344;
                            if(dist === NaN) {
                                dist = 0;
                            }
                            sum+=dist;
                        }
                        }
    
                    // hidden에 초기 위도와 경도 대입하기
                    $("#startLat").val(startLat);
                    $("#startLon").val(startLon);
                    $("#distance").val(sum.toFixed(1));
                    
                    // 화면에 경로 표시하기
                    $("#dist").text(sum.toFixed(2)+'km');
                    
    
    
                    // 지도 표시
                    map = new naver.maps.Map('map', {
                        center: new naver.maps.LatLng(startLat, startLon),
                        zoom: 11
                    });
    
                    // 지도에 선 그리기
                    polyline = new naver.maps.Polyline({
                        path: array,      //선 위치 변수배열
                        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                        strokeOpacity: 0.8, //선 투명도 0 ~ 1
                        strokeWeight: 2,   //선 두께
                        map: map           //오버레이할 지도
                    });
                    
                    //지도에 마커 표시하기
                    marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(startLat, startLon),
                        map: map
                    });
    
                };
                reader.readAsText(file);
            };
    </script>


</body>
</html>